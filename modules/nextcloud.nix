{ pkgs, lib, ... }:
{
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
  };
}
