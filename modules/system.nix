{ pkgs, lib, ... }:
{
    users.users.jb = {
    isNormalUser = true;
    home = "/home/jb";
    description = "JB";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMq0tiV0y8TuAPUE8uHWWOBtjehzc4rXuywi5TziuLMp jb@nixos"
    ];
  };
}