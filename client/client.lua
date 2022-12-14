local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

local OpenShops
local CloseShops
local ShopPrompt1 = GetRandomIntInRange(0, 0xffffff)
local ShopPrompt2 = GetRandomIntInRange(0, 0xffffff)
local PlayerJob
local JobName
local JobGrade
local InMenu = false
MenuData = {}

TriggerEvent("menuapi:getData", function(call)
    MenuData = call
end)

-- Start Boats
Citizen.CreateThread(function()
    ShopOpen()
    ShopClosed()

    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true
        local dead = IsEntityDead(player)
        local hour = GetClockHours()

        if InMenu == false and not dead then
            for shopId, shopConfig in pairs(Config.travelShops) do
                if shopConfig.shopHours then
                    if hour >= shopConfig.shopClose or hour < shopConfig.shopOpen then
                        if not Config.travelShops[shopId].BlipHandle and shopConfig.blipAllowed then
                            AddBlip(shopId)
                        end
                        if Config.travelShops[shopId].BlipHandle then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.travelShops[shopId].BlipHandle, GetHashKey(shopConfig.blipColorClosed))
                        end
                        if shopConfig.NPC then
                            DeleteEntity(shopConfig.NPC)
                            DeletePed(shopConfig.NPC)
                            SetEntityAsNoLongerNeeded(shopConfig.NPC)
                            shopConfig.NPC = nil
                        end
                        local coordsDist = vector3(coords.x, coords.y, coords.z)
                        local coordsShop = vector3(shopConfig.npcx, shopConfig.npcy, shopConfig.npcz)
                        local distanceShop = #(coordsDist - coordsShop)

                        if (distanceShop <= shopConfig.distanceShop) then
                            sleep = false
                            local shopClosed = CreateVarString(10, 'LITERAL_STRING', _U("closed") .. shopConfig.shopOpen .. _U("am") .. shopConfig.shopClose .. _U("pm"))
                            PromptSetActiveGroupThisFrame(ShopPrompt2, shopClosed)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, CloseShops) then
                                Wait(100)
                                VORPcore.NotifyRightTip(_U("closed") .. shopConfig.shopOpen .. _U("am") .. shopConfig.shopClose .. _U("pm"), 3000)
                            end
                        end
                    elseif hour >= shopConfig.shopOpen then
                        if not Config.travelShops[shopId].BlipHandle and shopConfig.blipAllowed then
                            AddBlip(shopId)
                        end
                        if Config.travelShops[shopId].BlipHandle then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.travelShops[shopId].BlipHandle, GetHashKey(shopConfig.blipColorOpen))
                        end
                        if not shopConfig.NPC and shopConfig.npcAllowed then
                            SpawnNPC(shopId)
                        end
                        if not next(shopConfig.allowedJobs) then
                            local coordsDist = vector3(coords.x, coords.y, coords.z)
                            local coordsShop = vector3(shopConfig.npcx, shopConfig.npcy, shopConfig.npcz)
                            local distanceShop = #(coordsDist - coordsShop)

                            if (distanceShop <= shopConfig.distanceShop) then
                                sleep = false
                                local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                                PromptSetActiveGroupThisFrame(ShopPrompt1, shopOpen)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenShops) then
                                    MainMenu(shopId)
                                    DisplayRadar(false)
                                    TaskStandStill(player, -1)
                                end
                            end
                        else
                            local coordsDist = vector3(coords.x, coords.y, coords.z)
                            local coordsShop = vector3(shopConfig.npcx, shopConfig.npcy, shopConfig.npcz)
                            local distanceShop = #(coordsDist - coordsShop)

                            if (distanceShop <= shopConfig.distanceShop) then
                                sleep = false
                                local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                                PromptSetActiveGroupThisFrame(ShopPrompt1, shopOpen)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenShops) then
                                    TriggerServerEvent("oss_fasttravel:getPlayerJob")
                                    Wait(200)
                                    if PlayerJob then
                                        if CheckJob(shopConfig.allowedJobs, PlayerJob) then
                                            if tonumber(shopConfig.jobGrade) <= tonumber(JobGrade) then
                                                MainMenu(shopId)
                                                DisplayRadar(false)
                                                TaskStandStill(player, -1)
                                            else
                                                VORPcore.NotifyRightTip(_U("needJob") .. JobName .. " " .. shopConfig.jobGrade,5000)
                                            end
                                        else
                                            VORPcore.NotifyRightTip(_U("needJob") .. JobName .. " " .. shopConfig.jobGrade,5000)
                                        end
                                    else
                                        VORPcore.NotifyRightTip(_U("needJob") .. JobName .. " " .. shopConfig.jobGrade,5000)
                                    end
                                end
                            end
                        end
                    end
                else
                    if not Config.travelShops[shopId].BlipHandle and shopConfig.blipAllowed then
                        AddBlip(shopId)
                    end
                    if Config.travelShops[shopId].BlipHandle then
                        Citizen.InvokeNative(0x662D364ABF16DE2F, Config.travelShops[shopId].BlipHandle, GetHashKey(shopConfig.blipColorOpen))
                    end
                    if not shopConfig.NPC and shopConfig.npcAllowed then
                        SpawnNPC(shopId)
                    end
                    if not next(shopConfig.allowedJobs) then
                        local coordsDist = vector3(coords.x, coords.y, coords.z)
                        local coordsShop = vector3(shopConfig.npcx, shopConfig.npcy, shopConfig.npcz)
                        local distanceShop = #(coordsDist - coordsShop)

                        if (distanceShop <= shopConfig.distanceShop) then
                            sleep = false
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                            PromptSetActiveGroupThisFrame(ShopPrompt1, shopOpen)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenShops) then
                                MainMenu(shopId)
                                DisplayRadar(false)
                                TaskStandStill(player, -1)
                            end
                        end
                    else
                        local coordsDist = vector3(coords.x, coords.y, coords.z)
                        local coordsShop = vector3(shopConfig.npcx, shopConfig.npcy, shopConfig.npcz)
                        local distanceShop = #(coordsDist - coordsShop)

                        if (distanceShop <= shopConfig.distanceShop) then
                            sleep = false
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                            PromptSetActiveGroupThisFrame(ShopPrompt1, shopOpen)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenShops) then
                                TriggerServerEvent("oss_boats:getPlayerJob")
                                Wait(200)
                                if PlayerJob then
                                    if CheckJob(shopConfig.allowedJobs, PlayerJob) then
                                        if tonumber(shopConfig.jobGrade) <= tonumber(JobGrade) then
                                            MainMenu(shopId)
                                            DisplayRadar(false)
                                            TaskStandStill(player, -1)
                                        else
                                            VORPcore.NotifyRightTip(_U("needJob") .. JobName .. " " .. shopConfig.jobGrade,5000)
                                        end
                                    else
                                        VORPcore.NotifyRightTip(_U("needJob") .. JobName .. " " .. shopConfig.jobGrade,5000)
                                    end
                                else
                                    VORPcore.NotifyRightTip(_U("needJob") .. JobName .. " " .. shopConfig.jobGrade,5000)
                                end
                            end
                        end
                    end
                end
            end
        end
        if sleep then
            Citizen.Wait(1000)
        end
    end
