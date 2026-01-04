local MG = exports['mg_bridge']:getBridge()

local function DoDebug(msg)
    if Config.Debug then
        print('^4[MG_CodeStashes:DEBUG] ^7' .. msg)
    end
end

for k, v in ipairs(Config.StashLocs) do
    TriggerServerEvent('mg_codestashes:registerStash', v.id, v.label, v.slots, v.weight * 1000, v.coords)

    RegisterNetEvent('mg_codestashes:openStash' .. v.id, function()
        DoDebug('Pokus o otevření stashe: ' .. v.id)
        
        local input = lib.inputDialog(v.label, {
            {
                type = 'input', 
                label = Locale["CodePlace"], 
                required = true, 
                password = true, 
                icon = 'fa-solid fa-lock'
            },
        })

        if input then
            if input[1] == v.kod then
                DoDebug('Kód zadán správně pro: ' .. v.id)
                exports.ox_inventory:openInventory('stash', v.id)
            else
                DoDebug('Špatný kód pro: ' .. v.id)
                MG.Notify('error', Locale["NotifyTittle"], Locale["NotifyDesc"], 5000, 'fas fa-lock')
            end
        end
    end)

    MG.AddBoxZone(
        "stash_" .. v.id, 
        v.coords, 
        vector3(1.5, 1.5, 2.0), 
        {
            {
                type = "client",
                event = 'mg_codestashes:openStash' .. v.id,
                icon = Config.TargetIcon,
                label = Locale["TargetLabel"],
                distance = 2.5,
            }
        }
    )
end