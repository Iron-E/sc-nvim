--[[
	/*
	 * IMPORTS
	 */
--]]

local Class = require 'sc.Class'

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

-- Method to determine if the text surrounding the cursor is tabular data.
Class.abstract_method(Adapter, 'is_table')
