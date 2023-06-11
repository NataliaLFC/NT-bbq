local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nt-bbq:StartConvo', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Jeff |",txt = "Hey Man hows it going?",isMenuHeader = true, },
        {header = "Im feeling good, Thank you",txt = "",params = {event = "nt-bbq:FeelingGood"}},
        {header = "Im not having a good day today",txt = "",params = {event = "nt-bbq:FeelingBad"}},
    })
end)

RegisterNetEvent('nt-bbq:FeelingGood', function(data)
    exports['qb-menu']:openMenu({
        {header = "| That is Great to hear Friend, you looking to buy some fresh BBQ products? |",isMenuHeader = true, },
        {header = "Yea i would love to browse your stuff",txt = "$ Buy $",params = {event = "nt-bbq:shop"}},
        {header = "No thank you, ill be going now",txt = "",params = {}},
    })
end)

RegisterNetEvent('nt-bbq:FeelingBad', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Oh No that is a shame, can i interest you in some fresh BBQ products? |",isMenuHeader = true, },
        {header = "Sure, i guess so...",txt = "$ Buy $",params = {event = "nt-bbq:shop"}},
        {header = "No thank you, ill be going now",txt = "",params = {}},
    })
end)


Citizen.CreateThread(function()
    if Config.EnableBBQShop == true then
        exports['qb-target']:SpawnPed({
            model = Config.BuyPed,
            coords = Config.BuyLocation, 
            minusOne = true, --may have to change this if your ped is in the ground
            freeze = true, 
            invincible = true, 
            blockevents = true,
            scenario = 'WORLD_HUMAN_DRUG_DEALER',
            target = { 
                options = {
                    {
                        type="client",
                        event = "nt-bbq:CheckConvo",
                        icon = "fas fa-smile",
                        label = "Greet"
                    }
                },
              distance = 2.5,
            },
        })
    end
end)