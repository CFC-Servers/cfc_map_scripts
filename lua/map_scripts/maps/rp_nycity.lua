-- Removes the admin buttons that break the map.
hook.Add( "CFC_MapScripts_PostMapEntsSpawn", "CFC_MapScripts_nycity", function()
    local button1 = 5495
    SafeRemoveEntity( ents.GetMapCreatedEntity( button1 ) )
    local button2 = 5496
    SafeRemoveEntity( ents.GetMapCreatedEntity( button2 ) )
end )