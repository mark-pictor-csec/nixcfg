{ config, pkgs, ... }:

{
 # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.nerdfonts
    pkgs.wget
    pkgs.vim
    pkgs.vscode
    pkgs.openssh
    pkgs.gnumake
    #pkgs.gcc #conflicts with clang :/
    pkgs.clang
    pkgs.rustup
    pkgs.htop
    pkgs.nil
    pkgs.ripgrep
    pkgs.jq

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.starship = import ./starship.nix { inherit pkgs lib; };

  programs.ripgrep = {
    enable = true;
    arguments = [
      "--glob"
      "!.git/*"
      "--hidden"
    ];
  };

  programs.go = {
    enable = false;
    goPrivate = [
      "github.com/Contrast-Security-Inc/*"
    ];
  };
  home.file = {
    ".config/go/env".text = ''
    GOPRIVATE=github.com/Contrast-Security-Inc/*
    '';
  };
}