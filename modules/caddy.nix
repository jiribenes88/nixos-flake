{ pkgs, lib, config, ... }:
{
  services.caddy = {
    enable = true;
    virtualHosts."nc.jbenes.cz".extraConfig = ''
      reverse_proxy http://localhost:8080
    '';
  };
}
