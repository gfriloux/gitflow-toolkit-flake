# gitflow-toolkit

## Installation

### flakes + home-manager

Ajouter notre dépôt en inputs:
```
sshtui = {
  url = "github:gfriloux/gitflow-toolkit-flake";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Ensuite dans votre config `home-manager`:
```
modules = [
  gitflow-toolkit.homeModules.gitflow-toolkit
];

programs.gitflow-toolkit.enable = true;
```

### nix profiles

```
nix profile install
```
