local isInDuty = false
local isGodModeEnabled = false
local previousClothes = {}

local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(Config.Command, function()
    local playerPed = PlayerPedId()
    if isInDuty then
        TriggerServerEvent('aduty:leaveDuty')
    else
        TriggerServerEvent('aduty:checkPermission')
    end
end)

RegisterNetEvent('aduty:updateDutyStatus')
AddEventHandler('aduty:updateDutyStatus', function(status)
    isInDuty = status
    if isInDuty then
        Notify(Config.Notify.onduty, 'success') -- Text in Grün anzeigen
        SavePreviousClothes()
        SetUniform()
        EnableGodMode()
    else
        Notify(Config.Notify.offduty, 'error') -- Text in Rot anzeigen
        DisableGodMode()
        RestorePreviousClothes()
    end
end)

RegisterNetEvent('aduty:permissionResult')
AddEventHandler('aduty:permissionResult', function(hasPermission)
    if hasPermission then
        TriggerServerEvent('aduty:joinDuty')
    else
        Notify(Config.Notify.nopermission, 'error')
    end
end)

function SetUniform()
    local ped = PlayerPedId()
    SetPedComponentVariation(ped, 1, 135, 1, 0) -- Maske
    SetPedComponentVariation(ped, 11, 287, 1, 0) --Oberteil
    SetPedComponentVariation(ped, 4, 114, 1, 0) --Hose
    SetPedComponentVariation(ped, 6, 78, 1, 0) --Schuhe
    SetPedComponentVariation(ped, 3, 187, 1, 0) --arms
    -- Füge weitere SetPedComponentVariation-Aufrufe hinzu, um die gewünschte Kleidung festzulegen
end

function EnableGodMode()
    isGodModeEnabled = true
    SetEntityInvincible(PlayerPedId(), true)
end

function DisableGodMode()
    isGodModeEnabled = false
    SetEntityInvincible(PlayerPedId(), false)
end

function SavePreviousClothes()
    local ped = PlayerPedId()
    previousClothes = {
        mask = GetPedDrawableVariation(ped, 1),
        torso = GetPedDrawableVariation(ped, 11),
        legs = GetPedDrawableVariation(ped, 4),
        shoes = GetPedDrawableVariation(ped, 6),
        arms = GetPedDrawableVariation(ped, 3)
        -- Füge weitere Komponenten hinzu, die du speichern möchtest
    }
end

function RestorePreviousClothes()
    local ped = PlayerPedId()
    SetPedComponentVariation(ped, 1, previousClothes.mask, 0, 0) -- maske
    SetPedComponentVariation(ped, 11, previousClothes.torso, 0, 0) -- Oberteil
    SetPedComponentVariation(ped, 4, previousClothes.legs, 0, 0) -- Hose
    SetPedComponentVariation(ped, 6, previousClothes.shoes, 0, 0) -- Schuhe
    SetPedComponentVariation(ped, 3, previousClothes.arms, 0, 0) -- arms
    -- Füge weitere SetPedComponentVariation-Aufrufe hinzu, um die vorherige Kleidung wiederherzustellen
end

function Notify(text, type)
    -- Hier kannst du den gewünschten Benachrichtigungsstil anpassen
    TriggerEvent('QBCore:Notify', text, type)
end
