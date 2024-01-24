{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  }; 

  outputs = { nixpkgs, ... } :
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./vpsadminos.nix
          ./modules/system.nix
        ];
      };    
    };
  };
  
    
  
}
