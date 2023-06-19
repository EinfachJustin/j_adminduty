local dutyPlayers = {}
local authorizedLicenses = {
    "license:c8dde47af6ab7d5204ba96c6bce10b933b445f5b", --change the Permissions here
    "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
}
local QBCore = exports['qb-core']:GetCoreObject()

function QBCore.Functions.GetPlayerByCitizenId(citizenid)
    for key, value in pairs(QBCore.Players) do
        if QBCore.Players[key].PlayerData.citizenid == citizenid then
            return QBCore.Players[key]
        end
    end
    return nil
end

RegisterServerEvent('aduty:joinDuty')
AddEventHandler('aduty:joinDuty', function()
    local src = source
    dutyPlayers[src] = true
    TriggerClientEvent('aduty:updateDutyStatus', src, true)
end)

RegisterServerEvent('aduty:leaveDuty')
AddEventHandler('aduty:leaveDuty', function()
    local src = source
    dutyPlayers[src] = false
    TriggerClientEvent('aduty:updateDutyStatus', src, false)
end)

AddEventHandler('playerDropped', function()
    local src = source
    dutyPlayers[src] = nil
end)

AddEventHandler('qbcore:playerLoaded', function(playerId)
    local src = source
    TriggerClientEvent('aduty:updateDutyStatus', src, dutyPlayers[src] or false)
end)

RegisterServerEvent('aduty:checkPermission')
AddEventHandler('aduty:checkPermission', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local license = player.PlayerData.license

    for _, authLicense in ipairs(authorizedLicenses) do
        if license == authLicense then
            TriggerClientEvent('aduty:permissionResult', src, true)
            return
        end
    end

    TriggerClientEvent('aduty:permissionResult', src, false)
end)
