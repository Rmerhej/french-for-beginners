# Image compatible avec les serveurs classiques (amd64) ET les serveurs ARM (Oracle A1) :
# les images « alpine » de Java 17 n'existent pas pour ARM, on prend la version Ubuntu (jammy).
# Le .jar est le même partout : il est construit une seule fois, sur la machine de build.
FROM --platform=$BUILDPLATFORM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src


RUN ./mvnw clean package -DskipTests --no-transfer-progress


FROM eclipse-temurin:17-jre-jammy

RUN groupadd -g 1000 appuser && \
    useradd -u 1000 -g appuser -r -M -s /usr/sbin/nologin appuser

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

RUN mkdir -p /app/uploads/images /app/uploads/audio && \
    chown -R appuser:appuser /app/uploads && \
    chmod -R 775 /app/uploads

COPY --chown=appuser:appuser uploads/images/ /app/uploads/images/
COPY --chown=appuser:appuser uploads/audio/ /app/uploads/audio/
USER appuser

EXPOSE 8080

# Pour la production
ENV SPRING_PROFILES_ACTIVE=prod


ENTRYPOINT ["java", \
    "-XX:+UseContainerSupport", \
    "-XX:MaxRAMPercentage=75.0", \
    "-jar", "app.jar"]
