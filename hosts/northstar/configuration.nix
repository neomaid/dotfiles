{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/darwin
  ];

  # nixpkgs.config = {
  #   allowUnfree = true;
  #   # allowBroken = true;
  # };
  # nixpkgs.overlays = [
  #   nix-vscode-extensions.overlays.default
  # ];

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

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;
}
