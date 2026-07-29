FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src


RUN ./mvnw clean package -DskipTests --no-transfer-progress


FROM eclipse-temurin:17-jre-alpine

RUN addgroup -g 1000 appuser && \
    adduser -u 1000 -G appuser -S appuser

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
