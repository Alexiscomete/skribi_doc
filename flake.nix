{
  description = "Build pipeline for the Skribi documentation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      utils,
      ...
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        typst = (
          pkgs.typst.withPackages (
            ps: with ps; [
              zebraw_0_6_1
              vibrant-color_0_2_0
            ]
          )
        );
        path = "${typst}/lib/typst/packages";
        doc = pkgs.stdenv.mkDerivation {
          src = ./.;
          name = "skribi_doc";
          nativeBuildInputs = [
            typst
          ];
          TYPST_PACKAGE_CACHE_PATH=path;
          TYPST_PACKAGE_PATH=path;
          buildPhase = ''
            typst compile main.typ
          '';
          installPhase = ''
            mv main.pdf $out
          '';
        };
        open = pkgs.writeShellScriptBin "open_doc" ''
          xdg-open ${doc}
        '';
      in
      {
        packages = rec {
          skribi_doc = open;
          default = skribi_doc;
        };
        devShells.default = pkgs.mkShell {
          inputsFrom = [ doc ];
          buildInputs = [ open ];
        };
      }
    );
}
