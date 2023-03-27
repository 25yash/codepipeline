# Define the default target
.DEFAULT_GOAL := build

# Define the build target
build:
    @echo "Building the application..."
    go build -o executable

# Define the clean target
clean:
    @echo "Cleaning up..."
    rm -f executable

# Define the help target
help:
    @echo "Available targets:"
    @echo "  build: Build the application"
    @echo "  clean: Remove the executable"
    @echo "  help:  Show this help message"

.PHONY: build clean help
