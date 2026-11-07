{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
  in {
    packages = forAllSystems (pkgs: rec {
      gitflow-toolkit = pkgs.callPackage ./package.nix {};
      default = gitflow-toolkit;
    });

    overlays.default = final: _prev: {
      gitflow-toolkit = self.packages.${final.stdenv.hostPlatform.system}.gitflow-toolkit;
    };

    homeModules = rec {
      gitflow-toolkit = import ./module.nix self;
      default = gitflow-toolkit;
    };
  };
}
