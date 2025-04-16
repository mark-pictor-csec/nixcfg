{ pkgs, lib }:
{
  enable = true;
  enableZshIntegration = true;
  enableFishIntegration = true;
  enableBashIntegration = true;
  settings = {
    scan_timeout = 2;
    aws = {
      disabled = true;
    };
    docker_context = {
      disabled = true;
    };
    nodejs = {
      disabled = true;
    };
    kubernetes = {
      disabled = true;
    };
    java = {
      disabled = true;
    };
    python = {
      disabled = true;
    };
    terraform = {
      disabled = true;
    };
  };
}