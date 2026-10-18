{ pkgs, ... }:
{
  # GUI tools that should always be available at the system level,
  # regardless of whether home-manager is wired up for a given host.
  environment.systemPackages = with pkgs; [
    ghostty
    gnome-themes-extra # Adwaita-dark for GTK3 apps
    nemo
    pavucontrol
  ];

  # Trash and mounts in nemo; the GNOME module only enables it by default
  services.gvfs.enable = true;
  xdg.mime.defaultApplications."inode/directory" = "nemo.desktop";
}
