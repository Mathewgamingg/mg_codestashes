local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('MGCodeStashes:registerStash', function (id, label, slots, maxWeight, coords)
    exports.ox_inventory:RegisterStash(id, label, slots, maxWeight, nil, nil, coords)
end)