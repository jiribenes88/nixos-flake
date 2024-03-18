{ pkgs, lib, config, ... }:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "localhost";
    https = true;
    database.createLocally = true;				# vytvoří lokální databázi
    config.dbtype = "pgsql";					# vytvoří lokální databázi PostgreSQL
    config.extraTrustedDomains = [ "nc.jbenes.cz" ];		# věřit doménovému jménu
    config.trustedProxies = [					# nastavení důvěryhodných proxy (v našem případě CloudFlare serverů)
	"173.245.48.0/20"
	"103.21.244.0/22"
	"103.22.200.0/22"
	"103.31.4.0/22"
	"141.101.64.0/18"
	"108.162.192.0/18"
	"190.93.240.0/20"
	"188.114.96.0/20"
	"197.234.240.0/22"
	"198.41.128.0/17"
	"162.158.0.0/15"
	"104.16.0.0/13"
	"104.24.0.0/14"
	"172.64.0.0/13"
	"131.0.72.0/22"
    ];
    config.adminuser = "JiriBenes";
    config.adminpassFile = "/etc/nextcloud-admin-pass";   
    config.defaultPhoneRegion = "CZ";				# nastavení defaultní telefonní předvolby
    maxUploadSize = "5G";					# nastavení maximální velikosti uploadovaného souboru
    configureRedis = true;					# cachování - rychlejší načítání webu
    extraOptions = {						# zapíše hodnoty do souboru config.php
	maintenance_window_start = 1;				# nastaví okno údržby na 1-5 AM UTC
	mail_smtpmode = "sendmail";
	mail_sendmailmode = "pipe";
    };
  };

  # nastaví port nextcloud (používá NGINX server) na 8080
  services.nginx.virtualHosts.${config.services.nextcloud.hostName}.listen = [ { addr = "127.0.0.1"; port = 8080; } ];
}
