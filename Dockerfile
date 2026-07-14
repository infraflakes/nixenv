ARG USERNAME=nixenv
ARG HOSTNAME=nixenv

FROM alpine:latest
ARG USERNAME
ARG HOSTNAME

RUN apk add --no-cache fish curl git xz coreutils && \
    adduser -D -u 1000 -s /bin/fish $USERNAME && \
    mkdir -m 0755 /nix && chown $USERNAME:$USERNAME /nix

USER $USERNAME
WORKDIR /home/$USERNAME
ENV USER=$USERNAME
ENV HOME=/home/$USERNAME
ENV PATH="/home/$USERNAME/.local/bin:${PATH}"

RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon

# explicit hardware tuning & flake configuration
RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf && \
    echo "cores = 0" >> ~/.config/nix/nix.conf && \
    echo "auto-optimise-store = true" >> ~/.config/nix/nix.conf && \
    echo "max-jobs = auto" >> ~/.config/nix/nix.conf

RUN git clone --depth=1 https://github.com/infraflakes/nixenv && \
    . ~/.nix-profile/etc/profile.d/nix.sh && \
    nix run nixpkgs#home-manager -- switch --flake ./nixenv#${USERNAME}@${HOSTNAME}

RUN rm -r ~/nixenv

RUN curl -sSf https://raw.githubusercontent.com/infraflakes/kiru/main/install.sh | sh

RUN curl -sSf https://raw.githubusercontent.com/infraflakes/sutils/main/install.sh | sh

RUN git clone --depth=1 https://github.com/infraflakes/deploy

RUN kiru -c ~/deploy/nixenv.kiru sync

RUN . ~/.nix-profile/etc/profile.d/nix.sh && kiru -c ~/deploy/nixenv.kiru fn init dots

CMD ["sh", "-c", "/home/${USER}/.nix-profile/bin/fish"]
