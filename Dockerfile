FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src


RUN ./mvnw clean package -DskipTests --no-transfer-progress


FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

RUN mkdir -p /app/uploads/images \
    && mkdir -p /app/uploads/audio

COPY ./uploads /app/uploads

EXPOSE 8080

# Pour la production
ENV SPRING_PROFILES_ACTIVE=prod


ENTRYPOINT ["java", \
    "-XX:+UseContainerSupport", \
    "-XX:MaxRAMPercentage=75.0", \
    "-jar", "app.jar"]
