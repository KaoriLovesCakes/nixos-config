# 白雪

Because I'm a princess.

My NixOS config.
Might add documentation later.

Wallpaper is from [here](https://box.apeiros.xyz/public/everforest_walls/nature/forest_stairs.jpg).

## Installation guide

```fish
cd <shirayuki directory>
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./modules/nixos/disk/disko.nix
sudo nixos-install --flake .#shirayuki
```
