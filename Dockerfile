# Build stage
FROM eclipse-temurin:25-jdk-alpine AS build

WORKDIR /workspace/app

# Copy gradle files
COPY gradle gradle
COPY gradlew .
COPY build.gradle .
COPY settings.gradle .

# Download dependencies
RUN ./gradlew dependencies --no-daemon

# Copy source code
COPY src src

# Build application
RUN ./gradlew bootJar --no-daemon

# Runtime stage
FROM eclipse-temurin:25-jre-alpine

WORKDIR /app

# Copy built jar from build stage
COPY --from=build /workspace/app/build/libs/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
