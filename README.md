A BBQ Script for QBCore Framework
Please make sure u use the latest dependencies in order for this to work.
This script has been tested on the latest build as of 12/06/2022.

If not for @oosayeroo, this script wouldnt have happened. This is a recreation of some sort of his script/ base of his script.

Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-shops - https://github.com/qbcore-framework/qb-shops




PUT INTO qb-core/shared/items.lua

--

    ['burger'] 			        = {['name'] = 'burger', 		        	   	['label'] = 'Beef Burger', 		    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'burger.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Juicy Beef Burger'},
    ['raw-burger'] 			    = {['name'] = 'raw-burger', 		           	['label'] = 'Raw Burger', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'raw-burger.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Patty of Beef'},
    ['chicken-burger'] 			        = {['name'] = 'chicken-burger', 		        	   	['label'] = 'Chicken Burger', 	    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chicken-burger.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Tender Chicken Burger'},
    ['raw-chicken-burger'] 			    = {['name'] = 'raw-chicken-burger', 		           	['label'] = 'Raw Chicken Burger',   ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'raw-chicken-burger.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Chicken Patty'},
    ['hotdog'] 			        = {['name'] = 'hotdog', 		        	   	['label'] = 'HotDog', 		        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'hotdog.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Topped HotDog'},
    ['raw-hotdog'] 			    = {['name'] = 'raw-hotdog', 		           	['label'] = 'Raw HotDog', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'raw-hotdog.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw HotDog'},
    ['ribs'] 			            = {['name'] = 'ribs', 		        	   	['label'] = 'Spare Ribs', 		    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'ribs.png', 	            	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Tangy Rack of Ribs'},
    ['raw-ribs'] 	     		    = {['name'] = 'raw-ribs', 		             	['label'] = 'Raw Ribs', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'raw-ribs.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Rack of Ribs'},
    ['brisket'] 			        = {['name'] = 'brisket', 		        	   	['label'] = 'Brisket Joint', 	    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'brisket.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Nicely Cooked Brisket'},
    ['raw-brisket'] 			    = {['name'] = 'raw-brisket', 		           	['label'] = 'Raw Brisket', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'raw-brisket.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Raw Brisket Joint'},
    ['jacket'] 			        = {['name'] = 'jacket', 		        	   	['label'] = 'Loaded Jacket', 	    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'jacket.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Fully Loaded Jacket Potato'},
    ['raw-jacket'] 			    = {['name'] = 'raw-jacket', 		           	['label'] = 'Raw Jacket', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'raw-jacket.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Jacket Potato'},
    ['bbq1'] 			 	    	 = {['name'] = 'bbq1', 					    	['label'] = 'Forge Djorman', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bbq1.png', 		    		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'For when youre wanting that perfect char-grilled taste'},
    ['bbq2'] 			 			 = {['name'] = 'bbq2', 					    	['label'] = 'Leetle Grill', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bbq2.png', 		    		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Who likes tiny portable grills? We do'},
    ['bbq3'] 			 			 = {['name'] = 'bbq3', 					    	['label'] = 'Stand Grill', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bbq3.png', 		    		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Its not the best, but definitely not the worst either'},
    ['bbq4'] 			 			 = {['name'] = 'bbq4', 				    		['label'] = 'Craftguy Grill', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bbq4.png', 		    		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'This may create hockey pucks of char'},
    ['bbq5'] 			 			 = {['name'] = 'bbq5', 				    		['label'] = 'Brick-Lain Grill', 	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bbq5.png', 		    		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'So youre old fashioned, huh?'},
	
--

-- PUT INTO qb-smallresources/Config/ConsumeablesEat

    ["hotdog"] = math.random(35, 54),
    ["burger"] = math.random(35, 54),
    ["brisket"] = math.random(35, 54),
    ["chicken"] = math.random(35, 54),
    ["ribs"] = math.random(35, 54),
    ["jacket"] = math.random(35, 54),


PUT INTO qb-smallresources/Server/Consumeables

--
 		

QBCore.Functions.CreateUseableItem("burger", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("chicken-burger", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hotdog", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ribs", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("brisket", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("jacket", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)


--
