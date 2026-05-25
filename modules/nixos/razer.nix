{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.kernelModules = [
    "uinput"
    "joydev"
  ];

  hardware.openrazer = {
    enable = true;
    users = [ "alex?" ];
  };

  users.users.alex = {
    extraGroups = [
      "openrazer"
    ];
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
  ];

  services.udev = {
    extraRules = ''
      # Create persistent uinput device for Razer Tartarus Pro joystick
      KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
    '';
  };
}
