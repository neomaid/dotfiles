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

  services.udev = {
    extraRules = ''
      # Create persistent uinput device for Razer Tartarus Pro joystick
      KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
    '';
  };
}
