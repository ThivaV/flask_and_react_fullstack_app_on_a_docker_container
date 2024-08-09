# Use the official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python3.9 \
    python3.9-dev \
    python3.9-venv \
    python3-pip \
    python3-wheel \
    nodejs \
    npm \
    supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install curl to add the NodeSource repository
RUN apt-get update
RUN apt-get install -y curl && curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Install Node.js and npm
RUN apt-get install -y nodejs=20.16.0-1nodesource1

# Upgrade npm to a specific version
RUN npm install -g npm@10.8.1

# Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the application code to the container
COPY . /app

# Remove node_modules
RUN cd /app/client && rm -rf node_modules/

# Install Flask
RUN pip3 install -r ./server/requirements.txt

# Install React dependencies
RUN cd /app/client && npm install

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose the ports the apps run on
EXPOSE 5000
EXPOSE 3000

# Command to run supervisord
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]