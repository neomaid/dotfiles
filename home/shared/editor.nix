{ pkgs, ... }:

let
  inherit (pkgs) stdenv;
in
{
  programs = {
    vscode = {
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
            "key" = if stdenv.isDarwin then "cmd+[Backslash]" else "ctrl+[Backslash]";
            "command" = "editor.action.commentLine";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = if stdenv.isDarwin then "shift+cmd+7" else "shift+ctrl+7";
            "command" = "-editor.action.commentLine";
            "when" = "editorTextFocus && !editorReadonly";
          }
        ];

        extensions = with pkgs.vscode-marketplace; [
          # Languages
          redhat.java
          vscjava.vscode-java-debug
          vscjava.vscode-java-test
          vscjava.vscode-java-dependency
          vscjava.vscode-maven
          ms-python.python
          jnoortheen.nix-ide
          tamasfe.even-better-toml

          # Utilities
          esbenp.prettier-vscode
          codezombiech.gitignore
          aaron-bond.better-comments

          # Themes
          mvllow.rose-pine
          pkief.material-icon-theme
        ];
      };
    };
  };
}
