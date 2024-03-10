{ pkgs, lib, ... }:
{
  environment.etc."nextcloud-admin-pass".text = "njZfd9$*V@eAA&";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "localhost";
    https = true;
    config.extraTrustedDomains = [ "37.205.13.132" ];
    config.adminuser = "JiriBenes";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    
  };
}
