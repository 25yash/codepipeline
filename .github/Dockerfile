# Specify the base image
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache curl git make

# Set AWS credentials and region
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_REGION

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_REGION=$AWS_REGION

# Set the working directory
WORKDIR /app

# Fetch source code from GitHub
ARG GITHUB_REPO_URL = https://github.com/your/repo.git
RUN git clone $GITHUB_REPO_URL /app

# Build the application
WORKDIR /app
RUN make build

# Push the image to AWS ECR
ARG ECR_REGISTRY
ARG ECR_REPOSITORY
ARG IMAGE_TAG

RUN $(aws ecr get-login --no-include-email --region $AWS_REGION) \
    && docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .

# Define the entry point for the container
ENTRYPOINT [ "/app/executable" ]

# Define the command to run when the container starts
CMD [ "default-arg" ]
