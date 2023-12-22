-- @see https://wezfurlong.org/wezterm/config/lua/general.html

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
--  @see https://wezfurlong.org/wezterm/colorschemes/index.html
--  @see https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "Builtin Solarized Dark"
		return "nightfox"
	else
		-- return "Builtin Solarized Light"
		-- return "Tokyo Night Day"
		return "dayfox"
	end
end

-- events
wezterm.on("window-config-reloaded", function(window, _)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)

	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		overrides.set_environment_variables = {
			TERM_COLOR_SCHEME = overrides.color_scheme,
		}

		window:set_config_overrides(overrides)
	end
end)

wezterm.on("window-config-reloaded", function(window, _)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

-- wezterm.on("window-config-reloaded", function(window, pane)
-- 	wezterm.log_info("the config was reloaded for this window!")
--
-- 	config.set_environment_variables = {
-- 		TERM_COLOR_SCHEME = config.color_scheme,
-- 	}
-- end)

-- This is where you actually apply your config choices

-- @see https://wezfurlong.org/wezterm/config/lua/config/term.html
config.term = "wezterm"

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.font = wezterm.font("FiraCode Nerd Font Mono")
-- config.font = wezterm.font("0xProto Nerd Font")
config.font_size = 14.0

config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.window_frame = {
	border_left_width = "5px",
	border_right_width = "5px",
	border_bottom_height = "5px",
	border_top_height = "5px",
}
config.enable_tab_bar = false

config.set_environment_variables = {
	TERM_COLOR_SCHEME = config.color_scheme,
}

-- and finally, return the configuration to wezterm
return config
