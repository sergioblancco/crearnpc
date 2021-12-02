Citizen.CreateThread(function() --creas  el npc
    SpawnNPC('a_m_y_smartcaspat_01', vector4(-307.8777, -379.5705, 29.08149, 94.3165))-- pagina modelos npc https://docs.fivem.net/docs/game-references/ped-models/ ejemplo a_f_m_beach_01
    while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
        if #(_charPos - vector3(-307.8777, -379.5705, 31.08149)) < 2 then
            _sleep = 0
            Create3D(vector3(-307.8777, -379.5705, 31.08149), 'Hola soy creado por sergioblancco#6487') --texto encima del npc "opcional"
        end
        Citizen.Wait(_sleep)
    end
end)


SpawnNPC = function(modelo, x,y,z,h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    crearNPC = CreatePed(5, hash, x,y,z,h, false, true)
    FreezeEntityPosition(crearNPC, true)
    SetEntityInvincible(crearNPC, true)
    SetBlockingOfNonTemporaryEvents(crearNPC, true)
    TaskStartScenarioInPlace(crearNPC, "WORLD_HUMAN_DRINKING", 0, false)
end


Create3D = function(coords, texto)
    local x, y, z = table.unpack(coords)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(texto)
        DrawText(_x,_y)
    end
end