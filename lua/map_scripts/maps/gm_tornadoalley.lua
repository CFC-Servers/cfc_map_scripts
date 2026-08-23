local entIDs = {
    2086, -- button_yestornadoes
    2087, -- button_notornadoes
}

hook.Add( "CFC_MapScripts_PostMapEntsSpawn", "CFC_MapScripts_darkfusion_removeadminbuttons", function()
    MapScripts.Utils.RemoveButtonsByID( entIDs )
end )
