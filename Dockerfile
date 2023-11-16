# Use the official Perl image as the base image
FROM perl:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Dancer2, JSON, Paws, AWS CLI, and any other dependencies
RUN cpanm Dancer2 JSON Paws \
    && cpanm Test::Class \
    && apt-get update \
    && apt-get install -y awscli

# Copy the application files into the container
COPY TranslateController.pl .
COPY TranslateService.pm .
COPY TestBase.pm .
COPY TranslateServiceTest.pm .

# Expose the port that Dancer2 will run on
EXPOSE 3000

# Command to run the application
CMD ["perl", "TranslateController.pl"]
