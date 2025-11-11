# Use the official openjdk image as the base image
FROM openjdk:11-jre-slim
 
# Set the WireMock version
ENV WIREMOCK_VERSION 2.27.2
 
# Install wget
RUN apt-get update && apt-get install -y wget
 
# Download and install WireMock
RUN wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/${WIREMOCK_VERSION}/wiremock-jre8-standalone-${WIREMOCK_VERSION}.jar -O /wiremock.jar
 
# Expose the WireMock port
EXPOSE 8080
 
# Define the entry point to run WireMock
ENTRYPOINT ["java", "-jar", "/wiremock.jar"]
 
# Default command to run WireMock
CMD ["--verbose"]