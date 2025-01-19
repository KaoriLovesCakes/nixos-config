{
  globals,
  lib,
  ...
}: {
  services.kanata = {
    enable = true;
    keyboards.default = {
      devices = globals.keyboards;
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          caps
        )
        (defvar
          tap-time 200
          hold-time 150
        )
        (deflayer base
          @caps
        )

        (defalias
          caps (tap-hold $tap-time $hold-time esc lctl)
        )
      '';
    };
  };
  specialisation.homeRowMods.configuration.services.kanata.keyboards.default.config = lib.mkForce ''
    (defsrc
      caps   a   s   d   f   h   j   k   l
    )
    (defvar
      tap-time 200
      hold-time 150

      left-hand-keys (
        q w e r t
        a s d f g
        z x c v b
      )
      right-hand-keys (
        y u i o p
        h j k l ;
        n m , . /
      )
    )
    (deflayer base
      @caps  @a  @s  @d  @f  @h  @j  @k  @l
    )

    (deflayer nomods
      @caps  a   s   d   f   h   j   k   l
    )
    (deffakekeys
      to-base (layer-switch base)
    )
    (defalias
      tap (multi
        (layer-switch nomods)
        (on-idle-fakekey to-base tap 20)
      )

      caps (tap-hold $tap-time $hold-time esc lctl)
      a (tap-hold-release-keys $tap-time $hold-time (multi a @tap) lmet $left-hand-keys)
      s (tap-hold-release-keys $tap-time $hold-time (multi s @tap) lalt $left-hand-keys)
      d (tap-hold-release-keys $tap-time $hold-time (multi d @tap) lctl $left-hand-keys)
      f (tap-hold-release-keys $tap-time $hold-time (multi f @tap) lsft $left-hand-keys)
      h (tap-hold-release-keys $tap-time $hold-time (multi h @tap) rsft $right-hand-keys)
      j (tap-hold-release-keys $tap-time $hold-time (multi j @tap) rctl $right-hand-keys)
      k (tap-hold-release-keys $tap-time $hold-time (multi k @tap) ralt $right-hand-keys)
      l (tap-hold-release-keys $tap-time $hold-time (multi l @tap) lmet $right-hand-keys)
    )
  '';
}
