{
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../../home/shared
    ../../home/darwin/hid.nix
  ];

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
