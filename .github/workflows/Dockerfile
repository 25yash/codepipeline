# Specify the base image
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache curl

# Set AWS credentials and region
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_REGION

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_REGION=$AWS_REGION

# Install the AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY . .

# Build the application
RUN make

# Set the entry point for the container
ENTRYPOINT ["./app"]

# Define the command to run when the container starts
CMD ["--help"]

# Push the image to AWS ECR
ARG ECR_REGISTRY
ARG ECR_REPOSITORY
ARG IMAGE_TAG

RUN $(aws ecr get-login --no-include-email --region $AWS_REGION) \
    && docker build --build-arg GITHUB_REPO_URL=https://github.com/25yash/codepipeline/tree/master/.github --build-arg AWS_ACCESS_KEY_ID=AKIASNEUBZ6C4EGR5QWC --build-arg AWS_SECRET_ACCESS_KEY=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 --build-arg AWS_REGION=us-east-1 --build-arg ECR_REGISTRY=yashgour_latest --build-arg ECR_REPOSITORY=yashgour --build-arg IMAGE_TAG=latest -t yashgour .
