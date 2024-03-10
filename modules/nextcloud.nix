{ pkgs, lib, ... }:
{
  environment.etc."nextcloud-admin-pass".text = "njZfd9$*V@eAA&";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    # hostName = "localhost";
    config.extraTrustedDomains = [ 37.205.13.132 ];
    config.adminuser = "JiriBenes";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    
    # Instead of using pkgs.nextcloud28Packages.apps,
    # we'll reference the package version specified abov
    extraApps = {
      inherit (services.nextcloud.package.packages.apps) contacts calendar;
    };
    extraAppsEnable = true;
  };
}
