{
  pkgs,
  ...
} : {
  environment.systemPackages = with pkgs; [
    # home manager
    home-manager
    # System utils
    tree
    gzip
    unzip
    brightnessctl
    pulseaudio
    direnv
    bluez
    bluez-tools
    # Media
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    # Manuals
    man-pages
    man-pages-posix
    # Common packags
    git
    python3
    # Default minimal text editor
    nano
    # Performance util
    mangohud
    # Custom package
    sddm-theme
  ];
}