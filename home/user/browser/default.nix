{ config, pkgs, ... }:

{
  programs.brave = {
    enable = true;

    extensions = [
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
    ];
  };

  programs.firefox = {
    enable = true;

    policies.ExtensionSettings = {
      "KeeperFFStoreExtension@KeeperSecurityInc" = {
        installation_mode = "normal_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/keeper-password-manager/latest.xpi";
      };

      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
        installation_mode = "normal_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
      };
    };
  };
}
