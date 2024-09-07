local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp","lib/Tunnel")
local vRP = Proxy.getInterface("vRP")
local xSound = exports.xsound

mapreedev = {}
Tunnel.bindInterface(GetCurrentResourceName(), mapreedev)


RegisterCommand("som", function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if Config.PrecisaDePermissao then
			if vRP.hasPermission(user_id, Config.Permissao) then
				TriggerClientEvent("MaraMusic:ShowNui",source)
			else
				TriggerClientEvent("Notify",source,"negado","Você nâo tem permissao para utilizar esse comando", 5000)
			end
		else
			TriggerClientEvent("MaraMusic:ShowNui",source)
		end
	end
end)

function mapreedev.ChecPermissao(v)
	soruce = source
	user_id = vRP.getUserId(source)
	if Config.PrecisaDePermissao then
		if vRP.hasPermission(user_id, v.PermissaoFac) then
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Você nâo tem permissao para utilizar o som", 5000)
			return false
		end
	else
		return true
	end
end

function mapreedev.GetMusic()
	return Config.Zones
end

-- ESX.RegisterServerCallback('MaraMusic:GetMusic', function(source,cb)
--     cb(Config.Zones)
-- end)

-- if Config.ItemInVehicle then
-- 	ESX.RegisterUsableItem(Config.ItemInVehicle, function(playerId)
-- 		TriggerClientEvent("MaraMusic:ShowNui",playerId)
-- 	end)
-- end

RegisterNetEvent("MaraMusic:ChangeVolume")
AddEventHandler("MaraMusic:ChangeVolume", function(vol, nome)
    local somafter = false
    local rangeafter = false
    for i = 1, #Config.Zones do
        local v = Config.Zones[i]
        if nome == v.name then
            local vadi = v.volume + vol
            if vadi <= 1.01 and vadi >= -0.001 then
				if vadi < 0.005 then
					vadi = 0.0
				end
                if v.popo then
                    v.range = (v.volume*Config.DistanceToVolume)
                else
					if vadi >= 0.05 then
						v.range = (vadi*v.range)/v.volume
					end
                end
                v.volume = vadi
                somafter = v.volume
                rangeafter = v.range
            end
        end
    end
    if somafter and rangeafter then
        TriggerClientEvent("MaraMusic:ChangeVolume",-1,somafter,rangeafter, nome)
    end
end)

RegisterNetEvent("MaraMusic:ChangeLoop")
AddEventHandler("MaraMusic:ChangeLoop", function(nome,tip)
	local loopstate
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if nome == v.name then
			v.loop = tip
			loopstate = v.loop
		end
	end
	if loopstate ~= nil then
		TriggerClientEvent("MaraMusic:ChangeLoop",-1,loopstate, nome)
	end
end)

RegisterNetEvent("MaraMusic:ChangeState")
AddEventHandler("MaraMusic:ChangeState", function(type, nome)
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if nome == v.name then
			v.isplaying = type
		end
	end
	TriggerClientEvent("MaraMusic:ChangeState",-1,type, nome)
end)

RegisterNetEvent("MaraMusic:ChangePosition")
AddEventHandler("MaraMusic:ChangePosition", function(quanti, nome)
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if nome == v.name then
			v.deftime = v.deftime+quanti
			if v.deftime < 0 then
				v.deftime = 0
			end
		end
	end
	TriggerClientEvent("MaraMusic:ChangePosition",-1,quanti, nome)
end)

RegisterNetEvent("MaraMusic:ModifyURL")
AddEventHandler("MaraMusic:ModifyURL", function(data)
	local _data = data
	local zena = false
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if _data.name == v.name then
			v.deflink = _data.link
			if _data.popo then
				v.popo = _data.popo
			end
			v.deftime = 0
			v.isplaying = true
			v.loop = _data.loop
			zena = v
		end
	end
	if zena then
		TriggerClientEvent("MaraMusic:ModifyURL",-1,zena)
	end
end)

function countTime()
    SetTimeout(1000, countTime)
    for i = 1, #Config.Zones do
		local v = Config.Zones[i]
        if v.isplaying then
            v.deftime = v.deftime + 1
        end
    end
end

SetTimeout(1000, countTime)

RegisterNetEvent('MaraMusic:AddVehicle')
AddEventHandler("MaraMusic:AddVehicle", function(vehdata)
    local Data = {}
    Data.name = vehdata.plate
    Data.coords = vehdata.coords
    Data.range = vehdata.volume * Config.DistanceToVolume
    Data.volume = vehdata.volume
    Data.deflink = vehdata.link
    Data.isplaying = true
    Data.loop = vehdata.loop
    Data.deftime = 0
    Data.popo = vehdata.popo
    table.insert(Config.Zones, Data)
    TriggerClientEvent('MaraMusic:AddVehicle', math.floor(-1), Config.Zones[#Config.Zones])
end)

RegisterNetEvent('MaraMusic:GetDate')
AddEventHandler('MaraMusic:GetDate', function()
    TriggerClientEvent('MaraMusic:SendData', math.floor(-1), Config.Zones)
end)

