ESX = exports["es_extended"]:getSharedObject()

local hurt = false
local HurtMessage = Config.GotHurtMessage
local StillHurtMessage = Config.StillHurtMessage

function notifyPlayer(message)
    if Config.NotifyType == 'okok' then
        exports['okokNotify']:Alert("", message, 5000, 'error')
    elseif Config.NotifyType == 'ox_lib' then
        lib.notify({
            title = 'You are hurt!',
            description = message,
            type = 'warning'
        })
    elseif Config.NotifyType == 'esx' then
        if ESX then
            ESX.ShowNotification(message)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(Config.HowOftenRemove * 1000)
        if hurt and GetEntityHealth(GetPlayerPed(-1)) > Config.HPToRemove then
            SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1)) - Config.HPToRemove)
            notifyPlayer(StillHurtMessage)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Config.ScreenShakeStrenght)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local playerHealth = GetEntityHealth(GetPlayerPed(-1))
        if playerHealth <= Config.WhenToStart + 100 and playerHealth > 0 then
            notifyPlayer(HurtMessage)
            StartScreenEffect(Config.ScreenEffect)
            setHurt()
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Config.ScreenShakeStrenght)
            Wait(Config.HowOftenRemove * 1000)
        elseif hurt and playerHealth > Config.WhenToStop then
            setNotHurt()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local playerHealth = GetEntityHealth(GetPlayerPed(-1))
        if playerHealth > Config.WhenToStop then
            Wait(1000)
            if GetEntityHealth(GetPlayerPed(-1)) > Config.WhenToStop then
                StopScreenEffect(Config.ScreenEffect)
            end
        end
    end
end)

AddEventHandler('playerDied', function()
    setNotHurt()
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(GetPlayerPed(-1))
    ResetPedWeaponMovementClipset(GetPlayerPed(-1))
    ResetPedStrafeClipset(GetPlayerPed(-1))
end
