{ pkgs ? import <nixpkgs> {}
, stdenv ? pkgs.stdenv
, ...
}:
stdenv.mkDerivation {
      name = "frams-shell-tools";
      src = fetchTarball {
          url = "https://fex.belwue.de/sw/share/fstools-0.0.tar";
          sha256 = "0sy2iiwmskmhmyv2ig0q2fnzbbpmzdqpd9g5s5pzxm25h1g6wprv";
      };
      buildInputs = [pkgs.perl];
      installPhase = ''
        mkdir -p $out/bin
        cp -r bin $out/

        mkdir -p $out/share/man
        cp -r man $out/share/

        mkdir -p $out/share/doc
        cp -r doc $out/share/
      '';
      meta = {
        description = "Perl shell tools by framstag@rus.uni-stuttgart.de, e.g. fexsend/fexget";
        homepage = "https://fex.belwue.de/fstools/";
        license = stdenv.lib.licenses.artistic1;
      };
}
