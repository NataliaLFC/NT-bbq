local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local IsCookingFood = false
Shops = {}
local BBQ1Placed = false
local BBQ1PickedUp = true
local BBQ2Placed = false
local BBQ2PickedUp = true
local BBQ3Placed = false
local BBQ3PickedUp = true
local BBQ4Placed = false
local BBQ4PickedUp = true
local BBQ5Placed = false
local BBQ5PickedUp = true
local FuelLevel = 0
local FuelAmount = 0
local AddingFueling = false

Citizen.CreateThread(function()
    if Config.EnableFuelSystem == false then
        FuelLevel = 100
    end
end)

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.BBQ1Model, {
        options = {
            {
                icon = "fas fa-burger",
                label = "Use BBQ",
                action = function()
                    OpenCookingMenu()
                end
            },
            {
                type = "client",
                event = "nt-bbq:PickupBBQ1",
                icon = "fas fa-hand",
                label = "Pickup BBQ",
            },
            {
                type = "client",
                event = "nt-bbq:AddBBQFuel",
                icon = "fas fa-fill-drip",
                label = "Add Fuel",
                canInteract = function(entity, distance, data) 
                    if Config.EnableFuelSystem == false then return false end 
                    return true
                  end,
            },
        },
        distance = 2.5
    })
    exports['qb-target']:AddTargetModel(Config.BBQ2Model, {
        options = {
            {
                icon = "fas fa-burger",
                label = "Use BBQ",
                action = function()
                    OpenCookingMenu()
                end
            },
            {
                type = "client",
                event = "nt-bbq:PickupBBQ2",
                icon = "fas fa-hand",
                label = "Pickup BBQ",
            },
            {
                type = "client",
                event = "nt-bbq:AddBBQFuel",
                icon = "fas fa-fill-drip",
                label = "Add Fuel",
                canInteract = function(entity, distance, data) 
                    if Config.EnableFuelSystem == false then return false end 
                    return true
                  end,
            },
        },
        distance = 2.5
    })
    exports['qb-target']:AddTargetModel(Config.BBQ3Model, {
        options = {
            {
                icon = "fas fa-burger",
                label = "Use BBQ",
                action = function()
                    OpenCookingMenu()
                end
            },
            {
                type = "client",
                event = "nt-bbq:PickupBBQ3",
                icon = "fas fa-hand",
                label = "Pickup BBQ",
            },
            {
                type = "client",
                event = "nt-bbq:AddBBQFuel",
                icon = "fas fa-fill-drip",
                label = "Add Fuel",
                canInteract = function(entity, distance, data) 
                    if Config.EnableFuelSystem == false then return false end 
                    return true
                  end,
            },
        },
        distance = 2.5
    })
    exports['qb-target']:AddTargetModel(Config.BBQ4Model, {
        options = {
            {
                icon = "fas fa-burger",
                label = "Use BBQ",
                action = function()
                    OpenCookingMenu()
                end
            },
            {
                type = "client",
                event = "nt-bbq:PickupBBQ4",
                icon = "fas fa-hand",
                label = "Pickup BBQ",
            },
            {
                type = "client",
                event = "nt-bbq:AddBBQFuel",
                icon = "fas fa-fill-drip",
                label = "Add Fuel",
                canInteract = function(entity, distance, data) 
                    if Config.EnableFuelSystem == false then return false end 
                    return true
                  end,
            },
        },
        distance = 2.5
    })
    exports['qb-target']:AddTargetModel(Config.BBQ5Model, {
        options = {
            {
                icon = "fas fa-burger",
                label = "Use BBQ",
                action = function()
                    OpenCookingMenu()
                end
            },
            {
                type = "client",
                event = "nt-bbq:PickupBBQ5",
                icon = "fas fa-hand",
                label = "Pickup BBQ",
            },
            {
                type = "client",
                event = "nt-bbq:AddBBQFuel",
                icon = "fas fa-fill-drip",
                label = "Add Fuel",
                canInteract = function(entity, distance, data) 
                    if Config.EnableFuelSystem == false then return false end 
                    return true
                  end,
            },
        },
        distance = 2.5
    })
    -- if Config.EnableStoves == true then --WIP(do not use)
    --     for k,v in pairs(Config.StoveModels) do
    --         exports['qb-target']:AddTargetModel(v.model, {
    --             options = {
    --                 {
    --                     icon = "fas fa-fire",
    --                     label = "Cook",
    --                     action = function()
    --                         OpenCookingMenu()
    --                     end
    --                 }
    --             },
    --             distance = 2.5
    --         })
    --     end
    -- end
