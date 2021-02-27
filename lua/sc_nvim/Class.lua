--[[
	/*
	 * MODULE
	 */
--]]

local Class = {}
local cmd = vim.api.nvim_command

---------------------------------
--[[ SUMMARY:
	* Define a class-metatable.
]]
--[[
	* `name` => the name of the class.
	* `base` => the base data to use (`{}` by default).
]]
---------------------------------
function Class.define(name, base)
	-- set self to `base`, or `{}` if nil.
	local self = base or {}

	-- set `__index`.
	if not self.__index then self.__index = self end

	-- set `__type`.
	self.__type  = name

	return self
end

-------------------------------
--[[ SUMMARY:
	* Instantiate a class.
]]
--[[ PARAMS:
	* `class` => the class to instantiate.
	* `base` => the data to use (`{}` by default)
]]
-------------------------------
function Class.new(class, base)
	return setmetatable(base or {}, class)
end

-------------------------------------------
--[[ SUMMARY
	* Mark a certain function as not having a default implementation.
]]
--[[ PARAMS
	* `class` => the class which must implement the method.
	* `name` => the name of the method which must be implemented.
]]
-------------------------------------------
function Class.not_implemented(class, name)
	cmd('echoerr "\n\tSubclass of `'..Class.of(class)..'` has not implemented `'..name..'`!"')
end

--------------------
--[[ SUMMARY:
	* Get the type of some value `v`, if it has one.
]]
--[[ PARAMS:
	* `v` => the value to get the type of.
]]
--------------------
function Class.of(t)
	return t.__type or type(t)
end

--[[
	/*
	 * EXPORTS
	 */
--]]

return Class
