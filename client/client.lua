local MG = exports['mg_bridge']:getBridge()

for k, v in ipairs(Config.StashLocs) do
    TriggerServerEvent('mg_codestashes:registerStash', v.id, v.label, v.slots, v.weight * 1000, v.coords)

    RegisterNetEvent('mg_codestashes:openStash' .. v.id, function()
        local input = lib.inputDialog(v.label, {
            {type = 'input', label = Locale["CodePlace"], required = true, password = true, icon = 'fa-solid fa-lock'},
        })

        if input then
            if input[1] == v.kod then
                TriggerServerEvent('mg_codestashes:logAction', v.id, v.label, true)
                exports.ox_inventory:openInventory('stash', v.id)
            else
                TriggerServerEvent('mg_codestashes:logAction', v.id, v.label, false)
                MG.Notify('error', Locale["NotifyTittle"], Locale["NotifyDesc"], 5000, 'fas fa-lock')
            end
        end
    end)

    MG.AddBoxZone("stash_" .. v.id, v.coords, vector3(1.5, 1.5, 2.0), {
        {
            type = "client",
            event = 'mg_codestashes:openStash' .. v.id,
            icon = Config.TargetIcon,
            label = Locale["TargetLabel"],
            distance = 2.5,
        }
    })
end