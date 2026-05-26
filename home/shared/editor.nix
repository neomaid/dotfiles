{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;

      profiles.default = {
        userSettings = {
          "workbench.colorTheme" = "Rosé Pine Moon (no italics)";
          "workbench.iconTheme" = "material-icon-theme";
          "editor.fontFamily" = "0xProto Nerd Font";
          "editor.formatOnSave" = true;
          "editor.minimap.enabled" = false;
          "chat.disableAIFeatures" = true;
          "terminal.integrated.initialHint" = false;
        };

        keybindings = [
          {
            "key" = "ctrl+[Backslash]";
            "command" = "editor.action.commentLine";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "shift+ctrl+7";
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
