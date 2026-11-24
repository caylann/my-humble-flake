{
  description = "we're so back";
 
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 
  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      user = "caylann";
    in
    { 
      nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs user;
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
	      extraSpecialArgs = { inherit inputs user; };
              users.${user} = import ./hm/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };	
    };
}
