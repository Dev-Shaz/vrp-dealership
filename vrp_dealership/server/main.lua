Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_dealership")
MySQL = module("vrp", "MySQL")

MySQL.createCommand("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate) VALUES(@user_id,@vehicle,@registration)")
MySQL.createCommand("vRP/get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")


RegisterServerEvent("vRP:dealership")
AddEventHandler("vRP:dealership", function(spawncode)
    local source = source
    local user_id = vRP.getUserId({source})
    local vehicle = spawncode
    for k,v in pairs(cfg.cars) do 
        if spawncode == v.spawncode then 
            MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle)
                if #pvehicle > 0 then
                    vRPclient.notify(source, {"~r~Vehicle already owned."})
                else
                    if vRP.tryFullPayment({user_id, v.price}) then
                       vRP.getUserIdentity(user_id, function(identity)					
                           MySQL.execute("vRP/add_vehicle", {user_id = user_id, vehicle = vehicle, registration = "P "..identity.registration})
                       end)
                        vRPclient.notify(source, {"You paid ~r~" .. cfg.currency .. v.price})
                        vRPclient.notify(source, {"To pickup your vehicle please visit any garage."})
                    else
                        vRPclient.notify(source, {"~r~Not enough money."})
                    end
                end
            end)
        end
    end
end)
