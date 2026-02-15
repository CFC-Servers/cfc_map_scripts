local entIDs = {
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

hook.Add( "CFC_MapScripts_PostMapEntsSpawn", "CFC_MapScripts_vacant_removeadminbuttons", function()
    MapScripts.Utils.RemoveButtonsByID( entIDs )
end )
