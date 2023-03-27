# Specify the base image
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache curl git make
RUN apk add --no-cache make


# Set AWS credentials and region
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_REGION

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_REGION=$AWS_REGION

# Set the working directory
WORKDIR /app

# Copy the source code to the container
COPY . /app

# Build the application
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
