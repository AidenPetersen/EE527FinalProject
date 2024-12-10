{
  inputs = {
    nixpkgs.url = "github:codedownio/nixpkgs/9fcd1d95e3df6b2cd75bcba0923c8dd4266a28ce";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        jupyterBundle = pkgs.jupyter.override {
          definitions = { cpp17 = pkgs.cpp17-kernel; };
        };
      in
      {
        devShell = pkgs.mkShell {
          name = "demo";
          buildInputs = [
            jupyterBundle
            pkgs.xeus-cling
          ];
        };
      });
}
