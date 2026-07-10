# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true; # comment out this
  boot.loader.efi.canTouchEfiVariables = true;

  # add settings for boot loader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     useXkbConfig = true; # use xkb.options in tty.
  };

  # Japanese Input Setting
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
    ];
    fcitx5.settings.globalOptions = {
      "Hotkey/TriggerKeys"."0" = "Alt+space";
      "Hotkey/ActivateKeys"."0" = "Super_R";
      "Hotkey/DeactivateKeys"."0" = "Super_L";
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "ctrl:nocaps";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/input-sources" = {
           xkb-options = [ "ctrl:nocaps" ];
         };
      };
    }
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  services.udev.packages = [
    pkgs.qmk-udev-rules
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yukihiro = {
    isNormalUser = true;
    description = "Yukihiro Arakawa";
    extraGroups = [ "networkmanager" "plugdev" "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    # packages = with pkgs; [
    #  tree
    # ];
  };

  users.groups.plugdev = {};

  # programs.firefox.enable = true;

  programs.fish.enable = true;

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
  #   wget
     git
  ];

  environment.shellAliases = {
    nixos-rebuild-swtich = "sudo nixos-rebuild switch";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
