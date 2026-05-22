{
  description = "Dev shell for markenium";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cmake
            gnumake
            gcc
            qt6.qtbase        # provides Qt6 Widgets/Core/Gui and qmake, moc, uic
            ninja
          ];

          shellHook = ''
            export CMAKE_PREFIX_PATH=${pkgs.qt6.qtbase}
            export QT_PLUGIN_PATH=${pkgs.qt6.qtbase}/lib/qt6/plugins
            echo "Qt6 devshell ready (CMAKE_PREFIX_PATH set)"
          '';
        };
      });
}
