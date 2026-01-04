local MG_Framework = exports['mg_bridge']:getFramework()

local function SendLog(title, message, color)
    local webhook = StashConfig.Webhooks['logs']
    if not webhook or webhook == '' or webhook:find("TVOJE_URL") then return end

    local embed = {
        {
            ["color"] = color or StashConfig.WebhookSettings['botColor'],
            ["title"] = "**" .. title .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = os.date("%d/%m/%Y | %H:%M:%S"),
                ["icon_url"] = StashConfig.WebhookSettings['botIcon'],
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = StashConfig.WebhookSettings['botName'],
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    
    local dscStatus = (StashConfig.Webhooks['logs'] and not StashConfig.Webhooks['logs']:find("TVOJE_URL")) and "^2AKTIVNI^7" or "^1NEAKTIVNI^7"
    local frameworkName = Config.Framework or "Neznamy"
    local currentLang = Config.Locale or "CZ"
    
    print("^7")
    print("^4==================================================^7")
    print("^4 MG_CODESTASHES: ^2System uspesne nacten^7")
    print("^4 Framework: ^7" .. frameworkName:upper())
    print("^4 Jazyk:     ^7" .. currentLang:upper())
    print("^4 Discord Logy: " .. dscStatus)
    print("^4 Debug Mode: ^7" .. (Config.Debug and "^2ZAPNUT^7" or "^1VYPNUT^7"))
    print("^4==================================================^7")
    print("^7")
end)

RegisterNetEvent('mg_codestashes:registerStash', function (id, label, slots, maxWeight, coords)
    exports.ox_inventory:RegisterStash(id, label, slots, maxWeight, nil, nil, coords)
end)

RegisterNetEvent('mg_codestashes:logAction', function(stashId, label, success)
    local src = source
    local p = MG_Framework.GetPlayer(src)
    local pName = GetPlayerName(src)
    local pIdentifier = (Config.Framework == 'qb') and p.PlayerData.citizenid or p.identifier
    
    if success then
        SendLog("🔓 Stash Otevřen", "Hráč: **"..pName.."**\nID: **"..pIdentifier.."**\nStash: **"..label.."** ("..stashId..")", 65280)
    else
        SendLog("❌ Špatný Kód", "Hráč: **"..pName.."**\nID: **"..pIdentifier.."**\nZkoušel otevřít: **"..label.."** ("..stashId..")", 16711680)
    end
end)