end)

-- Main Boats Menu
function MainMenu(shopId)
    MenuData.CloseAll()
    InMenu = true
    local elements = {}

    for _, shopConfig in pairs(Config.travelShops) do
        elements[#elements + 1] = {
            label = shopConfig.menuName,
            value = shopConfig.location,
            desc = _U("price") .. shopConfig.buyPrice .. " " .. shopConfig.currencyType,
            info = shopConfig,
        }
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
    {
        title = Config.travelShops[shopId].shopName,
        subtext = _U("subMenu"),
        align = "top-left",
        elements = elements,
        lastmenu = '',
    },
    function(data, menu)
        if data.current == "backup" then
            _G[data.trigger](shopId)
        end
        if data.current.value then
            local shopData = data.current.info
            TriggerServerEvent('oss_fasttravel:BuyTicket', shopData, shopId)

            menu.close()
            InMenu = false
            ClearPedTasksImmediately(PlayerPedId())
            DisplayRadar(true)
        end
    end,
    function(data, menu)
        menu.close()
        InMenu = false
        ClearPedTasksImmediately(PlayerPedId())
        DisplayRadar(true)
    end)
end

-- Return Boat Using Prompt at Shop Location
RegisterNetEvent("oss_fasttravel:TeleportPlayer")
AddEventHandler("oss_fasttravel:TeleportPlayer", function(location, shopId)
    local player = PlayerPedId()
    local destination = location
    local coords = vector3(Config.travelShops[destination].playerx, Config.travelShops[destination].playery, Config.travelShops[destination].playerz)
    DoScreenFadeOut(500)
    Wait(Config.travelTime)
    SetEntityCoords(player, coords.x, coords.y, coords.z)
    --Citizen.InvokeNative(0x203BEFFDBE12E96A, player, coords.x, coords.y, coords.z, coords.h) -- _SET_ENTITY_COORDS_AND_HEADING
    Wait(500)
    DoScreenFadeIn(500)
end)

