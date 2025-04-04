RegisterNetEvent('advanced_notify:show')
AddEventHandler('advanced_notify:show', function(data)
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = 'show',
        type = data.type or "info",
        title = data.title or "Notification",
        message = data.message or "This is a message",
        duration = data.duration or 5000,
        icon = data.icon,
        color = data.color
    })
end)

-- Exportovaná funkcia pre jednoduché volanie
function ShowAdvancedNotify(data)
    TriggerEvent('advanced_notify:show', data)
end




----- # FOR CUSTOM TYPE OF ANIMATIONS
-----    TriggerEvent('advanced_notify:show', {
----- type = "custom",
----- title = "VIP Info",
----- message = "Vitaj späť, legendárny hráč!",
----- duration = 6000,
----- icon = "fa-crown",
----- color = "#e67e22"
---})
---end, false)


RegisterCommand("tryall", function()
    TriggerEvent('advanced_notify:show', {
        type = "info",
        title = "Info",
        message = "Toto je informačná notifikácia.",
        duration = 4000
    })

    Wait(1000)

    TriggerEvent('advanced_notify:show', {
        type = "success",
        title = "Úspech",
        message = "Operácia prebehla úspešne.",
        duration = 4000
    })

    Wait(1000)

    TriggerEvent('advanced_notify:show', {
        type = "error",
        title = "Chyba",
        message = "Nastala chyba pri vykonávaní.",
        duration = 4000
    })

    Wait(1000)

    TriggerEvent('advanced_notify:show', {
        type = "warning",
        title = "Upozornenie",
        message = "Daj si pozor na túto akciu.",
        duration = 4000
    })
end, false)
