{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  packages = [ 
    pkgs.cling 
    pkgs.xeus
    pkgs.xeus-cling
    pkgs.python3
    pkgs.jupyter
  ];
}

