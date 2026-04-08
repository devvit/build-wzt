#

cp */*.ttc */*.ttf ./
cp *.ttc *.ttf ./sugarloaf/src/font/resources/

for f in $(ls *.ttf *.ttc 2>/dev/null); do
    name=$(echo "$f" | tr '.-' '_' | tr '[:lower:]' '[:upper:]')
    echo "pub const FONT_${name}: &[u8] = font!(\"./resources/$f\");" >>sugarloaf/src/font/constants.rs

    perl -i -pe "if (/SYMBOLS_NERD/) { \$_ .= \"self.insert(FontData::from_slice(FONT_${name}, false).unwrap());\\n\"; }" sugarloaf/src/font/mod.rs
done
