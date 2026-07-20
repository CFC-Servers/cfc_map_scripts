resource.AddWorkshop( "311697867" ) -- map
local tracksWSID = "391016040"
resource.AddWorkshop( tracksWSID ) -- tracks
hook.Add( "Contentalizer_ShouldAddWorkshop", "BlockTrackThingForSunsetGulch", function( addon )
    if tostring( addon.wsid ) == tracksWSID then
        return false
    end
end )
