{
  description = "21Challenge – Sui CLI ile gelistirme ortami";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        suiPkg = pkgs.stdenv.mkDerivation rec {
          pname = "sui";
          version = "1.62.0";

          src = pkgs.fetchurl {
            url = "https://github.com/MystenLabs/sui/releases/download/testnet-v${version}/sui-testnet-v${version}-ubuntu-x86_64.tgz";
            sha256 = "sha256-WClI8zhD94q61QGkSeuzOOdKbng8YshDLxvioFdIqTw=";
          };

          nativeBuildInputs = [ pkgs.autoPatchelfHook ];

          buildInputs = with pkgs; [
            stdenv.cc.cc.lib
            openssl
            zlib
          ];

          sourceRoot = ".";

          installPhase = ''
            mkdir -p $out/bin
            cp -r * $out/bin/
            chmod +x $out/bin/sui
          '';
        };
      in
      {
        packages.sui = suiPkg;
        apps.sui = {
          type = "app";
          program = "${suiPkg}/bin/sui";
        };
        devShells.default = pkgs.mkShell {
          buildInputs = [ suiPkg ];
        };
        defaultPackage = suiPkg;
      }
    );
}
