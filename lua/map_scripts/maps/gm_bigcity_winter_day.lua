local scareButtonNumber = 3342

-- Removes the mapwide jumpscare sound
hook.Add( "InitPostEntity", "CFC_MapScripts_bigcitywinter", function()
    local ent = ents.GetMapCreatedEntity( scareButtonNumber )
    if not IsValid( ent ) then return end
    ent:Remove()
end )
