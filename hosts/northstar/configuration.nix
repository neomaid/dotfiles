{
  config,
  pkgs,
  ...
}:

{
  # nixpkgs.config = {
  #   allowUnfree = true;
  #   # allowBroken = true;
  # };
  # nixpkgs.overlays = [
  #   nix-vscode-extensions.overlays.default
  # ];

  users.users.alex = {
    name = "alex";
    home = "/Users/alex";
  };
  system.primaryUser = "alex";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.libgccjit
    pkgs.cmake
    # pkgs.jdk25
    pkgs.javaPackages.compiler.openjdk25
    pkgs.python314
    pkgs.nixfmt
    pkgs.sqlite

    pkgs.fastfetch
    pkgs.ani-cli
    pkgs.aria2
    pkgs.bat
    pkgs.htop
    pkgs.btop
    pkgs.curl
    pkgs.deno
    pkgs.doxygen
    pkgs.ffmpeg_8
    pkgs.git
    pkgs.gnupg
    pkgs.gnugrep
    pkgs.ripgrep
    pkgs.imagemagick
    pkgs.lazygit
    pkgs.lf
    pkgs.stow
    pkgs.tmux
    pkgs.tree
    pkgs.oh-my-posh
    pkgs.fzf
    pkgs.cloc
    pkgs.dockutil
    pkgs.nix-output-monitor

    pkgs.ghostty-bin
    pkgs._1password-gui
    pkgs._1password-cli
    pkgs.obsidian
    pkgs.utm
    pkgs.iina
    # pkgs.jetbrains-toolbox
    pkgs.keka
    pkgs.mos
    # pkgs.qbittorrent
    pkgs.dbeaver-bin
    pkgs.xcodes
    pkgs.betterdisplay
    # pkgs.discord
    pkgs.anki-bin
    pkgs.prismlauncher
    pkgs.wireshark
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    taps = [ ];
    brews = [
      "mas"
      "nvm"
      "wimlib"
    ];
    casks = [
      "helium-browser"
      "affinity"
      "autodesk-fusion"
      "hiddenbar"
      "linearmouse"
      "logi-options+"
      "lulu"
      "microsoft-office"
      "protonvpn"
      "sublime-text"
      "webex"
      "ltspice"
      "gimp"
      "obs"
      "jetbrains-toolbox"
      "arduino-ide"
      "firefox"
      "firefox@nightly"
      "karabiner-elements"
      "whatsapp"
      "discord"
      "balenaetcher"
      "steam"
      "qbittorrent"
      "signal"
      "element"
    ];
    # masApps = {
    #   "uBO Lite for Safari" = 6745342698;
    #   "1Password for Safari" = 1569813296;
    #   "AusweisApp" = 948660805;
    # };
  };

  fonts.packages = with pkgs; [
    _0xproto
    nerd-fonts._0xproto
    googlesans-code
  ];

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      # persistent-apps = [
      #   "/System/Applications/System Settings.app"
      #   "/System/Cryptexes/App/System/Applications/Safari.app"
      #   "/Applications/Firefox.app"
      #   "/Applications/Helium.app"
      #   "${pkgs.obsidian}/Applications/Obsidian.app"
      #   # "${pkgs.discord}/Applications/Discord.app"
      #   "/Applications/Discord.app"
      #   "/System/Applications/Music.app"
      #   "${pkgs.vscode}/Applications/Visual Studio Code.app"
      #   "${pkgs.ghostty-bin}/Applications/Ghostty.app"
      # ];
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  # TODO

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
