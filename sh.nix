{ config, pkgs, ... }:

{
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
#     ".bashrc".text = ''
#     PATH=/usr/local/go/bin:$PATH
#     '';
  };

  home.shellAliases = {
    df   = "df -h";
    du   = "du -sh";
    sift = "rg";
    nocomments = "grep -ve \"^#\" -e ^$";
    diff = "diff -uw";
    cdiff = "colordiff -uw";
    hd = "hexdump -C";
    lls = "ll";
    # amnesshia = "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no";

    s    = "git status";
    "s." = "git status .";
    ap   = "git add -p";
    glo = "git log --oneline";
    gss = "git show --stat";
    gca = "git commit --amend --no-edit";
    gitk = "gitk &";
    goupdate = "echo -e \"run:\n  go install golang.org/dl/go1.21.3@latest\n  go1.21.3 download\"";
    rebuild_go_agent = "(cd ~/work/go-agent && make install)";
    hms = "home-manager switch";

  };
  home.sessionVariables = {
    # EDITOR = "emacs";
    PATH = "/home/mark/bin:/home/mark/go/bin:/usr/local/go/bin:$PATH";
    TMPDIR = "/tmp";
    GOPRIVATE = "github.com/Contrast-Security-Inc/*";
  };
  programs.bash.enable = true;
}