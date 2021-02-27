--[[
	/*
	 * IMPORTS
	 */
--]]

local api = vim.api
local Class = require 'sc_nvim.Class'

--[[
	/*
	 * HELPERS
	 */
--]]

--[[
	/*
	 * MODULE
	 */
--]]

local Popup = Class.define('Popup',
{
	['config'] =
	{
		['anchor']    = 'SW',
		['col']       = vim.o.columns - 1,
		['focusable'] = false,
		['height']    = 1,
		['relative']  = 'editor',
		['row']       = vim.o.lines - vim.o.cmdheight - 1,
		['style']     = 'minimal',
		['width']     = 1
	}
})

-------------------------------------
--[[ SUMMARY:
	* Close `self.window`
	* The `self` is inert after calling this.
]]
--[[ PARAMS:
	* `keep_buffer` => whether or not to keep `self.buffer`.
]]
-------------------------------------
function Popup:close(keepBuffer)
	if self:is_valid() then
		api.nvim_win_close(self.window, false)
	end

	self.window = nil

	if not keepBuffer then
		self.buffer = nil
	end
end

----------------------------
--[[ SUMMARY:
	* Check if `window` is non-`nil` and is valid.
]]
--[[ PARAMS:
	* `window` => the window number.
]]
--[[ RETURNS:
	* `true` => `window` is non-`nil` and is valid
	* `false` => otherwise
]]
----------------------------
function Popup:is_valid()
	return self.window and api.nvim_win_is_valid(self.window)
end

--------------------
--[[ SUMMARY:
	* Create a new popup window.
]]
--[[ RETURNS:
	* A new popup window.
]]
--------------------
function Popup:new(config)
	return Class.new(self,
	{
		['config'] = config or Popup.config,
	})
end

--------------------------
--[[ SUMMARY:
	* Open the popup.
	* If the popup was already open, close it and re-open it.
]]
--------------------------
function Popup:open()
	if self:is_valid() then
		self.config = vim.tbl_extend('keep', self.config, api.nvim_win_get_config(self.window))
		self:close()
	end

	if not self.buffer then self.buffer = api.nvim_create_buf(false, true) end

	self.window = api.nvim_open_win(self.buffer, true, self.config)
end

--[[
	/*
	 * EXPORTS
	 */
--]]

return Popup
