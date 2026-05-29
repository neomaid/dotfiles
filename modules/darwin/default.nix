{
  config,
  pkgs,
  ...
}:

# Base configuration for all macOS/darwin hosts
{
  imports = [
    ../shared/fonts.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  users.users.alex = {
    name = "alex";
    home = "/Users/alex";
  };
  system.primaryUser = "alex";

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      persistent-apps = [
        "/System/Applications/System Settings.app"
        "/System/Cryptexes/App/System/Applications/Safari.app"
        "/Applications/Firefox.app"
        "/Applications/Helium.app"
        "${pkgs.obsidian}/Applications/Obsidian.app"
        "${pkgs.vesktop}/Applications/Vesktop.app"
        "/System/Applications/Music.app"
        "${pkgs.vscode}/Applications/Visual Studio Code.app"
        "${pkgs.ghostty-bin}/Applications/Ghostty.app"
      ];
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
