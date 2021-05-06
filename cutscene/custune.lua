RegisterCommand("start", function(source, args, rawCommand)
    TriggerEvent('axe-cinematic:start')
end, false)

local cutsene = false

RegisterNetEvent('axe-cinematic:start') -- Event The start the Cutscene.
AddEventHandler("axe-cinematic:start", function()
    cutsene = true

    local plyrId = PlayerPedId() 
    local playerClone = ClonePed_2(plyrId, 0.0, false, true, 1) 

    RequestCutscene("MP_INTRO_CONCAT", 8)
    while not HasCutsceneLoaded() do Wait(10) end 

    DoScreenFadeOut(1000)
    Wait(2000)
    DoScreenFadeIn(2000)


    SetCutsceneEntityStreamingFlags('MP_Male_Character', 0, 1) 
    local female = RegisterEntityForCutscene(0,"MP_Female_Character",3,0,64)                                                         
    RegisterEntityForCutscene(PlayerPedId(), 'MP_Male_Character', 0, GetEntityModel(PlayerPedId()), 64)
    GetEntityIndexOfCutsceneEntity('MP_Female_Character', GetHashKey(GetEntityModel('MP_Female_Character')))
    NetworkSetEntityInvisibleToNetwork(female, true)


    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_1", 0, 1)

    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_3", 0, 1)
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_4", 0, 1)
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_5", 0, 1)
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_6", 0, 1)
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_7", 0, 1)
    
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_f_freemode_01'), 0)-
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_2', 3, GetHashKey('mp_f_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_f_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_f_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_f_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_f_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_f_freemode_01'), 0)
    
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_m_freemode_01'), 0)
   
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_m_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_m_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_m_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_m_freemode_01'), 0)
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_m_freemode_01'), 0)
    NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0)

    StartCutscene(4) 

    Citizen.CreateThread(function()

        while cutsene do
            Citizen.Wait(100)
            print(GetCutsceneTime())
            if GetCutsceneTime() >= 37000 then
                DoScreenFadeOut(1000)
                Wait(2000)
                DoScreenFadeIn(2000)


                StopCutsceneImmediately()
                cutsene = false
            end
        end




    end)
end) 
