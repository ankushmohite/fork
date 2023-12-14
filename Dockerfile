# Stage 1: Build the LoginWebApp
FROM maven:3.8.3-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the project files
COPY . .

# Build the application
RUN mvn clean package

# Stage 2: Create a lightweight image with only the necessary files
FROM tomcat:9-jdk11

# Set the working directory in the container
WORKDIR /usr/local/tomcat/webapps

# Copy the .war file from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/LoginWebApp.war .

# Expose the port on which Tomcat will run
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]



