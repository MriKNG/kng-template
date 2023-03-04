local QBCore = exports['qb-core']:GetCoreObject()

--CREATE A BLIP FUNCTION
CreateThread(function()
    local blip = AddBlipForCoord(vector3(x, y, z))
    SetBlipSprite(blip, 1) --ICON
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8) --SCALE
    SetBlipColour(blip, 1) --COLOR
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Example Name') --BLIP TEXT
    EndTextCommandSetBlipName(blip)
end)

--REGISTER EVENT
RegisterNetEvent('kng-istired:client:gosleep', function()
    TriggerEvent('kng-istired:client:gosleep')
end)

--QB-TARGET THREAD
CreateThread(function()
    exports['qb-target']:AddBoxZone("name", vector3(x, y, z), 2, 2, {
        name = "name" --NAME
        heading = 1, --HEADING
        debugpoly = false, --OR TRUE
     }, {
         options = {
            {
                event = "kng-istired:client:gosleep", --EVENT TRIGGER
                icon = "fas fa-example", --ICON
                label = "Go to Sleep", --TEXT WHEN TARGETING
            },
         },
         distance = 1.5 --DISTANCE 
      })
  end)

--SPAWNING A PED
CreateThread(function()
    RequestModel(`s_f_y_factory_01`) --PED MODEL
    while not HasModelLoaded(`s_f_y_factory_01`) do --PED MODEL
        Wait(1)
    end
    ExamplePed = CreatePed(2, `s_f_y_factory_01`, vector4(x, y, z), false, false) --PED LOCATION
    SetPedFleeAttributes(ExamplePed, 0, 0)
    SetPedDiesWhenInjured(ExamplePed, false)
    TaskStartScenarioInPlace(ExamplePed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true) --PED ANIMATION
    SetPedKeepTask(ExamplePed, true)
    SetBlockingOfNonTemporaryEvents(ExamplePed, true)
    SetEntityInvincible(ExamplePed, true)
    FreezeEntityPosition(ExamplePed, true)
end)
        
