--[[
	/*
	 * IMPORTS
	 */
--]]

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

local Adapter = Class.define 'Adapter'

---------------------------------------
--[[SUMMARY:
	* Determine whether or not there is a table surrounding (`column`, `line`).
]]
--[[ PARAMS:
	* `line` => the line number to look for a table around.
	* `column` => the column number to look for a table around.
]]
---------------------------------------
function Adapter.is_table(line, column)
	Class.not_implemented(Adapter, 'is_table')
end

--[[
	/*
	 * EXPORTS
	 */
--]]

return Adapter
