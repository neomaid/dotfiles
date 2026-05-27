{
  pkgs,
  lib,
  ...
}:

let
  inherit (pkgs) stdenv;
in
{
  programs = {
    # TODO configure zsh
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

    # TODO switch to kitty
    kitty = {
      enable = true;
    };

    ghostty = {
      enable = true;
      # Use ghostty-bin on darwin since ghostty is not available
      package = lib.mkIf stdenv.isDarwin pkgs.ghostty-bin;

      # Enable systemd user service on Linux
      systemd.enable = lib.mkIf stdenv.isLinux true;
      enableZshIntegration = true;
      settings = {
        window-width = 120;
        window-height = 35;
        window-padding-color = "background";

        font-family = "Google Sans Code";
        font-size = 12;
        font-feature = "-liga, -calt";

        theme = "vesper";

        # Disable mouse capture with shift (enable clickable hyperlinks in e.g. tmux with shift+cmd)
        mouse-shift-capture = "never";
      };
    };
  };
}
