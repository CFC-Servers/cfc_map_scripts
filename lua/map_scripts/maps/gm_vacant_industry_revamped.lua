local entIds = {
    2725, -- color correction
    2716, -- high quality snowfall
    2729, -- toggle skybox
    2696, -- disable smog
    2698, -- fps mode
    2701, -- disable snow
    2889, -- sandbox mode button!!!
    2902, -- shake
    2718, -- fast
}

local buttonClass = "func_button"

hook.Add( "CFC_MapScripts_PostMapEntsSpawn", "CFC_MapScripts_vacant_removeadminbuttons", function()
    local removedEnts = 0
    for _, entId in ipairs( entIds ) do
        local ent = ents.GetMapCreatedEntity( entId )
        if not IsValid( ent ) then
            ErrorNoHaltWithStack("Admin button removal: Couldn't find " .. entId)
            continue
        end
        if ent:GetClass() ~= buttonClass then
            ErrorNoHaltWithStack("Admin button removal: Entity " .. entId .. " is not a button!")
            continue
        end
        removedEnts = removedEnts + 1
        SafeRemoveEntity( ent )
    end
end )
