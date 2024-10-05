local holdingup = false
local store = ""
local blipRobbery = nil
local vetrineRotte = 0 

local vetrine = {
	{x = 150.5854, y = -221.888, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 149.8964, y = -223.482, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 148.8737, y = -226.359, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 148.3208, y = -227.974, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 146.7906, y = -222.118, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 147.4307, y = -220.655, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 145.6060, y = -225.377, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 145.1682, y = -226.648, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 150.1007, y = -228.362, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 150.5530, y = -227.067, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 151.6634, y = -223.995, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 152.3723, y = -222.220, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 146.9749, y = -227.247, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 147.5096, y = -225.795, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 148.5435, y = -222.659, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 149.0817, y = -221.173, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 154.0665, y = -223.194, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 153.6147, y = -224.488, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 152.3458, y = -227.832, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 151.9741, y = -229.080, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 155.2684, y = -225.164, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 155.8231, y = -223.634, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 154.1455, y = -228.241, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 153.6436, y = -229.667, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 155.0730, y = -230.269, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 155.7072, y = -228.809, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 156.7622, y = -225.843, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 157.2997, y = -224.236, z = 54.424, heading = 245.87, isOpen = false},--
	{x = 156.8782, y = -230.947, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 157.4423, y = -229.376, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 158.5475, y = -226.335, z = 54.424, heading = 70.11, isOpen = false},--
	{x = 159.0990, y = -224.879, z = 54.424, heading = 70.11, isOpen = false},--
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)

	AddTextComponentString(text)
	DrawText(_x, _y)

end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end)

function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent('esx_applerobbery:currentlyrobbing')
AddEventHandler('esx_applerobbery:currentlyrobbing', function(robb)
	holdingup = true
	store = robb
end)

RegisterNetEvent('esx_applerobbery:killblip')
AddEventHandler('esx_applerobbery:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_applerobbery:setblip')
AddEventHandler('esx_applerobbery:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_applerobbery:toofarlocal')
AddEventHandler('esx_applerobbery:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	incircle = false
end)


RegisterNetEvent('esx_applerobbery:robberycomplete')
AddEventHandler('esx_applerobbery:robberycomplete', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_complete'))
	store = ""
	incircle = false
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 793)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)

animazione = false
incircle = false
soundid = GetSoundId()

function drawTxt(x, y, scale, text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.64, 0.64)
	SetTextColour(red, green, blue, alpha)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
    DrawText(0.155, 0.935)
end

local borsa = nil

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(1000)
	  TriggerEvent('skinchanger:getSkin', function(skin)
		borsa = skin['bags_1']
	  end)
	  Citizen.Wait(1000)
	end
end)

RegisterCommand("QuitarBolsa", function(source)
	TriggerEvent('skinchanger:change', "bags_1", 0)
end)

RegisterNetEvent('esx_vangelico:putBag')
AddEventHandler('esx_vangelico:putBag',
	function()
		TriggerEvent('skinchanger:change', "bags_1", 22)
	end
)

