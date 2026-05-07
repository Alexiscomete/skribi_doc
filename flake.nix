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
        doc = pkgs.stdenv.mkDerivation {
          src = ./.;
          name = "skribi_doc";
          nativeBuildInputs = with pkgs; [
            typst
          ];
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
          buildInputs = [ ];
        };
      }
    );
}
