# Start from the official Jenkins image
FROM jenkins/ssh-agent:latest

# Switch to root user
USER root

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common

# Add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add Docker repository to apt sources
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Update apt sources again
RUN apt-get update

# Install Docker and Docker Compose
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

# Add Jenkins user to Docker group
RUN usermod -aG docker jenkins