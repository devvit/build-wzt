#

perl -pi.bak -e 's/kids.push\(x_button\);/if self.config.show_new_tab_button_in_tab_bar { kids.push\(x_button\); }/g' wezterm-gui/src/termwindow/render/fancy_tab_bar.rs
perl -pi.bak -e 's/elem.max_width = Some\(Dimension::Pixels\(max_tab_width\)\);/elem.max_width = Some\(Dimension::Pixels\(self.dimensions.pixel_width as f32 \/ num_tabs\)\); elem.min_width = Some\(Dimension::Pixels\(self.dimensions.pixel_width as f32 \/ num_tabs\)\);/g' wezterm-gui/src/termwindow/render/fancy_tab_bar.rs
