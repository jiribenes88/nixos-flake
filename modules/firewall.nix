{ pkgs, lib, ... }:
{
  networking.firewall.enable = true;      #zablokuje všechny porty
  networking.firewall.allowedTCPPorts = [ 22 ];
}