Citizen.CreateThread(function()
      
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		s = 1000
		for k,v in pairs(Stores)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					s = 0
					DrawMarker(1, v.position.x, v.position.y, v.position.z-0.9, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.5, 2.5, 0.1, 252, 15, 192, 100, false, true, 2, false, false, false, false)


					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob'))
						end
						incircle = true
						if IsPedShooting(GetPlayerPed(-1)) then
							if Config.NeedBag then
							    if  borsa ~= -1 and borsa ~= 0 then
							        ESX.TriggerServerCallback('esx_applerobbery:poldispjonis', function(CopsConnected)
								        if CopsConnected >= Config.RequiredCopsRob then
							                TriggerServerEvent('esx_applerobbery:rob', k)
									        PlaySoundFromCoord(soundid, "VEHICLES_HORNS_AMBULANCE_WARNING", pos2.x, pos2.y, pos2.z)
								        else
									        TriggerEvent('esx:showNotification', _U('min_two_police') .. Config.RequiredCopsRob .. _U('min_two_police2'))
								        end
							        end)
						        else
							        TriggerEvent('esx:showNotification', _U('need_bag'))
								end
							else
								ESX.TriggerServerCallback('esx_applerobbery:poldispjonis', function(CopsConnected)
									if CopsConnected >= Config.RequiredCopsRob then
										TriggerServerEvent('esx_applerobbery:rob', k)
										PlaySoundFromCoord(soundid, "VEHICLES_HORNS_AMBULANCE_WARNING", pos2.x, pos2.y, pos2.z)
									else
										TriggerEvent('esx:showNotification', _U('min_two_police') .. Config.RequiredCopsRob .. _U('min_two_police2'))
									end
								end)	
							end	
                        end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end		
				end
			end
		end

		if holdingup then
			s = 0
			drawTxt(0.3, 1.4, 0.45, _U('smash_case') .. ' :~r~ ' .. vetrineRotte .. '/' .. Config.MaxWindows, 185, 185, 185, 255)

			for i,v in pairs(vetrine) do 
				if(GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 10.0) and not v.isOpen and Config.EnableMarker then 
					DrawMarker(20, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.6, 0, 255, 0, 200, 1, 1, 0, 0)
				end
				if(GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 0.75) and not v.isOpen then 
					DrawText3D(v.x, v.y, v.z, '~w~[~g~E~w~] ' .. _U('press_to_collect'), 0.6)
					if IsControlJustPressed(0, 38) then
						animazione = true
					    SetEntityCoords(GetPlayerPed(-1), v.x, v.y, v.z-0.95)
					    SetEntityHeading(GetPlayerPed(-1), v.heading)
						v.isOpen = true 
						PlaySoundFromCoord(-1, "Glass_Smash", v.x, v.y, v.z, "", 0, 0, 0)
					    if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
					    RequestNamedPtfxAsset("scr_jewelheist")
					    end
					    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
					    Citizen.Wait(0)
					    end
					    SetPtfxAssetNextCall("scr_jewelheist")
					    StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", v.x, v.y, v.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
					    loadAnimDict( "missheist_jewel" ) 
						TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
						TriggerEvent("mt:missiontext", _U('collectinprogress'), 3000)
					    --DisplayHelpText(_U('collectinprogress'))
					    DrawSubtitleTimed(5000, 1)
					    Citizen.Wait(5000)
					    ClearPedTasksImmediately(GetPlayerPed(-1))
					    TriggerServerEvent('esx_applerobbery:gioielli')
					    PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					    vetrineRotte = vetrineRotte+1
					    animazione = false

						if vetrineRotte == Config.MaxWindows then 
						    for i,v in pairs(vetrine) do 
								v.isOpen = false
								vetrineRotte = 0
							end
							TriggerServerEvent('esx_applerobbery:endrob', store)
						    ESX.ShowNotification(_U('lester'))
						    holdingup = false
						    StopSound(soundid)
						end
					end
				end	
			end

			local pos2 = Stores[store].position

			if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 152.1029, -225.893, 54.424, true) > 14.5 ) then
				s = 0
				TriggerServerEvent('esx_applerobbery:toofar', store)
				holdingup = false
				for i,v in pairs(vetrine) do 
					v.isOpen = false
					vetrineRotte = 0
				end
				StopSound(soundid)
			end

		end

		Citizen.Wait(s)
	end
end)

Citizen.CreateThread(function()
	while true do
		s = 1000
		if animazione == true then
			if not IsEntityPlayingAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 3) then
				s = 0
				TaskPlayAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 8.0, 8.0, -1, 17, 1, false, false, false)
			end
		end
		Wait(s)
	end
end)

RegisterNetEvent("lester:createBlip")
AddEventHandler("lester:createBlip", function(type, x, y, z)
	-- local blip = AddBlipForCoord(x, y, z)
	-- SetBlipSprite(blip, type)
	-- SetBlipColour(blip, 1)
	-- SetBlipScale(blip, 0.8)
	-- SetBlipAsShortRange(blip, true)
	-- if(type == 77)then
	-- 	BeginTextCommandSetBlipName("STRING")
	-- 	AddTextComponentString("Lester")
	-- 	EndTextCommandSetBlipName(blip)
	-- end
end)

blip = false

Citizen.CreateThread(function()
	TriggerEvent('lester:createBlip', 77, 706.669, -966.898, 30.413)
	while true do
	
		s = 1000
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 152.3919, -225.792, 54.424, true) <= 10 and not blip then
			s = 0
			--r = 252, g = 15, b = 192
			DrawMarker(1, 706.669, -966.898, 29.50, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.1, 252, 15, 192, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, 152.3919, -225.792, 54.424, true) < 1.0 then
				-- DisplayHelpText(_U('press_to_sell'))
				ESX.ShowFloatingHelpNotification("Presiona ~y~E~s~ para vender los ~p~iPhones",vector3(-1054.60, -232.360, 44.021+1))
				if IsControlJustReleased(1, 51) then
					blip = true
					ESX.TriggerServerCallback('esx_jonisrobbery:getItemAmmount', function(quantity)
						if quantity >= Config.MaxPhoneSell then
							ESX.TriggerServerCallback('esx_applerobbery:poldispjonis', function(CopsConnected)
								if CopsConnected >= Config.RequiredCopsSell then
									FreezeEntityPosition(playerPed, true)
									TriggerEvent('mt:missiontext', _U('goldsell'), 10000)
									Wait(10000)
									FreezeEntityPosition(playerPed, false)
									TriggerServerEvent('lester:vendita')
									blip = false
								else
									blip = false
									TriggerEvent('esx:showNotification', _U('copsforsell') .. Config.RequiredCopsSell .. _U('copsforsell2'))
								end
							end)
						else
							blip = false
							TriggerEvent('esx:showNotification', _U('notenoughgold'))
						end
					end, 'iphone')
				end
			end
		end
		Citizen.Wait(s)
	end
end)

