ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function SendNotification(target, msg, style, duration)
	if Config.NotificationType == "esx" then
		TriggerClientEvent("esx:showNotification", target, msg)
	elseif Config.NotificationType == "chat" then
		TriggerClientEvent("chatMessage", target, msg)
	elseif Config.NotificationType == "mythic" then
		TriggerClientEvent("mythic_notify:client:PersistentHudText", target, { action = "start", id = "r3_prospectingNotification", type = style, text = msg})
		Citizen.Wait(duration)
		TriggerClientEvent("mythic_notify:client:PersistentHudText", target, { action = "end", id = "r3_prospectingNotification" })
	elseif Config.NotificationType == "rdrp" then
		TriggerClientEvent("rdrp_notifications:sendNotification", target, "~s~" .. msg, duration + 2500)
	end
end

RegisterServerEvent("r3_notifications:server:sendNotification")
AddEventHandler("r3_notifications:server:sendNotification", function(msg, style, duration)
    SendNotification(source, msg, style, duration)
end)