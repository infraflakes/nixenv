{
  config,
  pkgs,
  lib,
  ...
}:

let
  configDir = ../../config;

  # Read the directory and filter for subdirectories
  dirs = lib.filterAttrs (_: type: type == "directory") (builtins.readDir configDir);
in
{
  home.file = lib.mapAttrs' (name: _: {
    name = ".config/${name}";
    value = {
      source = "${configDir}/${name}";
      recursive = true;
    };
  }) dirs;
}
