{ pkgs, ... }:

let
  userDictionary = pkgs.writeText "mozc-user-dictionary.tsv" ''
    ゆきひろ	幸寛	名詞	人名
    じゆ	事由	名詞
  '';

  mozcUserDictionaryTool = pkgs.writeShellApplication {
    name = "mozc-user-dictionary-tool";
    text = ''
      dictionary="$HOME/.local/share/mozc/user-dictionary.tsv"

      printf 'Mozc user dictionary source: %s\n' "$dictionary"
      printf 'In the dictionary tool, import this file into the user dictionary.\n'

      exec ${pkgs.mozc}/lib/mozc/mozc_tool --mode=dictionary_tool
    '';
  };
in
{
  home.packages = [
    mozcUserDictionaryTool
  ];

  xdg.dataFile."mozc/user-dictionary.tsv".source = userDictionary;
}
