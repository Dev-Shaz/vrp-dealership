pvRPserver = Tunnel.getInterface("vRP", "vrp_dealership")
vRP = Proxy.getInterface("vRP")


RMenu.Add('dealership', 'main', RageUI.CreateMenu("~b~Dealership", " ",1250,100))
RMenu.Add('dealership', 'submenu', RageUI.CreateMenu("~b~Dealership", " ",1250,100))

local categoryselected

RageUI.CreateWhile(1.0, true, function()
    if RageUI.Visible(RMenu:Get('dealership', 'main')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            for k,v in pairs(cfg.category) do 
                RageUI.Button(v.title, " ", {}, true, function(Hovered, Active, Selected)
                    if Selected then
                        categoryselected = v.name 
                    end
                end, RMenu:Get("dealership", "submenu"))
            end
        end)
    end
    if RageUI.Visible(RMenu:Get('dealership', 'submenu')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            for k,v in pairs(cfg.cars) do 
                if categoryselected == v.category then 
                    RageUI.Button(v.vehname, v.description, {RightLabel =  cfg.currency .. tostring(v.price) }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent('vRP:dealership', v.spawncode)
                        end
                    end)
                end
            end
        end)
    end
end, 1)


local inmenu = false
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1000)
    NearHome = false
        for name, v in pairs(cfg.Locations) do
            local Coords = GetEntityCoords(PlayerPedId())
            local distance = #(Coords - v[1])
            if distance < 3.0 then
                NearHome = true
                RageUI.Visible(RMenu:Get("dealership", "main"), true)
            end
        end
        if not NearHome then
            RageUI.Visible(RMenu:Get('dealership', 'main'), false)
            RageUI.Visible(RMenu:Get('dealership', 'submenu'), false)
        end
    end
end)