{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "akunito";
  home.homeDirectory = "/home/akunito";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brlaser # driver for brother laser printers - TO TEST
    vivaldi
    kitty
    ungoogled-chromium
    vscode
    obsidian
    spotify
    kdePackages.krdp
    # # key binding
    # xbindkeys
    # xdotool
    # xmodmap
  ];

  # # Create .xbindkeysrc file
  # home.file.".xbindkeysrc".text = ''
  #   # Hold Caps Lock to act as Ctrl + Super
  #   "xdotool keydown Control_L keydown Super_L"
  #       Caps_Lock

  #   # Release Caps Lock to release Ctrl + Super
  #   "xdotool keyup Control_L keyup Super_L"
  #       Release+Caps_Lock
  # '';

  # # Create disable_capslock.sh script
  # home.file.".disable_capslock.sh".text = ''
  #   #!/bin/sh
  #   xmodmap -e "clear Lock" -e "keycode 66 = NoSymbol"
  # '';

  # # Service: xbindkeys
  # systemd.user.services.xbindkeys = {
  #   Unit = {
  #     Description = "xbindkeys service";
  #   };
  #   Install = {
  #     WantedBy = [ "default.target" ];
  #   };
  #   Service = {
  #     ExecStart = "${pkgs.xbindkeys}/bin/xbindkeys";
  #   };
  # };
  
  # # Service: Disable Caps Lock
  # systemd.user.services.disableCapsLock = {
  #   Unit = {
  #     Description = "Disable Caps Lock service";
  #   };
  #   Install = {
  #     WantedBy = [ "default.target" ];
  #   };
  #   Service = {
  #     ExecStart = "${config.home.homeDirectory}/.disable_capslock.sh";
  #   };
  # };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/akunito/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "vscode";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
    };
  };

  programs.atuin = {
    enable = true;
    settings = {
      # Uncomment this to use your instance if selfhosting
      # sync_address = "https://majiy00-shell.fly.dev";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}