-- gm_palm_city: only admins can toggle race mode or pick a course.

local raceControlIDs = {}

local function isCourseButton( ent )
    if ent:GetClass() ~= "func_button" then return false end
    if ent:GetName() == "button_racemode" then return true end

    local parent = ent:GetParent()
    return IsValid( parent ) and string.match( parent:GetName(), "^course_%d+_%d+$" )
end

local function buildRaceControls()
    raceControlIDs = {}

    for _, ent in ipairs( ents.GetAll() ) do
        if isCourseButton( ent ) then
            local id = ent:MapCreationID()
            if id ~= -1 then raceControlIDs[id] = true end
        end
    end
end

hook.Add( "Tick", "CFC_MapScripts_RestrictPalmCityButtons", function()
    hook.Remove( "Tick", "CFC_MapScripts_RestrictPalmCityButtons" )
    buildRaceControls()
end )

hook.Add( "PlayerUse", "gm_palm_city_race_admin", function( ply, ent )
    if not IsValid( ent ) or not raceControlIDs[ent:MapCreationID()] then return end

    local now = CurTime()

    if ent:GetPos().z >= 1300 and not ply:IsAdmin() then
        if not ply.CFC_PalmCityRaceDeniedAt or now - ply.CFC_PalmCityRaceDeniedAt >= 10 then
            ply.CFC_PalmCityRaceDeniedAt = now
            ply:ChatPrint( "Only admins can use race controls." )
        end

        return false
    end

    -- PlayerUse runs every tick while +use is held, so only announce once per second
    if not ply.CFC_PalmCityRacePressedAt or now - ply.CFC_PalmCityRacePressedAt >= 1 then
        ply.CFC_PalmCityRacePressedAt = now
        MapScripts.Utils.BroadcastConsole(
            Color( 255, 200, 0 ), "[Race] ",
            team.GetColor( ply:Team() ), ply:Nick(),
            Color( 255, 255, 255 ), " pressed race control " .. ent:MapCreationID() .. " at " .. tostring( ent:GetPos() )
        )
    end
end )
