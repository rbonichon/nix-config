{ pkgs, lib, ... }:

{
  services = {

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "ondemand";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        DISK_DEVICES = "nvme0n1p1";
      };
    };

    blueman.enable = true;
    upower.enable = true;
    timesyncd.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    acpid.enable = true;
    locate.enable = true;
    fwupd.enable = true;
    thermald.enable = true;
    # notification system
    # may help unfreeze Slack app
    # https://www.reddit.com/r/archlinux/comments/8z5bex/slackdesktop_freezes_on_notification/
    # dunst.enable = true;
    emacs = {
      #      enable = true;
      defaultEditor = true;
    };

    mpd = {
      enable = true;
      startWhenNeeded = true;
    };

    cron = {
      enable = true;
      systemCronJobs = [
        "*/5 * * * *      richard    /home/richard/scripts/getmail"
      ];
    };

    redshift = {
      enable = true;
      temperature.day = 6500;
      temperature.night = 2700;
    };

    lorri = {
      enable = true;
    };

    gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome3.gvfs;
    };

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps";

      videoDrivers = [ "modesetting" ];
      useGlamor = true;

      # Enable touchpad support.
      libinput = {
        enable = true;
        disableWhileTyping = true;
      };

      displayManager = {
        sddm.enable = true;
        defaultSession = "none+i3";
        autoLogin = {
          enable = true;
          user = "richard";
        };
      };

      desktopManager = {
        # default = "xfce";
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      # desktopManager.plasma5.enable = true;

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          i3blocks
        ];
      };
    };
  };
}
