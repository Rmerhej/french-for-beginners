FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copie les fichiers Maven wrapper + pom + sources
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src

# Build (corrigé + optimisation)
RUN ./mvnw clean package -DskipTests --no-transfer-progress

# Image runtime légère
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

# Pour la production
ENV SPRING_PROFILES_ACTIVE=prod

# Options JVM recommandées pour conteneur
ENTRYPOINT ["java", \
    "-XX:+UseContainerSupport", \
    "-XX:MaxRAMPercentage=75.0", \
    "-jar", "app.jar"]
