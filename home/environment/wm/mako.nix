{...}: {
  services.mako = {
    enable = true;
    extraConfig = ''
      layer=overlay
      background-color=#343945
      border-size=0
      border-color=#343945
      text-color=#ffffff
      default-timeout=5000
      ignore-timeout=1
      font=JetBrains Mono Nerd Font 13
      outer-margin=0,5,15,0
      anchor=top-right
      border-radius=8
      progress-color=over #1e1b25

      icons=1
      max-icon-size=64
      icon-path=/usr/share/icons/:/usr/share/pixmaps
      icon-location=left
      icon-border-radius=4

      max-history=100
      history=1

      [urgency=high]
      border-color=#343945
      default-timeout=0

      [urgency=low]
      border-color=#343945

      [category=mpd]
      default-timeout=2000
      group-by=category

      [app-name="Steam"]
      invisible=1
    '';
  };
}