-- Menu Prompts
function ShopOpen()
    local str = _U("shopPrompt")
    OpenShops = PromptRegisterBegin()
    PromptSetControlAction(OpenShops, Config.shopKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(OpenShops, str)
    PromptSetEnabled(OpenShops, 1)
    PromptSetVisible(OpenShops, 1)
    PromptSetStandardMode(OpenShops, 1)
    PromptSetGroup(OpenShops, ShopPrompt1)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, OpenShops, true)
    PromptRegisterEnd(OpenShops)
end

function ShopClosed()
    local str = _U("shopPrompt")
    CloseShops = PromptRegisterBegin()
    PromptSetControlAction(CloseShops, Config.shopKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(CloseShops, str)
    PromptSetEnabled(CloseShops, 1)
    PromptSetVisible(CloseShops, 1)
    PromptSetStandardMode(CloseShops, 1)
    PromptSetGroup(CloseShops, ShopPrompt2)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, CloseShops, true)
    PromptRegisterEnd(CloseShops)
end

-- Blips
function AddBlip(shopId)
    local shopConfig = Config.travelShops[shopId]
    if shopConfig.blipAllowed then
        shopConfig.BlipHandle = N_0x554d9d53f696d002(1664425300, shopConfig.npcx, shopConfig.npcy, shopConfig.npcz) -- BlipAddForCoords
        SetBlipSprite(shopConfig.BlipHandle, shopConfig.blipSprite, 1)
        SetBlipScale(shopConfig.BlipHandle, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, shopConfig.BlipHandle, shopConfig.blipName) -- SetBlipNameFromPlayerString
    end
end

-- NPCs
function LoadModel(npcModel)
    local model = GetHashKey(npcModel)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(100)
    end
end

function SpawnNPC(shopId)
    local shopConfig = Config.travelShops[shopId]
    LoadModel(shopConfig.npcModel)
    if shopConfig.npcAllowed then
        local npc = CreatePed(shopConfig.npcModel, shopConfig.npcx, shopConfig.npcy, shopConfig.npcz, shopConfig.npch, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        Wait(500)
        FreezeEntityPosition(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        Config.travelShops[shopId].NPC = npc
    end
end

-- Check if Player has Job
function CheckJob(allowedJob, playerJob)
    for _, jobAllowed in pairs(allowedJob) do
        JobName = jobAllowed
        if JobName == playerJob then
            return true
        end
    end
    return false
end

RegisterNetEvent("oss_fasttravel:sendPlayerJob")
AddEventHandler("oss_fasttravel:sendPlayerJob", function(Job, grade)
    PlayerJob = Job
    JobGrade = grade
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if InMenu == true then
        ClearPedTasksImmediately(PlayerPedId())
        PromptDelete(OpenShops)
        PromptDelete(CloseShops)
        MenuData.CloseAll()
    end

    for _, shopConfig in pairs(Config.travelShops) do
        if shopConfig.BlipHandle then
            RemoveBlip(shopConfig.BlipHandle)
        end
        if shopConfig.NPC then
            DeleteEntity(shopConfig.NPC)
            DeletePed(shopConfig.NPC)
            SetEntityAsNoLongerNeeded(shopConfig.NPC)
        end
    end
end)

