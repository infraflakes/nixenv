{
  config,
  pkgs,
  ...
}: {
  environment.etc."os-release".text = ''
    ANSI_COLOR="0;38;2;126;186;228"
    BUG_REPORT_URL="https://github.com/NixOS/nixpkgs/issues"
    BUILD_ID="26.05.20260213.a82ccc3"
    CPE_NAME="cpe:/o:nixos:nixos:26.05"
    DEFAULT_HOSTNAME=nixos
    DOCUMENTATION_URL="https://nixos.org/learn.html"
    HOME_URL="https://nixos.org/"
    ID=nixos
    ID_LIKE=""
    IMAGE_ID=""
    IMAGE_VERSION=""
    LOGO="nix-snowflake"
    NAME=NixOS
    PRETTY_NAME="IrisOS 1.0"
    SUPPORT_URL="https://nixos.org/community.html"
    VARIANT=""
    VARIANT_ID=""
    VENDOR_NAME=NixOS
    VENDOR_URL="https://nixos.org/"
    VERSION="26.05 (Yarara)"
    VERSION_CODENAME=yarara
    VERSION_ID="26.05"
  '';
}
