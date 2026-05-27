{
  pkgs,
  lib,
  ...
}:

{
  # imports = [
  #   ../../home/shared
  # ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "alex";
    homeDirectory = "/Users/alex";
  };

  # imports = [
  #   ./dock
  # ];

  # Packages that should be installed to the user profile.
  home.packages = [
  ];

  # home.sessionVariables = {
  #   EDITOR = "vim";
  # };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Rosé Pine Moon (no italics)";
        "workbench.iconTheme" = "material-icon-theme";
        "editor.fontFamily" = "0xProto Nerd Font";
        "terminal.integrated.fontFamily" = "Monaco";
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "chat.disableAIFeatures" = true;
        "terminal.integrated.initialHint" = false;
      };

      keybindings = [
        {
          "key" = "cmd+[Backslash]";
          "command" = "editor.action.commentLine";
          "when" = "editorTextFocus && !editorReadonly";
        }
        {
          "key" = "shift+cmd+7";
          "command" = "-editor.action.commentLine";
          "when" = "editorTextFocus && !editorReadonly";
        }
      ];

      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide

        redhat.java
        vscjava.vscode-java-debug
        vscjava.vscode-java-test
        vscjava.vscode-java-dependency

        codezombiech.gitignore

        mvllow.rose-pine
        esbenp.prettier-vscode
        pkief.material-icon-theme
      ];
    };
  };

  # broken
  # programs.anki = {
  #   enable = true;
  # };

  # local.dock = {
  #   enable = true;
  #   # username = "alex";
  #   entries = [
  #     { path = "/System/Applications/System Settings.app"; }
  #     { path = "/System/Cryptexes/App/System/Applications/Safari.app"; }
  #     { path = "/Applications/Firefox.app"; }
  #     { path = "/Applications/Helium.app"; }
  #     { path = "${pkgs.obsidian}/Applications/Obsidian.app"; }
  #     { path = "/Applications/Discord.app"; }
  #     # { path = "${pkgs.discord}/Applications/Discord.app"; }
  #     { path = "/System/Applications/Music.app"; }
  #     { path = "${pkgs.vscode}/Applications/Visual Studio Code.app"; }
  #     { path = "${pkgs.ghostty-bin}/Applications/Ghostty.app"; }
  #   ];
  # };
}
