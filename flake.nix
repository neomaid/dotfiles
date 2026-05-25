{
  description = "Tone NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager for userspace config
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixpkgs overlay for VSCode extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      ...
    }@inputs:
    let
      # TODO
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [
          nix-vscode-extensions.overlays.default
        ];
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
            ./hosts/tone/tone.nix
            ./modules/nixos/nvidia.nix
            ./modules/nixos/razer.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "home-manager-backup";
                users.alex = import ./home/home.nix;
              };
            }

            # TODO
            {
              environment.systemPackages = with pkgs; [
                self.packages.${system}.helium
              ];
            }
          ];
        };
      };

      # TODO
      # darwinConfigurations = {

      # };
    };
}
