Config = {}

-- Zombie Spawning Configurations
Config.SpawnZombie = 10
Config.MinSpawnDistance = 80
Config.MaxSpawnDistance = 100
Config.DespawnDistance = 120

-- Loot Configurations
Config.ZombieDropLoot = true
Config.ProbabilityWeaponLoot = 3 -- 3%
Config.ProbabilityMoneyLoot = 33 -- 3-33 = 30%
Config.ProbabilityItemLoot = 53 -- 53-43-3 = 7%

-- Weapon and Item Loot Lists
Config.WeaponLoot = {
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PISTOL",
    "WEAPON_MACHETE",
    "WEAPON_CROWBAR",
    "WEAPON_BAT",
    "WEAPON_HATCHET"
}
Config.ItemLoot = {
    'bandage',
    'medikit'
}

-- Object Loot Configurations
Config.ObjectDropLoot = true -- Set to false if experiencing low performance
Config.ObjectsLoot = {
    'prop_box_ammo03a'
}
Config.ProbabilityWeaponLootObject = 2 -- 2%
Config.ProbabilityMoneyLootObject = 22 -- 22-2 20%
Config.ProbabilityItemLootObject = 42 -- 52-22-2 18%

-- Weapon and Item Loot for Objects
Config.WeaponLootObject = {
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PISTOL",
    "WEAPON_MACHETE",
    "WEAPON_CROWBAR",
    "WEAPON_BAT",
    "WEAPON_HATCHET"
}
Config.ItemLootObject = {
    'bread',
    'water'
}

-- Other Configurations
Config.NoPeds = true
Config.Blackout = true
Config.MuteAmbience = true
Config.NotHealthRecharge = true
Config.SafeZone = true
Config.SafeZoneRadioBlip = true
Config.SafeZoneCoords = {
    {x = 226.56, y = -1993.84, z = 19.55, radio = 30.0}
}

Config.Debug = false