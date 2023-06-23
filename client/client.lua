local VORPcore = {}
-- Prompts
local OpenPorts
local ClosePorts
local PortPrompt1 = GetRandomIntInRange(0, 0xffffff)
local PortPrompt2 = GetRandomIntInRange(0, 0xffffff)
-- Jobs
local PlayerJob
local JobGrade
-- Menu
local InMenu = false
MenuData = {}

TriggerEvent('getCore', function(core)
    VORPcore = core
end)

TriggerEvent('menuapi:getData', function(call)
    MenuData = call
end)

-- Start Portals
CreateThread(function()
    PortOpen()
    PortClosed()

    while true do
        Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true
        local hour = GetClockHours()

        if not InMenu and not IsEntityDead(player) then
            for shopId, shopConfig in pairs(Config.shops) do
                if shopConfig.shopHours then
                    -- Using Shop Hours - Shop Closed
                    if hour >= shopConfig.shopClose or hour < shopConfig.shopOpen then
                        if Config.blipOnClosed then
                            if not Config.shops[shopId].Blip and shopConfig.blipOn then
                                AddBlip(shopId)
                            end
                        else
                            if Config.shops[shopId].Blip then
                                RemoveBlip(Config.shops[shopId].Blip)
                                Config.shops[shopId].Blip = nil
                            end
                        end
                        if Config.shops[shopId].Blip then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shopId].Blip, joaat(Config.BlipColors[shopConfig.blipColorClosed])) -- BlipAddModifier
                        end
                        if shopConfig.NPC then
                            DeleteEntity(shopConfig.NPC)
                            shopConfig.NPC = nil
                        end
                        local pcoords = vector3(coords.x, coords.y, coords.z)
                        local scoords = vector3(shopConfig.npc.x, shopConfig.npc.y, shopConfig.npc.z)
                        local sDistance = #(pcoords - scoords)

                        if sDistance <= shopConfig.sDistance then
                            sleep = false
                            local shopClosed = CreateVarString(10, 'LITERAL_STRING', shopConfig.shopName .. _U('closed'))
                            PromptSetActiveGroupThisFrame(PortPrompt2, shopClosed)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, ClosePorts) then -- UiPromptHasStandardModeCompleted
                                Wait(100)
                                VORPcore.NotifyRightTip(shopConfig.shopName .. _U('hours') .. shopConfig.shopOpen .. _U('to') .. shopConfig.shopClose .. _U('hundred'), 4000)
                            end
                        end
                    elseif hour >= shopConfig.shopOpen then
                        -- Using Shop Hours - Shop Open
                        if not Config.shops[shopId].Blip and shopConfig.blipOn then
                            AddBlip(shopId)
                        end
                        if not next(shopConfig.allowedJobs) then
                            if Config.shops[shopId].Blip then
                                Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shopId].Blip, joaat(Config.BlipColors[shopConfig.blipColorOpen])) -- BlipAddModifier
                            end
                            local pcoords = vector3(coords.x, coords.y, coords.z)
                            local scoords = vector3(shopConfig.npc.x, shopConfig.npc.y, shopConfig.npc.z)
                            local sDistance = #(pcoords - scoords)

                            if sDistance <= shopConfig.nDistance then
                                if not shopConfig.NPC and shopConfig.npcOn then
                                    AddNPC(shopId)
                                end
                            else
                                if shopConfig.NPC then
                                    DeleteEntity(shopConfig.NPC)
                                    shopConfig.NPC = nil
                                end
                            end
                            if sDistance <= shopConfig.sDistance then
                                sleep = false
                                local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                                PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                    MainMenu(pcoords, shopId)
                                    DisplayRadar(false)
                                    TaskStandStill(player, -1)
                                end
                            end
                        else
                            -- Using Shop Hours - Shop Open - Job Locked
                            if Config.shops[shopId].Blip then
                                Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shopId].Blip, joaat(Config.BlipColors[shopConfig.blipColorJob])) -- BlipAddModifier
                            end
                            local pcoords = vector3(coords.x, coords.y, coords.z)
                            local scoords = vector3(shopConfig.npc.x, shopConfig.npc.y, shopConfig.npc.z)
                            local sDistance = #(pcoords - scoords)

                            if sDistance <= shopConfig.nDistance then
                                if not shopConfig.NPC and shopConfig.npcOn then
                                    AddNPC(shopId)
                                end
                            else
                                if shopConfig.NPC then
                                    DeleteEntity(shopConfig.NPC)
                                    shopConfig.NPC = nil
                                end
                            end
                            if sDistance <= shopConfig.sDistance then
                                sleep = false
                                local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                                PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                    TriggerServerEvent('bcc-portals:getPlayerJob')
                                    Wait(500)
                                    if PlayerJob then
                                        if CheckJob(shopConfig.allowedJobs, PlayerJob) then
                                            if tonumber(shopConfig.jobGrade) <= tonumber(JobGrade) then
                                                MainMenu(pcoords, shopId)
                                                DisplayRadar(false)
                                                TaskStandStill(player, -1)
                                            else
                                                VORPcore.NotifyRightTip(_U('needJob'), 5000)
                                            end
                                        else
                                            VORPcore.NotifyRightTip(_U('needJob'), 5000)
                                        end
                                    else
                                        VORPcore.NotifyRightTip(_U('needJob'), 5000)
                                    end
                                end
                            end
                        end
                    end
                else
                    -- Not Using Shop Hours - Shop Always Open
                    if not Config.shops[shopId].Blip and shopConfig.blipOn then
                        AddBlip(shopId)
                    end
                    if not next(shopConfig.allowedJobs) then
                        if Config.shops[shopId].Blip then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shopId].Blip, joaat(Config.BlipColors[shopConfig.blipColorOpen])) -- BlipAddModifier
                        end
                        local pcoords = vector3(coords.x, coords.y, coords.z)
                        local scoords = vector3(shopConfig.npc.x, shopConfig.npc.y, shopConfig.npc.z)
                        local sDistance = #(pcoords - scoords)

                        if sDistance <= shopConfig.nDistance then
                            if not shopConfig.NPC and shopConfig.npcOn then
                                AddNPC(shopId)
                            end
                        else
                            if shopConfig.NPC then
                                DeleteEntity(shopConfig.NPC)
                                shopConfig.NPC = nil
                            end
                        end
                        if sDistance <= shopConfig.sDistance then
                            sleep = false
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                            PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                MainMenu(pcoords, shopId)
                                DisplayRadar(false)
                                TaskStandStill(player, -1)
                            end
                        end
                    else
                        -- Not Using Shop Hours - Shop Always Open - Job Locked
                        if Config.shops[shopId].Blip then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shopId].Blip, joaat(Config.BlipColors[shopConfig.blipColorJob])) -- BlipAddModifier
                        end
                        local pcoords = vector3(coords.x, coords.y, coords.z)
                        local scoords = vector3(shopConfig.npc.x, shopConfig.npc.y, shopConfig.npc.z)
                        local sDistance = #(pcoords - scoords)

                        if sDistance <= shopConfig.nDistance then
                            if not shopConfig.NPC and shopConfig.npcOn then
                                AddNPC(shopId)
                            end
                        else
                            if shopConfig.NPC then
                                DeleteEntity(shopConfig.NPC)
                                shopConfig.NPC = nil
                            end
                        end
                        if sDistance <= shopConfig.sDistance then
                            sleep = false
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopConfig.promptName)
                            PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                TriggerServerEvent('bcc-portals:getPlayerJob')
                                Wait(500)
                                if PlayerJob then
                                    if CheckJob(shopConfig.allowedJobs, PlayerJob) then
                                        if tonumber(shopConfig.jobGrade) <= tonumber(JobGrade) then
                                            MainMenu(pcoords, shopId)
                                            DisplayRadar(false)
                                            TaskStandStill(player, -1)
                                        else
                                            VORPcore.NotifyRightTip(_U('needJob'), 5000)
                                        end
                                    else
                                        VORPcore.NotifyRightTip(_U('needJob'), 5000)
                                    end
                                else
                                    VORPcore.NotifyRightTip(_U('needJob'), 5000)
                                end
                            end
                        end
                    end
                end
            end
        end
        if sleep then
            Wait(1000)
        end
    end
