package com.apprendrefr.config;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Garde-fous Flyway (sans base de données) : la configuration reste sûre et les fichiers de migration
 * respectent les règles. Ces vérifications évitent les erreurs qui empêcheraient l'application de démarrer.
 */
class FlywaySetupTest {

    private static final Path MIGRATIONS = Path.of("src/main/resources/db/migration");
    private static final Pattern NAME = Pattern.compile("V(\\d+)__([a-z0-9_]+)\\.sql");

    private static String read(String file) throws IOException {
        return Files.readString(Path.of(file));
    }

    @Test
    void flywayIsDeclaredWithItsMySqlModule() throws IOException {
        String pom = read("pom.xml");
        assertThat(pom).contains("<artifactId>flyway-core</artifactId>").contains("<artifactId>flyway-mysql</artifactId>");
    }

    @Test
    void existingDatabaseIsBaselinedAtVersion1_andNothingDangerousIsEnabled() throws IOException {
        String yml = read("src/main/resources/application.yml");
        assertThat(yml).contains("baseline-on-migrate: true").contains("baseline-version: 1")
                .contains("validate-on-migrate: true").contains("out-of-order: false");
        // repair-on-migrate et clean cacheraient une migration en échec ou effaceraient la base : jamais actifs
        for (String line : yml.split("\\R")) {
            String t = line.strip();
            if (t.startsWith("#")) continue;
            assertThat(t).as("ligne de configuration dangereuse").doesNotContain("repair-on-migrate")
                    .doesNotContain("clean-disabled").doesNotContain("clean-on-validation-error");
        }
    }

    @Test
    void flywayIsDisabledInTests_whichUseAnInMemoryH2Database() throws IOException {
        assertThat(read("src/test/resources/application-test.properties")).contains("spring.flyway.enabled=false");
        assertThat(read("src/main/resources/application-test.yml")).contains("flyway:").contains("enabled: false");
    }

    @Test
    void migrationFilesFollowTheNamingAndNumberingRules() throws IOException {
        assertThat(MIGRATIONS).isDirectory();
        Set<Integer> versions = new HashSet<>();
        try (Stream<Path> files = Files.list(MIGRATIONS)) {
            List<Path> sql = files.filter(p -> p.getFileName().toString().toLowerCase().endsWith(".sql")).toList();
            for (Path p : sql) {
                String name = p.getFileName().toString();
                Matcher m = NAME.matcher(name);
                assertThat(m.matches()).as("nom invalide : %s (attendu V<n>__description_en_minuscules.sql)", name).isTrue();
                int version = Integer.parseInt(m.group(1));
                assertThat(version).as("%s : la base existante est la version 1, le premier fichier est V2", name)
                        .isGreaterThanOrEqualTo(2);
                assertThat(versions.add(version)).as("numéro %d utilisé deux fois", version).isTrue();
                assertThat(Files.readString(p).strip()).as("%s est vide", name).isNotEmpty();
            }
        }
    }

    @Test
    void initDbDumpNoLongerCarriesTheOldFlywayHistory() throws IOException {
        // l'ancienne table contenait une migration 1 « en échec » qui aurait empêché Flyway de démarrer
        assertThat(read("init-db/frenchdb_8.sql")).doesNotContain("flyway_schema_history");
    }
}
