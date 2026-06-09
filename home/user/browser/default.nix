{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.brave
  ];

  programs.firefox = {
    enable = true;

    policies.ExtensionSettings = {
      "KeeperFFStoreExtension@KeeperSecurityInc" = {
        installation_mode = "normal_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/keeper-password-manager/latest.xpi";
      };
    };
  };
}
