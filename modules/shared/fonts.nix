{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-monochrome-emoji
    noto-fonts-color-emoji

    _0xproto
    nerd-fonts._0xproto

    googlesans-code
  ];
}
