{
  pkgs,
  lib,
  ...
}:

{
  programs = {
    zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history = {
        size = 10000;
        ignoreAllDups = true;
        path = "$HOME/.zsh_history";
        ignorePatterns = [ "rm *" ];
      };

      shellAliases = {
        ls = "ls --color";
        ll = "ls -lah";
        c = "clear";

        gs = "git status -sb";
        gst = "git status";
        gaa = "git add .";
        gau = "git add -u";
        gap = "git add -p";
        gcm = "git commit -m";
        gca = "git commit -a -m";
        gl = "git log --oneline --graph --all";
      };
    };

    # TODO configure prompt
    starship = {
      enable = true;

      enableZshIntegration = true;
      settings = lib.importTOML ./../../config/starship-config.toml;
    };

    kitty = {
      enable = true;
    };

    ghostty = {
      enable = true;

      systemd.enable = true;
      enableZshIntegration = true;
      settings = {
        window-width = 120;
        window-height = 35;
        window-padding-color = "background";

        font-family = "0xProto Nerd Font Mono";
        font-size = 12;
        font-feature = "-liga, -calt";

        theme = "Rose Pine Moon";
      };
    };
  };
}
