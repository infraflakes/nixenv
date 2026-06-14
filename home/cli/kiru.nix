{ ... }:
{
  home.file.".config/kiru/main.kiru".text = ''
    shell = `bash`;
    var shell workdir = `echo $HOME/test`;
    sanctuary = $workdir;

    pr kiru {
      url = `git@github.com:infraflakes/kiru.git`;
      dir = `kiru`;
      sync = `clone`;
      include = `.kiru/main.kiru`;
    }

    pr portfolio {
      url = `git@github.com:infraflakes/infraflakes.github.io.git`;
      dir = `portfolio`;
      sync = `clone`;
      include = `.kiru/main.kiru`;
    }

    pr srwc {
      url = `https://github.com/infraflakes/srwc.git`;
      dir = `srwc`;
      sync = `ignore`;
      branch = `architectural-cleanups`;
      include = `.kiru/main.kiru`;
    }
  '';
}
