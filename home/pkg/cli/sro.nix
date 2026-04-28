{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [inputs.sro.packages.${pkgs.stdenv.hostPlatform.system}.default];
  home.file.".config/sro/config.sro".text = ''
    shell = `bash`;
    var shell workdir = `echo $HOME/dev`;
    sanctuary = $workdir;

    pr sro {
      url = `git@github.com:infraflakes/sro.git`;
      dir = `sro`;
      sync = `clone`;
      use = `.sro/main.sro`;
    }

    pr portfolio {
      url = `git@github.com:infraflakes/infraflakes.github.io.git`;
      dir = `portfolio`;
      sync = `clone`;
      use = `.sro/main.sro`;
    }

    pr srwc {
      url = `git@github.com:infraflakes/srwc.git`;
      dir = `srwc`;
      sync = `ignore`;
      use = `.sro/main.sro`;
    }
  '';
}
