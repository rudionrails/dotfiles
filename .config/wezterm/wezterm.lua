-- @see https://wezfurlong.org/wezterm/config/lua/general.html

local wezterm = require("wezterm")
local config = wezterm.config_builder()

--- Setup
--
-- @see https://wezfurlong.org/wezterm/config/lua/config/term.html
config.term = "wezterm"
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.window_frame = {
	border_left_width = "5px",
	border_right_width = "5px",
	border_bottom_height = "5px",
	border_top_height = "5px",
}

-- make left OPTION key work properly on macOS, @see https://github.com/wez/wezterm/issues/3866
-- config.send_composed_key_when_left_alt_is_pressed = false
-- config.send_composed_key_when_right_alt_is_pressed = false

--- Colorscheme
--
-- @see https://wezfurlong.org/wezterm/colorschemes/index.html
-- @see https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "cyberdream"
		return "tokyonight_moon" -- "tokyonight_storm" -- "nightfox"
	else
		return "tokyonight_day" -- dayfox
		-- return "Edge Light (base16)"
		-- return "Catppuccin Latte"
	end
end

-- config.mouse_bindings = {
-- 	-- Bind 'Up' event of CTRL-Click to open hyperlinks
-- 	{
-- 		event = { Up = { streak = 1, button = "Left" } },
-- 		mods = "SUPER",
-- 		action = wezterm.action.OpenLinkAtMouseCursor,
-- 	},
-- 	-- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
-- 	{
-- 		event = { Down = { streak = 1, button = "Left" } },
-- 		mods = "SUPER",
-- 		action = wezterm.action.Nop,
-- 	},
-- }

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local scheme = scheme_for_appearance(window:get_appearance())

	if overrides.color_scheme ~= scheme then
		wezterm.log_info("Setting color_scheme")
		overrides.color_scheme = scheme

		window:set_config_overrides(overrides)
	end
end)

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

--- Font
--
-- @see https://wezfurlong.org/wezterm/config/lua/config/font_rules.html
-- config.font = wezterm.font({ family = "Liga SFMono Nerd Font" })
config.font = wezterm.font({ family = "FiraCode Nerd Font" })
-- config.font = wezterm.font({ family = "0xProto Nerd Font" })
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
config.font_size = 14.0
config.font_rules = {
	{
		italic = true,
		intensity = "Bold",
		font = wezterm.font({
			family = "VictorMono Nerd Font",
			style = "Italic",
			weight = "Bold",
		}),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			family = "VictorMono Nerd Font",
			style = "Italic",
			weight = "DemiBold",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({
			family = "VictorMono Nerd Font",
			style = "Italic",
		}),
	},
}

-- and finally, return the configuration to wezterm
return config
