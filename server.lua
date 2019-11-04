ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_steamid:id', function(source, steam)
    steam(GetPlayerIdentifiers(source)[1])
end)
