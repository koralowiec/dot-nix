{ ... }:
{
  # Plain OpenSSH agent instead of GNOME's gcr-ssh-agent, so the sway session
  # doesn't depend on GNOME being installed
  programs.ssh.startAgent = true;
  # The GNOME module enables gcr-ssh-agent via mkDefault, and the two agents
  # are mutually exclusive (asserted in nixpkgs)
  services.gnome.gcr-ssh-agent.enable = false;

  # startAgent only exports SSH_AUTH_SOCK from /etc/profile, which login shells
  # read but graphical sessions don't. Sessions started by GDM inherit the
  # systemd user environment, so publish the socket there too.
  environment.etc."environment.d/60-ssh-agent.conf".text = ''
    SSH_AUTH_SOCK="''${XDG_RUNTIME_DIR}/ssh-agent"
  '';

  # Load a key into the agent the first time it's used, so the passphrase is
  # asked once per login instead of on every connection
  programs.ssh.extraConfig = ''
    AddKeysToAgent yes
  '';
}
