ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent("r3_notifications:client:sendNotification")
AddEventHandler("r3_notifications:client:sendNotification", function(msg, style, duration)
	TriggerServerEvent("r3_notifications:server:sendNotification", msg, style, duration)
end)

function clientSendNotification(msg, style, duration)
	TriggerServerEvent("r3_notifications:server:sendNotification", msg, style, duration)
end