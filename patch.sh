#

curl -fsSL -JO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/UbuntuMono.zip
unzip -o UbuntuMono.zip
cp *.ttf ./assets/fonts/

curl -fsSL -JO https://phoenixnap.dl.sourceforge.net/project/wqy/wqy-microhei/0.2.0-beta/wqy-microhei-0.2.0-beta.tar.gz
curl -fsSL -JO https://phoenixnap.dl.sourceforge.net/project/wqy/wqy-microhei-lite/0.2.0-beta/wqy-microhei-lite-0.2.0-beta.tar.gz
tar -xf wqy-microhei-0.2.0-beta.tar.gz
tar -xf wqy-microhei-lite-0.2.0-beta.tar.gz
cp */*.ttc ./
cp *.ttc ./assets/fonts/

for f in $(ls *.ttf *.ttc); do
    perl -pi.bak -e "s/font\!\(\"..\/..\/assets\/fonts\/NotoColorEmoji.ttf\"\)/font\!\(\"..\/..\/assets\/fonts\/NotoColorEmoji.ttf\"\),font\!\(\"..\/..\/assets\/fonts\/$f\"\)/g" wezterm-font/src/parser.rs
done

perl -pi.bak -e 's/kids.push\(x_button\);/if self.config.show_new_tab_button_in_tab_bar { kids.push\(x_button\); }/g' wezterm-gui/src/termwindow/render/fancy_tab_bar.rs
perl -pi.bak -e 's/elem.max_width = Some\(Dimension::Pixels\(max_tab_width\)\);/elem.max_width = Some\(Dimension::Pixels\(self.dimensions.pixel_width as f32 \/ num_tabs\)\); elem.min_width = Some\(Dimension::Pixels\(self.dimensions.pixel_width as f32 \/ num_tabs\)\);/g' wezterm-gui/src/termwindow/render/fancy_tab_bar.rs
