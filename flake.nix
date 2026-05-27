{
  description = "Tone NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager for userspace config
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-darwin for macOS configuration
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-homebrew for managing homebrew installations on macOS
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # nixpkgs overlay for VSCode extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nix-homebrew,
      nix-vscode-extensions,
      ...
    }@inputs:
    let
      # TODO
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        # system = "aarch64-darwin";
        config.allowUnfree = true;
        overlays = [
          nix-vscode-extensions.overlays.default
        ];
      };

      configRevision = {
        system.configurationRevision = self.rev or self.dirtyRev or null;
      };
    in
    {
      # TODO
      packages."x86_64-linux".helium = pkgs.callPackage ./pkgs/helium.nix { };

      nixosConfigurations = {
        tone = nixpkgs.lib.nixosSystem {
          inherit pkgs;

          system = "x86_64-linux";
          specialArgs = { inherit inputs; };

          modules = [
            ./hosts/tone/configuration.nix
            ./modules/nixos/nvidia.nix
            ./modules/nixos/razer.nix
            ./modules/nixos/kde-plasma.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "home-manager-backup";
                users.alex = import ./hosts/tone/home.nix;
              };
            }

            # TODO
            {
              environment.systemPackages = with pkgs; [
                self.packages.${system}.helium
              ];
            }

            configRevision
          ];
        };
      };

      darwinConfigurations = {
        northstar = nix-darwin.lib.darwinSystem {
          inherit pkgs;

          system = "aarch64-darwin";
          specialArgs = { inherit inputs; };

          modules = [
            ./hosts/northstar/configuration.nix

            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "alex";
                autoMigrate = true;
              };
            }

            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "home-manager-backup";
                users.alex = import ./hosts/northstar/home.nix;
              };
            }

            configRevision
          ];
        };
      };
    };
}
