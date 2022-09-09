{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./hosts.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_hardened;

  networking.hostName = "nixos"; # Define your hostname.
  
  virtualisation.docker = {
	enable = true;
	enableOnBoot = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Halifax";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.utf8";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.nixtop { 
    isNormalUser = true;
    description = "nixtop";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	  neovim
  ];

  security.sudo.enable = false;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  environment.defaultPackages = lib.mkForce [];
  security.lockKernelModules = lib.mkDefault true;
  security.apparmor.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 445 139 22 ];
  networking.firewall.allowedUDPPorts = [ 137 138 22 ];

  # Port 22 for SSH
  # Port 445, 139, 137, 138 for samba.

  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
  programs.firejail.enable = true;

  nixpkgs.config.pulseaudio = true;

  services.xserver = {
	enable = true;
	desktopManager = {

	};
    displayManager.defaultSession = "xfce";
    libinput.enable = true;
    libinput.tapping = true;
    libinput.middleEmulation = true;
    libinput.naturalScrolling = true;
  };

  nix.sshServe.enable = true;


  system.stateVersion = "22.05"; 
  #services.samba = {
  #enable = true;
  #enableNmbd = false;
  #enableWinbindd = false;
 # shares = {
#		nas = {
#			"path" = "/mnt/terabyte";
#			"guest ok" = "yes";
#			"read only" = "no";
#		}
#	  };
#  };

}
