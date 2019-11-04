ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
		}
	else
		return nil
	end
end

ESX.RegisterServerCallback('esx_steamid:id', function(source, steam)
    local id = getIdentity(source)
    steam(id.identifier)
end)
