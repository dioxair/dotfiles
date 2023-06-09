# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";
  # System clock might be incorrect after booting Windows and going back to the NixOS.
  # It can be fixed by either setting RTC time standard to UTC on Windows, or setting it to localtime on NixOS.
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.samuel = {
    isNormalUser = true;
    description = "Sam";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
      vim
    ];
  };

  programs.zsh.enable = true; # Enable zsh system wide
  users.defaultUserShell = pkgs.zsh; # Set zsh as default shell system wide

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    anydesk
    appimage-run
    ark
    bat
    cmake
    curl
    ddnet
    discord
    electron-mail
    exa
    ffmpeg_5
    firefox
    fuse3
    gcc
    gimp
    git
    gnumake
    htop
    inconsolata-nerdfont
    insomnia
    jq
    kdenlive
    keepassxc
    libreoffice
    libreoffice
    lua
    luajit
    neofetch
    neovim
    nodePackages.prettier
    nodejs
    nodenv
    obs-studio
    osu-lazer
    python311
    python39Packages.pip
    rbenv
    ripgrep
    spotdl
    teeworlds
    translate-shell
    ungoogled-chromium
    unzip
    vim
    vlc
    wget
    xclip
    zlib
    zsh
];
  services.flatpak.enable = true;

  security.sudo.configFile = ''
    Defaults   env_reset,pwfeedback

    # Keep SSH_AUTH_SOCK so that pam_ssh_agent_auth.so can do its magic.
    Defaults env_keep+=SSH_AUTH_SOCK

    # "root" is allowed to do anything.
    root        ALL=(ALL:ALL) SETENV: ALL

    # extraRules
    %wheel  ALL=(ALL:ALL)   SETENV: ALL


    # Keep terminfo database for root and %wheel.
    Defaults:root,%wheel env_keep+=TERMINFO_DIRS
    Defaults:root,%wheel env_keep+=TERMINFO
   '';

environment.variables = {
		EDITOR = "nvim";
		PAGER = "less";
	};

	# font being replaced is in comment
	fonts.fonts = with pkgs; [
		caladea # Cambria
		carlito # Calibri
		hack-font
		liberation_ttf # Times New Roman, Arial, Courier New
		noto-fonts
		noto-fonts-emoji
	];

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