end)


RegisterNetEvent("nt-bbq:shop")
AddEventHandler("nt-bbq:shop", function()
    if Config.JimShops == true then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", Config.BBQShop.label, Config.BBQShop)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", Config.BBQShop.label, Config.BBQShop)
    end
end)

RegisterNetEvent('nt-bbq:CheckConvo', function()
    if Config.EnableConvo then
        TriggerEvent('nt-bbq:StartConvo')
    else
        TriggerEvent('nt-bbq:shop')
    end
end)

------/////////NEW PROP SHOPS///////-------
RegisterNetEvent("nt-bbq:propshop")
AddEventHandler("nt-bbq:propshop", function()
    if Config.JimShops == true then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", Config.PropShop.label, Config.PropShop)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", Config.PropShop.label, Config.PropShop)
    end
end)

Shops.Draw3DText = function(coords, text)
    if Config.EnablePropShop == true then
        local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
        
        SetTextScale(0.38, 0.38)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 200)
        SetTextEntry("STRING")
        SetTextCentre(1)

        AddTextComponentString(text)
        DrawText(_x, _y)

        local factor = string.len(text) / 370
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
    end
end

Citizen.CreateThread(function()
    if Config.EnablePropShop == true then
	    for i = 1, #Config.PropShopLoc do
	    	local blip = AddBlipForCoord(Config.PropShopLoc[i])

	    	SetBlipSprite(blip, 541)
	    	SetBlipScale(blip, 0.5)
	    	SetBlipDisplay(blip, 4)
	    	SetBlipAsShortRange(blip, true)

	    	BeginTextCommandSetBlipName('STRING')
	    	AddTextComponentString('Home Grillin')
	    	EndTextCommandSetBlipName(blip)	
	    end

	    while true do
	    	local player, sleepThread = PlayerPedId(), 750;

	    	for i = 1, #Config.PropShopLoc do
	    		local dst = #(GetEntityCoords(player) - Config.PropShopLoc[i]);

	    		if dst < 2.5 then
	    			Shops.Draw3DText(Config.PropShopLoc[i], '[~g~E~w~] Home Grillin');  --words you see when near shop
	    			sleepThread = 5;

	    			if dst < 1.5 then
	    				if IsControlJustReleased(0, 38) then
	    					TriggerEvent('nt-bbq:propshop')
	    				end
	    			end
	    		end
	    	end
            
	    	Citizen.Wait(sleepThread)
	    end
    end
end)

Citizen.CreateThread(function()
    if Config.EnableBBQShop == true then
        meatguy = AddBlipForCoord(Config.BuyLocation)
        SetBlipSprite (meatguy, 671)
        SetBlipDisplay(meatguy, 4)
        SetBlipScale  (meatguy, 0.4)
        SetBlipAsShortRange(meatguy, true)
        SetBlipColour(meatguy, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Meat Guy")
        EndTextCommandSetBlipName(meatguy)
    end
end) 


----/////BBQ 1 //////-----------

RegisterNetEvent("nt-bbq:PlaceBBQ1")
AddEventHandler("nt-bbq:PlaceBBQ1", function()
    if not BBQ1Placed then
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local forward   = GetEntityForwardVector(playerPed)
        local x, y, z   = table.unpack(coords + forward * 1.0)

        local bbq1 = `prop_bbq_1`
        RequestModel(bbq1)
        while (not HasModelLoaded(bbq1)) do
            Wait(1)
        end
        bbqprop1 = CreateObject(bbq1, x, y, z, true, false, true)
        PlaceObjectOnGroundProperly(bbqprop1)
        SetEntityAsMissionEntity(bbqprop1)

        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
        QBCore.Functions.Progressbar('name_here', 'Placing BBQ...', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            BBQ1Placed = true
            BBQ1PickedUp = false

            if Config.RemoveItemOnPlace then
                TriggerServerEvent('nt-bbq:server:RemoveBBQ1')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['bbq1'], "remove")
            end
        end)
    else
        QBCore.Functions.Notify('You Already Have This BBQ Placed', 'error', 5000)
    end
end)

