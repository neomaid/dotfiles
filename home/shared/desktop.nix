{
  pkgs,
  lib,
  ...
}:

let
  inherit (pkgs) stdenv;
  inherit (lib) mkIf;
in
{
  programs = {
    vesktop = {
      enable = true;

      settings = {
        discordBranch = "stable";
        hardwareAcceleration = true;
        tray = true;
        minimizeToTray = true;
        customTitleBar = mkIf stdenv.isLinux false;
      };

      vencord.settings = {
        autoUpdate = false;
        useQuickCss = false;

        plugins = {
          BetterGifPicker.enabled = true;
          FakeNitro.enabled = true;
          FavoriteGifSearch.enabled = true;
          FixImagesQuality.enabled = true;
          NoF1.enabled = true;
          NoProfileThemes.enabled = true;
          NoServerEmojis = {
            enabled = true;
            shownEmojis = "currentServer";
          };
          petpet.enabled = true;
          SendTimestamps.enabled = true;
          UserMessagesPronouns = {
            enabled = true;
            showSelf = false;
          };
          VoiceMessages.enabled = true;
          WhoReacted.enabled = true;
        };
      };
    };
  };
}
