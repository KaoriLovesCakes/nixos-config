{
  config,
  lib,
  ...
}: {
  globals =
    {
      mapleader = " ";
      maplocalleader = ",";
    }
    // (lib.optionalAttrs config.plugins.transparent.enable {
      transparent_enabled = true;
    });
}
