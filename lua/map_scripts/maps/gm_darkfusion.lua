local entIDs = {
    6609, -- sound precaching button
    6084, -- cheese dark fusion fuel cells
    4005, -- ditto
    6281, -- cheese stasis charges
    4909, -- ditto
    4454, -- ditto
    4145, -- 1 reactor tps
    4557, -- 2 reactor tps
    5630, -- cleanup debris now
    4050, -- superfast debris cleanup
    5207, -- disable debris cleanup
    5501, -- DISABLE light flickering
    1899, -- Enable infinite fall in core chamber
    4174, -- Disable core disintegration hitbox NOW
    6025, -- actually kill players upon Destruction
    4593, -- DISABLE logic clock
    5203, -- spawn stasis cells RIGHT NOW RIGHT HERE
    6130, -- do something weird with the sound
    4985, -- FORCE STASIS FAILURE (toggle)
    5460, -- force toggle particle enrichment
    4061, -- force toggle ALL lights in case of messed up flickering
    4288, -- color correction, clear
    5192, -- color correction, Pre Explosion
    5959, -- color correction, Dark Energy Limbo
}

hook.Add( "CFC_MapScripts_PostMapEntsSpawn", "CFC_MapScripts_darkfusion_removeadminbuttons", function()
    MapScripts.Utils.RemoveButtonsByID( entIDs )
end )


-- only allow pvpers to mess with the map for maximum LARP
if not CFCPvp then return end

local tooFarDistanceSqr = 200^2

hook.Add( "PlayerUse", "CFC_MapScripts_darkfusion_BlockBuilderUseOnMapButtons", function( ply, ent )
    if ent:MapCreationID() <= -1 then return end
    if not string.find( ent:GetClass(), "button" ) then return end -- not a button? who cares!

    if ply:IsInBuild() then return false end -- pvpers only!

    local plysPos = ply:GetPos()
    if plysPos:DistToSqr( ent:GetPos() ) > tooFarDistanceSqr then return false end -- too far away, probably a wire user, etc

    -- all good, let them use the button
end )