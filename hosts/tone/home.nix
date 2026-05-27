{
  pkgs,
  lib,
  ...
}:
# TODO add systemd service for tartarus-pro-joystick-util
{
  imports = [
    ../../home/shared
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # dev stuff
    libgccjit
    cmake
    jdk25
    python3
    nixfmt
    alejandra
    sqlite

    # commandline utilities
    nano
    tree
    ani-cli
    curl
    doxygen
    ffmpeg_8
    imagemagick
    stow
    cloc
    nurl
    nix-output-monitor
    nix-init
    nvtopPackages.nvidia

    # desktop apps
    ungoogled-chromium
    polychromatic
    discord
    signal-desktop
    cider-2
    qbittorrent
    filezilla
    gimp
    pavucontrol

    # games
    mangohud
    xivlauncher
    prismlauncher
    heroic
    protonplus
  ];

  # TODO configure default values
  programs.ssh = {
    enable = true;

    matchBlocks."*" = {
      identityAgent = "~/.1password/agent.sock";
    };
  };

  programs.lazygit = {
    enable = true;

    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.lf = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.aria2 = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };

  programs.gpg = {
    enable = true;
  };

  programs.grep = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.obsidian = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
  };

  programs.mpv = {
    enable = true;
  };
}
