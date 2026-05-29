{ pkgs, ... }:

let
  inherit (pkgs) stdenv;
in
{
  imports = [
    ./terminal.nix
    ./editor.nix
    ./desktop.nix
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

  home.sessionVariables = {
    EDITOR = "nano";
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;

      settings = {
        user = {
          name = "neomaid";
          email = "me@maid.dev";
        };
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };

      signing = {
        format = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPGjooEn/yj4qIGy7zeCe/WvdG2ucFSKSad0f9EJz05c";
        signer =
          if stdenv.isDarwin then
            "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
          else
            "${pkgs._1password-gui}/bin/op-ssh-sign";
        signByDefault = true;
      };

      includes = [
        {
          condition = "gitdir:~/dev/uni/";
          path = "~/dev/uni/.gitconfig_uni";
        }
        {
          condition = "gitdir:~/Developer/uni/";
          path = "~/dev/uni/.gitconfig_uni";
        }
      ];

      ignores = [
        ".DS_Store"
      ];
    };
  };
}
