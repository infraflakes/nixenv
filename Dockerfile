ARG USERNAME=nixenv

FROM alpine:edge
ARG USERNAME

RUN apk add --no-cache curl fish git xz ca-certificates procps shadow

ENV LANG=en_US.UTF-8

RUN useradd -m -s /usr/bin/fish -u 1000 $USERNAME

RUN curl -sSfL https://install.lix.systems/lix | sh -s -- install linux --init none --no-confirm
RUN chown -R $USERNAME:$USERNAME /nix

USER $USERNAME
WORKDIR /home/$USERNAME
ENV USER=$USERNAME
ENV HOME=/home/$USERNAME

ENV PATH="/nix/var/nix/profiles/default/bin:/home/$USERNAME/.nix-profile/bin:/home/$USERNAME/.local/bin:${PATH}"

RUN curl -sSf https://raw.githubusercontent.com/infraflakes/sutils/main/install.sh | sh

RUN git clone https://github.com/infraflakes/nixenv nix

WORKDIR ./nix

RUN nix-shell -p home-manager --run 'home-manager switch --flake .#nixenv@container'

RUN jj git init --colocate

RUN hx -g fetch && hx -g build

ENV SHELL=/usr/bin/fish

WORKDIR /home/$USERNAME

CMD ["fish"]
