local ESX = exports["es_extended"]:getSharedObject()

for k, v in ipairs(Config.StashLocs) do
    TriggerServerEvent('MGCodeStashes:registerStash', v.id, v.label, v.slots, v.weight * 1000, vector3(v.coords.x, v.coords.y, v.coords.z + 1))


    RegisterNetEvent('MGCodeStashes:openStash' .. v.id, function()
        local input = lib.inputDialog('Sklad', {
            {type = 'input', label = 'Code For Stash', required = true, password = true, icon = 'fa-solid fa-lock'},
          })

        if input then
            local kod = input[1]
            if kod == v.kod then
                exports.ox_inventory:openInventory('stash', v.id)
            else
                lib.notify({
                    title = 'Code',
                    description = 'You entered the wrong code',
                    type = 'error'
                })
            end
        end
    end)


    exports.ox_target:addBoxZone({
        coords = vector3(v.coords.x, v.coords.y, v.coords.z - 1),
        size = vector3(3.0, 3.0, 3.0),
        rotation = 0.0,
        debug = false,
        options = {
            {
                type = "client",
                event = 'MGCodeStashes:openStash'.. v.id,
                icon = Config.TargetIcon,
                label = Config.TargetLabel,     -- Use the index to specify the label of the box
                distance = 3,
            }
        }
    })

end