{ config, pkgs, ... }:

{
  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    userName = "Mark Pictor";
    userEmail = "93549255+mark-pictor-csec@users.noreply.github.com";
    #url = {"github":"Contrast-Security-Inc/.insteadof=https://github.com/Contrast-Security-Inc/"];
    aliases = {
      mpp = "!git checkout $(git dbranch) && git pull && git cb";
      ap = "add -p";
      s = "status";
      last = "cat-file commit HEAD";
      new = "!gitk --all --not ORIG_HEAD";
      rvs = "remote -v show";
      dbranch = "!basename $(git symbolic-ref --short refs/remotes/origin/HEAD)";
      upb = "!b=$(git branch --show-current) && git checkout $(git dbranch) && git pull && git checkout $b";
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.default = "simple";
      url = {
        "github:Contrast-Security-Inc/" = {
          insteadof = ["https://github.com/Contrast-Security-Inc/"];
        };
      };
    };
  };
  # (pkgs.writeShellScriptBin "my-hello" ''
  #   echo "Hello, ${config.home.username}!"
  # '')
}