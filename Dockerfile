# Use the official Nix image for the best compatibility and smallest footprint
FROM nixos/nix:latest

# Install prerequisites

RUN apk add --no-cache fish git

# Enable required experimental features for Flakes
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

# Create the 'nixdev' user
RUN adduser -D -h /home/nixdev nixdev
USER nixdev
WORKDIR /home/nixdev

# Clone the specific branch
RUN git clone -b container https://gitlab.com/infraflakes/nix-flakes container

WORKDIR /home/nixdev/container

# Define the build argument for hostname (can be overridden at build time)
ARG HOSTNAME=container-env
ENV USERNAME=nixdev

# Build and run the Home Manager activation package
RUN nix run .#homeConfigurations.${USERNAME}@${HOSTNAME}.activationPackage

# Set the entrypoint to a shell or your nix run command
CMD ["/usr/bin/fish"]
