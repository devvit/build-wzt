#

curl -fsSL -JO https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip
unzip -o *ubuntu-font-family*.zip

curl -fsSL -JO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuMono.zip
unzip -o UbuntuMono.zip

curl -fsSL -JO 'https://sourceforge.net/projects/wqy/files/wqy-microhei/0.2.0-beta/wqy-microhei-0.2.0-beta.tar.gz'
curl -fsSL -JO 'https://sourceforge.net/projects/wqy/files/wqy-microhei-lite/0.2.0-beta/wqy-microhei-lite-0.2.0-beta.tar.gz'
curl -fsSL -JO 'https://sourceforge.net/projects/wqy/files/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/wqy-zenhei-0.9.45.tar.gz'
tar -xf wqy-microhei-0.2.0-beta.tar.gz
tar -xf wqy-microhei-lite-0.2.0-beta.tar.gz
tar -xf wqy-zenhei-0.9.45.tar.gz

cp */*.ttc */*.ttf ./
cp *.ttc *.ttf ./assets/fonts/

for f in $(ls *.ttf *.ttc); do
    perl -pi.bak -e "s/font\!\(\"..\/..\/assets\/fonts\/SymbolsNerdFontMono-Regular.ttf\"\)/font\!\(\"..\/..\/assets\/fonts\/SymbolsNerdFontMono-Regular.ttf\"\),font\!\(\"..\/..\/assets\/fonts\/$f\"\)/g" wezterm-font/src/parser.rs
done

perl -pi.bak -e 's/elem.max_width =/elem.max_width = Some\(Dimension::Pixels\(self.dimensions.pixel_width as f32 \/ num_tabs\)\); elem.min_width = elem.max_width;\/\//g' wezterm-gui/src/termwindow/render/fancy_tab_bar.rs
