local location = "map_scripts/maps/"
local currentMap = game.GetMap()
local loaded = false

--- @class MapScripts
MapScripts = {}
include( "utils.lua" )

local mapFiles = file.Find( location .. "*.lua", "lsv" )
for _, mapFile in ipairs( mapFiles ) do
    local mapString = string.StripExtension( mapFile )
    if mapString == currentMap then
        include( location .. mapString .. ".lua" )
        print( "map_scripts loaded script for " .. currentMap )
        loaded = true
        break
    end
end

if not loaded then
    print( "map_scripts could not find a script for " .. currentMap )
end
