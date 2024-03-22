
local pressed = false
local display = false

RegisterNetEvent('js:showBl')
AddEventHandler('js:showBl', function(source)
    Display(not display)
end)

RegisterNUICallback("main", function(data)
    chat(data.text, {0,255,0})
    Display(false)
    SetNuiFocus(false, false)

end)


RegisterNUICallback("exit", function(data)
    Display(false)
    SetNuiFocus(false, false)

end)

function Display(bool)
    display = bool
    SendNUIMessage({
        type="ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
	while true do
		local waits = 1000
		if not pressed then
			waits = 5
			if IsDisabledControlJustPressed(0, 0) or IsControlJustPressed(0, 32) then
				pressed = true

			end
		end

		Citizen.Wait(waits)

	end
end)



Citizen.CreateThread(function()
	while true do
		local wait = 500
		local displayKille = GetProfileSetting(226)
		if pressed and not IsPauseMenuActive() then
			if not IsPauseMenuActive() then
				if displayKille == 1 then
					Display(true)
				elseif IsPauseMenuActive() then
					Display(false)
				end
			else
				Display(false)

			end
		else
			Display(false)
		end
		Citizen.Wait(wait)

	end
end)
