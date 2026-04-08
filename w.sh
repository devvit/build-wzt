#

cp */*.ttc */*.ttf ./
cp *.ttc *.ttf ./assets/fonts/

for f in $(ls *.ttf *.ttc); do
    perl -pi.bak -e "s/font\!\(\"..\/..\/assets\/fonts\/SymbolsNerdFontMono-Regular.ttf\"\)/font\!\(\"..\/..\/assets\/fonts\/SymbolsNerdFontMono-Regular.ttf\"\),font\!\(\"..\/..\/assets\/fonts\/$f\"\)/g" wezterm-font/src/parser.rs
done

perl -pi.bak -e 's/elem.max_width =/elem.max_width = Some\(Dimension::Pixels\(self.dimensions.pixel_width as f32 \/ num_tabs\)\); elem.min_width = elem.max_width;\/\//g' wezterm-gui/src/termwindow/render/fancy_tab_bar.rs
