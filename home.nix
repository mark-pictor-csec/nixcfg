{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mark";
  home.homeDirectory = "/home/mark";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # # The home.packages option allows you to install Nix packages into your
  # # environment.
  # home.packages = [
  #   pkgs.nerdfonts
  #   pkgs.wget
  #   pkgs.vim
  #   pkgs.vscode
  #   # pkgs.git
  #   pkgs.openssh
  #   pkgs.gnumake
  #   #pkgs.gcc #conflicts with clang :/
  #   pkgs.clang
  #   pkgs.rustup
  #   pkgs.htop
  #   pkgs.nil
  #   pkgs.go
  #   pkgs.ripgrep
#
  #   # # Adds the 'hello' command to your environment. It prints a friendly
  #   # # "Hello, world!" when run.
  #   # pkgs.hello
#
  #   # # It is sometimes useful to fine-tune packages, for example, by applying
  #   # # overrides. You can do that directly here, just don't forget the
  #   # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
  #   # # fonts?
  #   # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
#
  #   # # You can also create simple shell scripts directly inside your
  #   # # configuration. For example, this adds a command 'my-hello' to your
  #   # # environment:
  #   # (pkgs.writeShellScriptBin "my-hello" ''
  #   #   echo "Hello, ${config.home.username}!"
  #   # '')
  # ];

  imports = [
    ./sh.nix
    ./pkgs.nix
    ./git.nix
  ];


  #   #package = pkgs.go;
  #   # these are interpreted relative to $HOME
  #   #goPath = "gopath";
  #   #goBin = "gobin";
  #   # TODO: it'd be nice if this is only set on work machines but that'd take a
  #   # refactor
  # programs.go = {
  #   enable = true;
  #   goPrivate = [
  #     "github.com/Contrast-Security-Inc/*"
  #   ];
  # };
  # programs.git = {
  #   package = pkgs.gitFull;
  #   enable = true;
  #   userName = "Mark Pictor";
  #   userEmail = "93549255+mark-pictor-csec@users.noreply.github.com";
  #   #url = {"github":"Contrast-Security-Inc/.insteadof=https://github.com/Contrast-Security-Inc/"];
  #   aliases = {
  #     mpp = "!git checkout $(git dbranch) && git pull && git cb";
  #     ap = "add -p";
  #     s = "status";
  #     last = "cat-file commit HEAD";
  #     new = "!gitk --all --not ORIG_HEAD";
  #     rvs = "remote -v show";
  #     dbranch = "!basename $(git symbolic-ref --short refs/remotes/origin/HEAD)";
  #     upb = "!b=$(git branch --show-current) && git checkout $(git dbranch) && git pull && git checkout $b";
  #   };
  #   extraConfig = {
  #     init.defaultBranch = "main";
  #     pull.rebase = true;
  #     push.default = "simple";
  #     url = {
  #       "github:Contrast-Security-Inc/" = {
  #         insteadof = ["https://github.com/Contrast-Security-Inc/"];
  #       };
  #     };
  #   };
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

