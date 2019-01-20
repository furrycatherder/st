with builtins;

let
  stpatch = name: fetchurl {
    url = "https://st.suckless.org/patches/${name}.diff";
  };

in {
  overlays = final: previous: with final; {
    st = previous.st.override {
      patches = map stpatch [
        "scrollback/st-scrollback-0.8"
        "scrollback/st-scrollback-mouse-0.8"
        "scrollback/st-scrollback-mouse-altscreen-0.8"
        "alpha/st-alpha-0.8.1"
      ];

      conf = builtins.readFile ./config.h;
    };
  };
}
