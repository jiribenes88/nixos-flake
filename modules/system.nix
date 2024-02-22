{ pkgs, lib, ... }:
{
  # vytvoření uživatele jb
  users.users.jb = {
  isNormalUser = true;
  home = "/home/jb";
  description = "JB";
  extraGroups = ["networkmanager" "wheel"];
  openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMq0tiV0y8TuAPUE8uHWWOBtjehzc4rXuywi5TziuLMp jb@nixos"
    ];
  };

  # Systémové balíčky
  environment.systemPackages = with pkgs; [
    git
    lf
    mc
    neovim
    vim
  ];

  # Enable Flakes and the new command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
