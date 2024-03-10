{ pkgs, lib, ... }:
{
  environment.etc."nextcloud-admin-pass".text = "njZfd9$*V@eAA&";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "localhost";
    config.extraTrustedDomains = [ "37.205.13.132" ];
    config.adminuser = "JiriBenes";
    config.adminpassFile = "/etc/nextcloud-admin-pass";   
    config.defaultPhoneRegion = "CZ";                           # nastavení defaultní telefonní předvolby
    maxUploadSize = "5G";                                       # nastavení maximální velikosti uploadovaného souboru
    configureRedis = true;                                      # cachování - rychlejší načítání webu
  };
}
