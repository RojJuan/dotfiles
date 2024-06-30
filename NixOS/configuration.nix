# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "ca";
      variant = "fr";
    };
  };

  # Configure console keymap
  console.keyMap = "cf";

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
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kingboo = {
    isNormalUser = true;
    description = "kingboo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      thunderbird
    ];
  };

  programs.zsh.enable = true;
  
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    wdisplays
    warp-terminal
    spotify
    gnome.nautilus
    git
    rustup
    go
    python3
    dotnet-sdk_8
    nodejs_22
    unzip
    librewolf
    libsForQt5.kdenlive
    audacity
    wine
    bottles
    lutris
    protonup-qt
    github-desktop
    onlyoffice-bin
    obsidian
    todoist-electron
    gimp-with-plugins
    tmux
    fzf
    bun
    vlc
    lunar-client
    flatpak
    stacer
    chromium
    tofi
    libgcc
    cmake
    vscode
    ripgrep
    davinci-resolve
    steam-run
    gcc49
    osu-lazer-bin
    anki-bin
    ffmpeg
    vesktop
    fastfetch
    htop
    du-dust
    tldr
    yazi
    mangohud
    cmatrix
    appimage-run
    godot_4
    lmms
    qbittorrent
    qemu
    quickemu
    postman
    (waybar.overrideAttrs (oldAttrs: {
      mesonFLages = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
     })
    )
    dunst
    libnotify
    swww
    grim
    slurp
    wl-clipboard
    gparted
    udiskie
    minecraft
    glib
    alacritty
    findutils
    gtk4
    gtk3
    gtk2
    android-tools
    lsd
    lazygit
    gh
    libsForQt5.kdeconnect-kde
  ];
  
  services.flatpak.enable = true;

  virtualisation.waydroid.enable = true;

  services.udisks2.enable = true;

  nixpkgs.config.allowBroken = true;

  services.locate.enable = true;
  
  programs.seahorse.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;

  services.gnome.gnome-keyring.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";

  stylix.polarity = "either";
  
  stylix.image = ./files/nixwallp.png;

  stylix.targets.gnome.enable = true;

  stylix.targets.gtk.enable = true;

  stylix.autoEnable = true;

  stylix.cursor.package = pkgs.bibata-cursors;
 
  stylix.cursor.name = "Bibata-Modern-Ice";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 15;
    desktop = 10;
    popups = 10;
  };

  
  nix.gc = {
          automatic = true;
	  dates = "weekly";
	  options = "--delete-older-than 7d";
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "
      experimental-features = nix-command flakes
    ";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

 
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = ["kingboo"];
  }];


  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
 
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  environment.shellAliases = {
    cd = "z";
    ls = "ls --color";
  };  

  environment.variables = {
     WGPU_BACKEND = "gl";
  };

  programs.steam = {
     enable = true;
     remotePlay.openFirewall = true;
     dedicatedServer.openFirewall = true;
  };
  
  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;
 
  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "kingboo" = import ./home.nix;
    };
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
