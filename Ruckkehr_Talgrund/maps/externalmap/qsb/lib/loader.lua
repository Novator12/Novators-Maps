-- ########################################################################## --
-- #  Library Loader                                                        # --
-- #  --------------------------------------------------------------------  # --
-- #    Author:   totalwarANGEL                                             # --
-- ########################################################################## --

---
-- Loads libraries used by the QSB if they are not already present.
--
-- Libraries loaded (in this order):
-- <ul>
-- <li>LuaBit - Lua 5.0 implementation of lua bit.</li>
-- <li>EntityFind - Library to find all entities.</li>
-- <li>MD5 - Library to create simple MD5 hashes.</li>
-- <li>Metatable (S5 Community) - Makes metatables savable.</li>
-- <li>S5Hook (S5 Community) - Allows basic memory manipulation (not compatible
-- to History Edition).</li>
-- </ul>
--
-- @set sort=true
--

-- Load luabit implementation for lua 5.0
if bit_logic_rshift == nil then
    Script.Load(gvBasePath.. "qsb/lib/luabit50.lua");
end
-- Load MD5 hash generator lib
if md5 == nil then
    Script.Load(gvBasePath.. "qsb/lib/md5.lua");
end
-- Load entity find
if EntityFind == nil then
    Script.Load(gvBasePath.. "qsb/lib/entityfind.lua");
end
-- Load Metatable fix
if metatable == nil then
    Script.Load(gvBasePath.. "qsb/lib/metatable.lua");
end
-- Load S5Hook
if S5Hook == nil and (not initEMS or not initEMS()) then
    Script.Load(gvBasePath.. "qsb/lib/s5hook.lua");
end

