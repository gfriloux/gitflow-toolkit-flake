{ config, lib, pkgs, ... }:
let
  cfg = config.programs.gitflow-toolkit;
in
{
  options.programs.gitflow-toolkit = {
    enable = lib.mkEnableOption "gitflow-toolkit";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.gitflow-toolkit;
      description = "gitflow-toolkit package to use";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];
  };
}
