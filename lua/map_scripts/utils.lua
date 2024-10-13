MapScripts.Utils = {}
--- @class MapScripts.Utils
local Utils = MapScripts.Utils

--- point_spotlight entities are serverside only, so they don't eat up edict count
--- however, they also spawn "beam" and "spotlight_end" entities that get networked to the client
--- If we try to delete point_spotlight, their children will still exist (and they don't have a MapCreationID)
--- So the goal is to turn them off, then in the next tick, delete them directly
function Utils.TurnOffSpotlights()
    local spotlights = ents.FindByClass( "point_spotlight" )
    for _, spotlight in ipairs( spotlights ) do
        spotlight:Fire( "LightOff" )
    end

    timer.Simple( 1, function()
        for _, spotlight in ipairs( spotlights ) do
            SafeRemoveEntity( spotlight )
        end
    end )
end

--- Finds the shadow controller and sets its "disableallshadows" keyvalue to 1
function Utils.DisableShadowControl()
    local shadowControls = ents.FindByClass( "shadow_control" )

    for _, shadowControl in ipairs( shadowControls ) do
        shadowControl:Fire( "SetShadowsDisabled", 1 )
    end
end
