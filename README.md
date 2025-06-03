# Template of Quarto Websites using Nix

## Overview

This repository provides a template for creating Quarto websites using Nix.
It includes a basic structure and configuration to help you get started quickly.

## How to Use

0. Clone this repository

```sh
git clone https://github.com/Myxogastria0808/quarto-websites-template.git
```

1. Add required R packages to flake.nix

```nix
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
          # Add your required R packages here
          # Under ggplot2 package is example:
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
```

2. Run `nix develop`

This command will set up a development environment and enter devShell environment.

```sh
nix develop
```

3. Run Preview Command

This command will start a local server to preview your Quarto website.

It has hot-reloading enabled, so you can see changes in real-time.

```sh
quarto preview src
```

Enjoy your Quarto website development with Nix!

## License

This project is licensed under the MIT License. See the [COPYING](https://github.com/Myxogastria0808/quarto-websites-template/blob/main/COPYING) file for details.