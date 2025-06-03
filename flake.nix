{
  description = "information_visualization_homework1";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        rpkgs = with inputs.nixpkgs.legacyPackages.${system}.rPackages; [
          ggplot2
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          packages =
            with pkgs;
            [
              R
              quarto
            ]
            ++ rpkgs;
        };
      }
    );
}
