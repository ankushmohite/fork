# Stage 2: Create a lightweight image with only the necessary files
FROM tomcat

# Copy the .war file from the builder stage to the Tomcat webapps directory
COPY ./target/*.war /usr/local/tomcat/webapps/

# Expose the port on which Tomcat will run
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]



