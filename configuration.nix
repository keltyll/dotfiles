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
  boot.loader.grub = {
    enable = true;
    device = "/dev/sdd";
    timeout = 45;
    useOSProber = true;
  };


  # Fix USB sticks not mounting or being listed:
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Enable 32-bit DRI support for OpenGL
  hardware.opengl.driSupport32Bit = true;

  # Linux Kernel
  #boot.kernelPackages = pkgs.linuxPackages_6_4;
  #boot.kernelPackages = pkgs.linuxPackages_lqx;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
  #  supportedLocales = [ "fr_FR.UTF-8" "pl_PL.UTF-8" "ru_RU.UTF-8" ];
    };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;
  services.xserver.windowManager.i3.enable = true;

  # languages layout
  services.xserver = {
    layout = "us,pl,fr";
    };

  # Configure keymap in X11
  #services.xserver = {
  #  layout = "us";
  #  xkbVariant = "";
  #};

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr ];

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pagan = {
    isNormalUser = true;
    description = "pagan";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "audio" "video" "lp" "scanner" ];
    packages = with pkgs; [
      firefox
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.allowUnsupportedSystem = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  appimage-run
  anki-bin
  anydesk
  alacritty
  arc-theme
  #aria
  audacity
  bat
  bottles
  borgbackup
  #deja-dup
  cmatrix
  dexed
  discord
  distrobox
  dragonfly-reverb
  du-dust
  dunst
  pfetch
  starship
  #celluloid
  ffmpeg
  foliate
  #flameshot
  gnome.file-roller
  flatpak
  feh
  galculator
  gcc
  #gimp
  #gimpPlugins.gmic
  #gimpPlugins.resynthesizer
  git
  glava
  gnome.simple-scan
  gnome.gnome-disk-utility
  #gparted
  #handbrake
  #heroic
  #home-manager
  htop
  i3 i3lock i3status 
  #inkscape-with-extensions
  killall
  libreoffice
  lsd
  #lsp-plugins
  #lutris
  lxappearance
  mpv
  newsboat
  ncdu
  ntfs3g
  nfs-utils
  openssl
  papirus-icon-theme
  pavucontrol
  popcorntime
  podman
  pulseaudio
  epson-escpr # For printer Epson L3156
  #protonup-ng
  #protonvpn-gui
  python3Full
  #qdirstat
  qbittorrent
  qemu
  #redshift
  ripgrep
  rmlint
  rofi
  rustdesk
  simple-mtpfs
  standardnotes
  steam
  steam-run
  stremio
  telegram-desktop
  thunderbird
  tldr
  trash-cli
  zip
  unzip
  veracrypt
  virt-manager
  vorta
  wine-staging
  xdg-utils
  xfce.xfce4-power-manager
  xfce.xfce4-pulseaudio-plugin
  xfce.xfce4-volumed-pulse
  #xfce.xfce4-whiskermenu-plugin
  xfce.xfce4-clipman-plugin
  xfce.xfce4-weather-plugin
  #xfce.xfce4-cpugraph-plugin
  xfce.xfce4-xkb-plugin
  xfce.xfce4-screenshooter
  xfce.mousepad
  xfce.thunar
  xfce.ristretto
  xfce.tumbler
  yabridge
  yabridgectl
  zathura
  ];

  # fonts
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    nerdfonts
    cascadia-code
    font-awesome
  #  google-fonts
  ];

  # alias
environment.interactiveShellInit = ''
  alias editNixos='sudo nvim /etc/nixos/configuration.nix'
'';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  virtualisation.libvirtd.enable = true;

  # enable flatpak support
  services.flatpak.enable = true;
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  networking.enableIPv6 = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  # Automatic Garbage Collection
  #  nix = {
  #    settings.auto-optimise-store = true;
  #    gc = {
  #		automatic = true;
  #		dates = "weekly";
  #		options = "--delete-older-than 7d";
  #	};
  #  };

  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Podman/Docker registries:
  virtualisation = {
    podman = {
      enable = true;

      # docker alias for podman
      dockerCompat = true;

      # Required for contqiners under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
      };
    };

services.xserver.extraConfig = ''
  Section "InputClass"
    Identifier "keyboard-all"
    MatchIsKeyboard "on"
    Option "AutoRepeat" "300 80"
  EndSection
'';


}
