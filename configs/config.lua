Config = {}
Config.Locale = 'cz'
Config.TargetIcon = 'fa-solid fa-box' -- Icon on the target
Config.Debug = true

Config.StashLocs = {
    {
        id = 'test', -- stash id must be original
        label = 'TEst Stash', -- Label when open inv
        slots = 75, -- the number of slots how many stash will have
        weight = 250, -- Max weight of items in the stash, KG
        coords = vector3(-413.9612, -1706.2051, 20.8137), -- stash coords
        kod = '111222' -- code from stash
    },

--[[     {
        id = 'MG', -- stash id must be original
        label = 'MG Stash', -- Label when open inv
        slots = 75, -- the number of slots how many stash will have
        weight = 100, -- Max weight of items in the stash, KG
        coords = vector3(-1294.7871, -395.4861, 36.3431), -- stash coords
        kod = '222012' -- code from stash
    } ]]
}