{ pkgs, pkgs-unstable, ... }:
{
  # GUI tools that should always be available at the system level,
  # regardless of whether home-manager is wired up for a given host.
  environment.systemPackages = with pkgs; [
    ghostty
    gnome-themes-extra # Adwaita-dark for GTK3 apps
    nemo
    pavucontrol
    pkgs-unstable.vscode # unstable: stable nixpkgs lags behind VS Code releases
  ];

  # Run ./foo.AppImage directly via binfmt instead of calling appimage-run by hand
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  # Uncomment and extend if an AppImage reports a missing .so
  # programs.appimage.package = pkgs.appimage-run.override {
  #   extraPkgs = pkgs: [ pkgs.libsecret ];
  # };

  # Trash and mounts in nemo; the GNOME module only enables it by default
  services.gvfs.enable = true;
  xdg.mime.defaultApplications."inode/directory" = "nemo.desktop";
}