end)

-- Portal Menu to Choose Destination
function MainMenu(pcoords, shopId)
    MenuData.CloseAll()
    InMenu = true
    local elements = {}

    for k, v in pairs(Config.shops[shopId].outlets) do
        elements[#elements + 1] = {
            label = v.label,
            value = k,
            desc = '<span style=color:#C0C0C0;>' .. _U('choose') .. '</span>',
            location = v.location,
        }
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
    {
        title = '<span style=color:#999;>' .. Config.shops[shopId].shopName .. '</span>',
        subtext = '<span style=color:#C0C0C0;>' .. _U('subMenu') .. '</span>',
        align = 'top-left',
        elements = elements,
        lastmenu = '',
    },
    function(data, menu)
        if data.current == 'backup' then
            _G[data.trigger]()
        end
        if data.current.value then
            TriggerServerEvent('bcc-portals:GetData', data.current.location, pcoords, shopId)
        end
    end,
    function(data, menu)
        menu.close()
        InMenu = false
        ClearPedTasksImmediately(PlayerPedId())
        DisplayRadar(true)
    end)
end

RegisterNetEvent('bcc-portals:DestinationMenu', function(location, cashPrice, goldPrice, time, displayTime, shopId)
    MenuData.CloseAll()
    InMenu = true
    local player = PlayerPedId()
    local elements = {
        {
            label = 'Cash',
            value = 'cash',
            desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' ..  '<span style=color:#278664;>' .. ' $' .. cashPrice .. '</span>' .. '<br>' ..
            '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>'
        },
        {
            label = 'Gold',
            value = 'gold',
            desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' .. '<span style=color:#CC9900;>' .. goldPrice .. ' ' .. 'gold' .. '</span>' .. '<br>' ..
            '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>'
        }
    }
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
    {
        title = '<span style=color:#999;>' .. Config.shops[shopId].shopName .. '</span>',
        subtext = '<span style=color:#C0C0C0;>' .. _U('destination') .. '</span>' .. '<span style=color:#CC9900;>' .. Config.shops[location].shopName .. '</span>',
        align = 'top-left',
        elements = elements,
        lastmenu = '',
    },
    function(data, menu)
        if data.current == 'backup' then
            _G[data.trigger](shopId)
        end
        if data.current.value == 'cash' then
            TriggerServerEvent('bcc-portals:BuyPassage', location, cashPrice, time, true)
        else
            TriggerServerEvent('bcc-portals:BuyPassage', location, goldPrice, time, false)
        end

        menu.close()
        InMenu = false
        ClearPedTasksImmediately(player)
        DisplayRadar(true)
    end,
    function(data, menu)
        menu.close()
        InMenu = false
        ClearPedTasksImmediately(player)
        DisplayRadar(true)
    end)
