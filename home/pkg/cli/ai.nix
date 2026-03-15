{
  config,
  pkgs,
  ...
}: let
  nvidia = "cuda";
  amd = "rocm";
in {
  home = {
    sessionVariables = {
      OLLAMA_KV_CACHE_TYPE = "q4_0";
      OLLAMA_FLASH_ATTENTION = "1";
    };
    packages = [
      (pkgs.ollama.override {
        acceleration = nvidia;
      })
    ];
  };
  programs.opencode = {
    enable = true;
    settings = {
      "$schema" = "https://opencode.ai/config.json";
      model = "ollama/qwen:latest";

      provider = {
        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama (Local)";
          options = {
            baseURL = "http://localhost:11434/v1";
            max_tokens = 1024;
          };
          models = {
            "qwen" = {
              name = "Qwen3 (Quantized)";
              tools = true;
              reasoning = true;
              reasoningEffort = "high";
            };
          };
        };
      };

      permission = {
        bash = "allow";
        list = "allow";
        read = "allow";
        webfetch = "allow";
        write = "allow";
      };

      # Assigning tools to the Build mode
      mode = {
        build = {
          tools = {
            bash = true;
            list = true;
            read = true;
            webfetch = true;
            write = true;
          };
        };
      };
    };
  };
}
