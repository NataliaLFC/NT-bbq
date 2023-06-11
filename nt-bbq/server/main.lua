local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nt-bbq:server:CookItem', function(data, food)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local receiveAmount = 1
    Player.Functions.AddItem(data, receiveAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[data], "add")
end)

RegisterNetEvent('nt-bbq:server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove")
end)



----Recipe Item Callbacks

QBCore.Functions.CreateCallback('nt-bbq:server:enoughIngredients', function(source, cb, Ingredients)
    local src = source
    local hasItems = false
    local idk = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(Ingredients) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            idk = idk + 1
            if idk == #Ingredients then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)

QBCore.Functions.CreateUseableItem("bbq1", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("nt-bbq:PlaceBBQ1", src, item.name)
end)

QBCore.Functions.CreateUseableItem("bbq2", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("nt-bbq:PlaceBBQ2", src, item.name)
end)

QBCore.Functions.CreateUseableItem("bbq3", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("nt-bbq:PlaceBBQ3", src, item.name)
end)

QBCore.Functions.CreateUseableItem("bbq4", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("nt-bbq:PlaceBBQ4", src, item.name)
end)

QBCore.Functions.CreateUseableItem("bbq5", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("nt-bbq:PlaceBBQ5", src, item.name)
end)

RegisterNetEvent('nt-bbq:server:RemoveBBQ1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bbq1', 1)
end)

RegisterNetEvent('nt-bbq:server:PickupBBQ1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('bbq1', 1)
end)

RegisterNetEvent('nt-bbq:server:RemoveBBQ2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bbq2', 1)
end)

RegisterNetEvent('nt-bbq:server:PickupBBQ2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('bbq2', 1)
end)

RegisterNetEvent('nt-bbq:server:RemoveBBQ3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bbq3', 1)
end)

RegisterNetEvent('nt-bbq:server:PickupBBQ3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('bbq3', 1)
end)

RegisterNetEvent('nt-bbq:server:RemoveBBQ4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bbq4', 1)
end)

RegisterNetEvent('nt-bbq:server:PickupBBQ4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('bbq4', 1)
end)

RegisterNetEvent('nt-bbq:server:RemoveBBQ5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bbq5', 1)
end)

RegisterNetEvent('nt-bbq:server:PickupBBQ5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('bbq5', 1)
end)