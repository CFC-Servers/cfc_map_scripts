local removeThese = {
    env_steam = true,
    env_sprite = true,
    prop_ragdoll = true,
    dynamic_light = true,
    light_dynamic = true,
    env_soundscape = true,
    func_dustmotes = true,
    ambient_generic = true,
    func_illusionary = true,
    env_physexplosion = true,
    env_fog_controller = true,
    func_reflective_glass = true,
    prop_physics = true,

    weapon_357 = true,
    weapon_ar2 = true,
    weapon_crossbow = true,
    weapon_crowbar = true,
    weapon_frag = true,
    weapon_physcannon = true,
    weapon_physgun = true,
    weapon_pistol = true,
    weapon_rpg = true,
    weapon_shotgun = true,
    weapon_smg1 = true,
    item_ammo_crate = true,
    item_ammo_pistol = true,
    item_ammo_smg1 = true,
    item_box_buckshot = true,
    item_healthkit = true,
    item_item_crate = true,

}

local function isMapEnt( ent )
    return ent:MapCreationID() ~= -1
end

hook.Add( "CFC_MapScripts_PostMapEntsSpawn", "GMS_BoreasCleaner", function()
    -- Technically the spotlights on this map are set to "efficient" and "no dynamic light" but we can get rid of a
    -- bunch of networked ents by turning them off and then removing them
    MapScripts.Utils.TurnOffSpotlights()

    MapScripts.Utils.DisableShadowControl()

    for _, ent in ipairs( ents.GetAll() ) do
        if removeThese[ent:GetClass()] and isMapEnt( ent ) then
            SafeRemoveEntity( ent )
        end
    end
end )