RegisterNetEvent('nt-bbq:PickupBBQ1')
AddEventHandler('nt-bbq:PickupBBQ1', function()
    if not BBQ1PickedUp and BBQ1Placed then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar('pick', 'Picking Up BBQ', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            if Config.RemoveItemOnPlace then
                TriggerServerEvent("nt-bbq:server:PickupBBQ1")
            end
            Wait(200)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            DeleteEntity(bbqprop1)
        QBCore.Functions.Notify('You Picked Up BBQ', 'primary', 7500)
        BBQ1Placed = false
        BBQ1PickedUp = true
        end, function()
        QBCore.Functions.Notify('Cancelled', 'error', 7500)
        BBQ1Placed = false
        BBQ1PickedUp = true
        end)
    end
end)

----///////BBQ 2 ///////////-------
RegisterNetEvent("nt-bbq:PlaceBBQ2")
AddEventHandler("nt-bbq:PlaceBBQ2", function()
    if not BBQ2Placed then
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local forward   = GetEntityForwardVector(playerPed)
        local x, y, z   = table.unpack(coords + forward * 1.0)

        local bbq2 = `prop_bbq_2`
        RequestModel(bbq2)
        while (not HasModelLoaded(bbq2)) do
            Wait(1)
        end
         bbqprop2 = CreateObject(bbq2, x, y, z, true, false, true)
        PlaceObjectOnGroundProperly(bbqprop2)
        SetEntityAsMissionEntity(bbqprop2)

        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
        QBCore.Functions.Progressbar('name_here', 'Placing BBQ...', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            BBQ2Placed = true
            BBQ2PickedUp = false

            if Config.RemoveItemOnPlace then
                TriggerServerEvent('nt-bbq:server:RemoveBBQ2')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['bbq2'], "remove")
            end
        end)
    else
        QBCore.Functions.Notify('You Already Have This BBQ Placed', 'error', 5000)
    end
end)

RegisterNetEvent('nt-bbq:PickupBBQ2')
AddEventHandler('nt-bbq:PickupBBQ2', function()
    if not BBQ2PickedUp and BBQ2Placed then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar('pick', 'Picking Up BBQ', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            if Config.RemoveItemOnPlace then
                TriggerServerEvent("nt-bbq:server:PickupBBQ2")
            end
            Wait(200)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            DeleteEntity(bbqprop2)
        QBCore.Functions.Notify('You Picked Up BBQ', 'primary', 7500)
        BBQ2Placed = false
        BBQ2PickedUp = true
        end, function()
        QBCore.Functions.Notify('Cancelled', 'error', 7500)
        BBQ2Placed = false
        BBQ2PickedUp = true
        end)
     end
end)

----///////BBQ 3 ///////////-------
RegisterNetEvent("nt-bbq:PlaceBBQ3")
AddEventHandler("nt-bbq:PlaceBBQ3", function()
    if not BBQ3Placed then
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local forward   = GetEntityForwardVector(playerPed)
        local x, y, z   = table.unpack(coords + forward * 1.0)

        local bbq3 = `prop_bbq_4`
        RequestModel(bbq3)
        while (not HasModelLoaded(bbq3)) do
            Wait(1)
        end
         bbqprop3 = CreateObject(bbq3, x, y, z, true, false, true)
        PlaceObjectOnGroundProperly(bbqprop3)
        SetEntityAsMissionEntity(bbqprop3)

        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
        QBCore.Functions.Progressbar('name_here', 'Placing BBQ...', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            BBQ3Placed = true
            BBQ3PickedUp = false

            if Config.RemoveItemOnPlace then
                TriggerServerEvent('nt-bbq:server:RemoveBBQ3')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['bbq3'], "remove")
            end
        end)
    else
        QBCore.Functions.Notify('You Already Have This BBQ Placed', 'error', 5000)
    end
end)

RegisterNetEvent('nt-bbq:PickupBBQ3')
AddEventHandler('nt-bbq:PickupBBQ3', function()
    if not BBQ3PickedUp and BBQ3Placed then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar('pick', 'Picking Up BBQ', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            if Config.RemoveItemOnPlace then
                TriggerServerEvent("nt-bbq:server:PickupBBQ3")
            end
            Wait(200)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            DeleteEntity(bbqprop3)
        QBCore.Functions.Notify('You Picked Up BBQ', 'primary', 7500)
        BBQ3Placed = false
        BBQ3PickedUp = true
        end, function()
        QBCore.Functions.Notify('Cancelled', 'error', 7500)
        BBQ3Placed = false
        BBQ3PickedUp = true
        end)
     end
end)

