--[[
	/*
	 * IMPORTS
	 */
--]]

local Class = require 'sc_nvim.Class'
local Popup = require 'sc_nvim.Popup'

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

local SpreadsheetCalculator = Class.define 'SpreadsheetCalculator'

function SpreadsheetCalculator:open(popup_cfg)
	Class.not_implemented(SpreadsheetCalculator, 'close')
end

function SpreadsheetCalculator:close()
	Class.not_implemented(SpreadsheetCalculator, 'close')
end

------------------------------------
--[[ SUMMARY:
	* Create a new `SpreadsheetCalculator` instance.
]]
------------------------------------
function SpreadsheetCalculator:new(popup_config)
	return Class.new(self, {['popup'] = Popup:new(popup_config)})
end

--[[
	/*
	 * EXPORTS
	 */
--]]

return SpreadsheetCalculator

