{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    
    # Define the specific Qt6 environment with Wayland support
    qtEnv = pkgs.qt6.env "qt6-wayland-dev" [
      pkgs.qt6.qtbase
      pkgs.qt6.qtwayland
      pkgs.qt6.qtdeclarative
    ];
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        qtEnv
        cmake
		qt6.qtbase
        gcc
        gdb
        qtcreator
        qt6.wrapQtAppsHook
        makeWrapper
        bashInteractive
      ];

      shellHook = ''
        echo "Entering Qt6 Wayland development environment"
        
        # Critical for Wayland
        export QT_QPA_PLATFORM=wayland
        export QT_QPA_PLATFORMTHEME=qt5ct
        
        # Set plugin and import paths explicitly
        export QT_PLUGIN_PATH="${qtEnv}/lib/qt-6/plugins"
        export QML_IMPORT_PATH="${qtEnv}/lib/qt-6/qml"
        export QT_QPA_PLATFORM_PLUGIN_PATH="${qtEnv}/lib/qt-6/plugins/platforms"
        
      '';
    };
  };
}   
