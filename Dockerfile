# Use the official Perl image as the base image
FROM perl:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Dancer2, JSON, Paws, AWS CLI, and any other dependencies
RUN cpanm Dancer2 JSON Paws \
    && apt-get update \
    && apt-get install -y awscli

# Copy the application files into the container
COPY TranslateController.pl .
COPY TranslateService.pl .

# Set AWS credentials as environment variables
ENV AWS_ACCESS_KEY_ID=<>
ENV AWS_SECRET_ACCESS_KEY=<>
ENV AWS_SESSION_TOKEN=<>

# Expose the port that Dancer2 will run on
EXPOSE 3000

# Command to run the application
CMD ["perl", "TranslateController.pl"]