----///////BBQ 4 ///////////-------
RegisterNetEvent("nt-bbq:PlaceBBQ4")
AddEventHandler("nt-bbq:PlaceBBQ4", function()
    if not BBQ4Placed then
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local forward   = GetEntityForwardVector(playerPed)
        local x, y, z   = table.unpack(coords + forward * 1.0)

        local bbq4 = `prop_bbq_5`
        RequestModel(bbq4)
        while (not HasModelLoaded(bbq4)) do
            Wait(1)
        end
         bbqprop4 = CreateObject(bbq4, x, y, z, true, false, true)
        PlaceObjectOnGroundProperly(bbqprop4)
        SetEntityAsMissionEntity(bbqprop4)

        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
        QBCore.Functions.Progressbar('name_here', 'Placing BBQ...', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            BBQ4Placed = true
            BBQ4PickedUp = false

            if Config.RemoveItemOnPlace then
                TriggerServerEvent('nt-bbq:server:RemoveBBQ4')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['bbq4'], "remove")
            end
        end)
    else
        QBCore.Functions.Notify('You Already Have This BBQ Placed', 'error', 5000)
    end
end)

RegisterNetEvent('nt-bbq:PickupBBQ4')
AddEventHandler('nt-bbq:PickupBBQ4', function()
    if not BBQ4PickedUp and BBQ4Placed then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar('pick', 'Picking Up BBQ', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            if Config.RemoveItemOnPlace then
                TriggerServerEvent("nt-bbq:server:PickupBBQ4")
            end
            Wait(200)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            DeleteEntity(bbqprop4)
        QBCore.Functions.Notify('You Picked Up BBQ', 'primary', 7500)
        BBQ4Placed = false
        BBQ4PickedUp = true
        end, function()
        QBCore.Functions.Notify('Cancelled', 'error', 7500)
        BBQ4Placed = false
        BBQ4PickedUp = true
        end)
     end
end)

----///////BBQ 5 ///////////-------
RegisterNetEvent("nt-bbq:PlaceBBQ5")
AddEventHandler("nt-bbq:PlaceBBQ5", function()
    if not BBQ5Placed then
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local forward   = GetEntityForwardVector(playerPed)
        local x, y, z   = table.unpack(coords + forward * 1.0)

        local bbq5 = `prop_bbq_3`
        RequestModel(bbq5)
        while (not HasModelLoaded(bbq5)) do
            Wait(1)
        end
         bbqprop5 = CreateObject(bbq5, x, y, z, true, false, true)
        PlaceObjectOnGroundProperly(bbqprop5)
        SetEntityAsMissionEntity(bbqprop5)

        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
        QBCore.Functions.Progressbar('name_here', 'Placing BBQ...', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            BBQ5Placed = true
            BBQ5PickedUp = false

            if Config.RemoveItemOnPlace then
                TriggerServerEvent('nt-bbq:server:RemoveBBQ5')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['bbq5'], "remove")
            end
        end)
    else
        QBCore.Functions.Notify('You Already Have This BBQ Placed', 'error', 5000)
    end
end)

RegisterNetEvent('nt-bbq:PickupBBQ5')
AddEventHandler('nt-bbq:PickupBBQ5', function()
    if not BBQ5PickedUp and BBQ5Placed then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar('pick', 'Picking Up BBQ', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            if Config.RemoveItemOnPlace then
                TriggerServerEvent("nt-bbq:server:PickupBBQ5")
            end
            Wait(200)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            DeleteEntity(bbqprop5)
        QBCore.Functions.Notify('You Picked Up BBQ', 'primary', 7500)
        BBQ5Placed = false
        BBQ5PickedUp = true
        end, function()
        QBCore.Functions.Notify('Cancelled', 'error', 7500)
        BBQ5Placed = false
        BBQ5PickedUp = true
        end)
    end
end)

