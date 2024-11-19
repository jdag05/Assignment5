# Stage 1: Builder stage
FROM alpine:latest AS builder

# Copy the data.txt file into the container at /tmp directory
COPY data.txt /tmp/data.txt

# Stage 2: Final stage
FROM fedora:latest

# Copy the data.txt file from the builder stage to the root of the filesystem
COPY --from=builder /tmp/data.txt /

# Set the working directory to root for simplicity
WORKDIR /

# Command to print the contents of the file
CMD cat /data.txt