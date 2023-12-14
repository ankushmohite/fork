# Use an official OpenJDK runtime as the base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the .war file into the container
COPY your-login-web-app.war /app/your-login-web-app.war

# Expose the port on which your app will run (adjust as needed)
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "your-login-web-app.war"]