function OpenCookingMenu()
    local columns = {
        {header = "Cook",isMenuHeader = true,}, 
        {header = "Fuel",text = " "..FuelLevel.."% Remaining...",args = {Config.EnableFuelSystem == true},},
    }
    for k, v in pairs(Config.Recipes) do
        local item = {}
        item.header = "<img src=nui://"..Config.ImagePath..QBCore.Shared.Items[v.hash].image.." width=35px style='margin-right: 10px'> " .. v.label 
        local text = ""
        for k, v in pairs(v.Ingredients) do
            text = text .. "- " .. v.item .. ": " .. v.amount .. "<br>"
        end
        item.text = text
        item.params = {event = 'nt-bbq:client:CookItem',args = {type = k}}
        table.insert(columns, item)
    end

    exports['qb-menu']:openMenu(columns)
end

RegisterNetEvent('nt-bbq:AddBBQFuel', function()
    print(FuelLevel)
    if QBCore.Functions.HasItem(Config.FuelItem) then
        if FuelLevel == 0 then
            FuelAmount = 100
        end
        if FuelLevel >= 0 and FuelLevel < 100 then
            AddingFueling = true
            print(AddingFueling)
            QBCore.Functions.Progressbar('fueling_bbq', 'Fueling', Config.FuelingTime*1000, false, false, {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, {
                animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                anim = 'machinic_loop_mechandplayer',
                flags = 8,
            }, {}, {}, function()
                QBCore.Functions.Notify("Added "..FuelAmount.."%", 'success')
                TriggerServerEvent('nt-bbq:server:RemoveItem', Config.FuelItem, 1)
                ClearPedTasks(PlayerPedId())
                AddingFueling = false
                FuelLevel = FuelLevel + FuelAmount
                print(FuelLevel)
            end, function() -- Cancel
                ClearPedTasks(PlayerPedId())
                QBCore.Functions.Notify('You Stopped Fueling', 'error')
                AddingFueling = false
            end)
        else
            QBCore.Functions.Notify('You are already at 100%', 'error', 2000)
        end
    else
        QBCore.Functions.Notify('You Dont have any Fuel to add', 'error', 2000)
    end
end)


local function CookFood(food, data)
    if Config.EnableFuelSystem == true then
        if FuelLevel >= Config.Recipes[food].FuelRequired then
            IsCookingFood = true
            QBCore.Functions.Progressbar('cooking_food', 'Cooking '..Config.Recipes[food].label, Config.Recipes[food].CookTime * 1000, false, false, {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                QBCore.Functions.Notify("Cooked "..Config.Recipes[food].label, 'success')
                TriggerServerEvent('nt-bbq:server:CookItem', Config.Recipes[food].hash)
                for k, v in pairs(Config.Recipes[food].Ingredients) do
                    TriggerServerEvent('nt-bbq:server:RemoveItem', v.item, v.amount)
                end
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                ClearPedTasks(PlayerPedId())
                IsCookingFood = false
                FuelLevel = FuelLevel-Config.Recipes[food].FuelRequired
            end, function() -- Cancel
                ClearPedTasks(PlayerPedId())
                QBCore.Functions.Notify('You Stopped Cooking', 'error')
                IsCookingFood = false
            end)
        else
            QBCore.Function.Notify('Not Enough Fuel', 'error', 2000)
        end
    else
        IsCookingFood = true
            QBCore.Functions.Progressbar('cooking_food', 'Cooking '..Config.Recipes[food].label, Config.Recipes[food].CookTime * 1000, false, false, {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                QBCore.Functions.Notify("Cooked "..Config.Recipes[food].label, 'success')
                TriggerServerEvent('nt-bbq:server:CookItem', Config.Recipes[food].hash)
                for k, v in pairs(Config.Recipes[food].Ingredients) do
                    TriggerServerEvent('nt-bbq:server:RemoveItem', v.item, v.amount)
                end
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                ClearPedTasks(PlayerPedId())
                IsCookingFood = false
            end, function() 
                ClearPedTasks(PlayerPedId())
                QBCore.Functions.Notify('You Stopped Cooking', 'error')
                IsCookingFood = false
            end)
        end
    end



-- Events

RegisterNetEvent('nt-bbq:client:CookItem', function(data)
    QBCore.Functions.TriggerCallback("nt-bbq:server:enoughIngredients", function(hasIngredients)
        if (hasIngredients) and not IsCookingFood then
            CookFood(data.type)
        else
            QBCore.Functions.Notify("You do not have enough ingredients", "error")
            return
        end
    end, Config.Recipes[data.type].Ingredients)
end)