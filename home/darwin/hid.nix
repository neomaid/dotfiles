{ pkgs, ... }:

{
  xdg.configFile = {
    # Karabiner-Elements config
    "karabiner/karabiner.json".source = ../../config/karabiner/karabiner-config.json;

    # LinearMouse config
    "linearmouse/linearmouse.json".source = ../../config/linearmouse/linearmouse-config.json;
  };
}
