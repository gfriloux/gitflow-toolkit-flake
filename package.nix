{ lib, pkgs, buildGoModule, ... }:

buildGoModule {
  pname = "gitflow-toolkit";
  version = "2.1.5";
  src = pkgs.fetchFromGitHub {
    owner = "gfriloux";
    repo = "gitflow-toolkit";
    rev = "master";
    sha256 = "sha256-1DPsoAR5OTWZD4bRgMsJrXuIDiJMEei3V4wz6JdaC94=";
  };
  #vendorHash = pkgs.lib.fakeHash;
  vendorHash = "sha256-YU/DXBhBQcdu3xoAmcEiw69lvd8UCiQBGlKx4v/Eax0=";
  doInstallCheck = false;
  doCheck = false;


  runtimeInputs = with pkgs; [
    git
  ];
  postBuild = ''
    mkdir -p $out/bin
    ln -s $out/bin/gitflow-toolkit $out/bin/git-chore
    ln -s $out/bin/gitflow-toolkit $out/bin/git-ci
    ln -s $out/bin/gitflow-toolkit $out/bin/git-docs
    ln -s $out/bin/gitflow-toolkit $out/bin/git-feat
    ln -s $out/bin/gitflow-toolkit $out/bin/git-fix
    ln -s $out/bin/gitflow-toolkit $out/bin/git-hotfix
    ln -s $out/bin/gitflow-toolkit $out/bin/git-perf
    ln -s $out/bin/gitflow-toolkit $out/bin/git-ps
    ln -s $out/bin/gitflow-toolkit $out/bin/git-refactor
    ln -s $out/bin/gitflow-toolkit $out/bin/git-style
    ln -s $out/bin/gitflow-toolkit $out/bin/git-test
  '';
}
