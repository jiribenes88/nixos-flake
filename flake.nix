{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }; 

  outputs = { nixpkgs, ... } :
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      vps = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/vps/configuration.nix
          ./hosts/vps/vpsadminos.nix
          ./modules/system.nix
          ./modules/firewall.nix      # zapne firewal
        ];
      };    
    };
  };
  
    
  
}
