-- Removes ragdoll doors
hook.Add( "CFC_MapScripts_PostMapEntsSpawn", "CFC_MapScripts_mallparking", function()
    local ragdolls = ents.FindByClass( "prop_ragdoll" )
    for _, ent in ipairs( ragdolls ) do
        if ent:GetModel() == "models/mallparking/models/store_plastic_strip.mdl" then
            ent:Remove()
        end
    end
end )