end)

-- Send Player to Destination
RegisterNetEvent('bcc-portals:SendPlayer', function(location, time)
    local shopConfig = Config.shops[location]
    DoScreenFadeOut(1000)
    Wait(1000)
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, _U('traveling') .. shopConfig.shopName, '', '') -- DisplayLoadingScreens
    Wait(time)
    Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), shopConfig.player.x, shopConfig.player.y, shopConfig.player.z, shopConfig.player.h) -- SetEntityCoordsAndHeading
    ShutdownLoadingScreen()
    DoScreenFadeIn(1000)
    Wait(1000)
    SetCinematicModeActive(false)
end)

-- Menu Prompts
function PortOpen()
    local str = _U('portPrompt')
    OpenPorts = PromptRegisterBegin()
    PromptSetControlAction(OpenPorts, Config.key)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(OpenPorts, str)
    PromptSetEnabled(OpenPorts, 1)
    PromptSetVisible(OpenPorts, 1)
    PromptSetStandardMode(OpenPorts, 1)
    PromptSetGroup(OpenPorts, PortPrompt1)
    PromptRegisterEnd(OpenPorts)
end

function PortClosed()
    local str = _U('portPrompt')
    ClosePorts = PromptRegisterBegin()
    PromptSetControlAction(ClosePorts, Config.key)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(ClosePorts, str)
    PromptSetEnabled(ClosePorts, 1)
    PromptSetVisible(ClosePorts, 1)
    PromptSetStandardMode(ClosePorts, 1)
    PromptSetGroup(ClosePorts, PortPrompt2)
    PromptRegisterEnd(ClosePorts)
end

-- Blips
function AddBlip(shopId)
    local shopConfig = Config.shops[shopId]
    shopConfig.Blip = N_0x554d9d53f696d002(1664425300, shopConfig.npc.x, shopConfig.npc.y, shopConfig.npc.z) -- BlipAddForCoords
    SetBlipSprite(shopConfig.Blip, shopConfig.blipSprite, 1)
    SetBlipScale(shopConfig.Blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, shopConfig.Blip, shopConfig.blipName) -- SetBlipNameFromPlayerString
end

-- NPCs
function AddNPC(shopId)
    local shopConfig = Config.shops[shopId]
    LoadModel(shopConfig.npcModel)
    local npc = CreatePed(shopConfig.npcModel, shopConfig.npc.x, shopConfig.npc.y, shopConfig.npc.z, shopConfig.npc.h, false, true, true, true)
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
    SetEntityCanBeDamaged(npc, false)
    SetEntityInvincible(npc, true)
    Wait(500)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    Config.shops[shopId].NPC = npc
end

function LoadModel(npcModel)
    local model = joaat(npcModel)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
end

-- Check if Player has Job
function CheckJob(allowedJobs, playerJob)
    for _, jobs in pairs(allowedJobs) do
        if jobs == playerJob then
            return true
        end
    end
    return false
end

RegisterNetEvent('bcc-portals:sendPlayerJob', function(Job, grade)
    PlayerJob = Job
    JobGrade = grade
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if InMenu then
        ClearPedTasksImmediately(PlayerPedId())
        PromptDelete(OpenPorts)
        PromptDelete(ClosePorts)
        MenuData.CloseAll()
    end

    for _, shopConfig in pairs(Config.shops) do
        if shopConfig.Blip then
            RemoveBlip(shopConfig.Blip)
        end
        if shopConfig.NPC then
            DeleteEntity(shopConfig.NPC)
            shopConfig.NPC = nil
        end
    end
end)

