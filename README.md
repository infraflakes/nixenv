### Personal flakes for NixOS setup. (ASUS FX507ZU4)

### CAUTION!

- Nix files in `syswide` directory are system-wide configurations (asusctl, bootloader, fonts, timezones, users, etc....) and the ones in `home` directory are home manager explicit options.

- Make sure you still have hardware-configuration.nix in /etc/nixos!

### How to install!

Clone the repo:

```
git clone nixos https://gitlab.com/infraflakes/nix-flakes.git nixos
```

Apply changes system wide:

```
cd nixos
sudo nixos-rebuild switch --impure --flake .#<hostname>
# or doas nixos-rebuild switch --impure --flake path:.#<hostname>
```

Then set up home manager:

```
home-manager switch --flake .#<username>@<hostname>
```

---
