local VORPcore = {}
-- Prompts
local OpenPorts
local ClosePorts
local PortPrompt1 = GetRandomIntInRange(0, 0xffffff)
local PortPrompt2 = GetRandomIntInRange(0, 0xffffff)
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
        local pCoords = GetEntityCoords(player)
        local sleep = true
        local hour = GetClockHours()

        if not InMenu and not IsEntityDead(player) then
            for shop, shopCfg in pairs(Config.shops) do
                if shopCfg.shopHours then
                    -- Using Shop Hours - Shop Closed
                    if hour >= shopCfg.shopClose or hour < shopCfg.shopOpen then
                        if shopCfg.blipOn and Config.blipOnClosed then
                            if not Config.shops[shop].Blip then
                                AddBlip(shop)
                            end
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[shopCfg.blipClosed])) -- BlipAddModifier
                        else
                            if Config.shops[shop].Blip then
                                RemoveBlip(Config.shops[shop].Blip)
                                Config.shops[shop].Blip = nil
                            end
                        end
                        if shopCfg.NPC then
                            DeleteEntity(shopCfg.NPC)
                            shopCfg.NPC = nil
                        end
                        local sDist = #(pCoords - shopCfg.npc)
                        if sDist <= shopCfg.sDistance then
                            sleep = false
                            local shopClosed = CreateVarString(10, 'LITERAL_STRING', shopCfg.shopName .. _U('closed'))
                            PromptSetActiveGroupThisFrame(PortPrompt2, shopClosed)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, ClosePorts) then -- UiPromptHasStandardModeCompleted
                                VORPcore.NotifyRightTip(shopCfg.shopName .. _U('hours') .. shopCfg.shopOpen .. _U('to') .. shopCfg.shopClose .. _U('hundred'), 4000)
                            end
                        end
                    elseif hour >= shopCfg.shopOpen then
                        -- Using Shop Hours - Shop Open
                        if shopCfg.blipOn then
                            if not Config.shops[shop].Blip then
                                AddBlip(shop)
                            end
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[shopCfg.blipOpen])) -- BlipAddModifier
                        end
                        if not next(shopCfg.allowedJobs) then
                            local sDist = #(pCoords - shopCfg.npc)
                            if shopCfg.npcOn then
                                if sDist <= shopCfg.nDistance then
                                    if not shopCfg.NPC then
                                        AddNPC(shop)
                                    end
                                else
                                    if shopCfg.NPC then
                                        DeleteEntity(shopCfg.NPC)
                                        shopCfg.NPC = nil
                                    end
                                end
                            end
                            if sDist <= shopCfg.sDistance then
                                sleep = false
                                local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopCfg.promptName)
                                PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                    MainMenu(pCoords, shop)
                                end
                            end
                        else
                            -- Using Shop Hours - Shop Open - Job Locked
                            if Config.shops[shop].Blip then
                                Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[shopCfg.blipJob])) -- BlipAddModifier
                            end
                            local sDist = #(pCoords - shopCfg.npc)
                            if shopCfg.npcOn then
                                if sDist <= shopCfg.nDistance then
                                    if not shopCfg.NPC then
                                        AddNPC(shop)
                                    end
                                else
                                    if shopCfg.NPC then
                                        DeleteEntity(shopCfg.NPC)
                                        shopCfg.NPC = nil
                                    end
                                end
                            end
                            if sDist <= shopCfg.sDistance then
                                sleep = false
                                local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopCfg.promptName)
                                PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                    CheckPlayerJob(pCoords, shop)
                                end
                            end
                        end
                    end
                else
                    -- Not Using Shop Hours - Shop Always Open
                    if shopCfg.blipOn then
                        if not Config.shops[shop].Blip then
                            AddBlip(shop)
                        end
                        Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[shopCfg.blipOpen])) -- BlipAddModifier
                    end
                    if not next(shopCfg.allowedJobs) then
                        local sDist = #(pCoords - shopCfg.npc)
                        if shopCfg.npcOn then
                            if sDist <= shopCfg.nDistance then
                                if not shopCfg.NPC then
                                    AddNPC(shop)
                                end
                            else
                                if shopCfg.NPC then
                                    DeleteEntity(shopCfg.NPC)
                                    shopCfg.NPC = nil
                                end
                            end
                        end
                        if sDist <= shopCfg.sDistance then
                            sleep = false
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopCfg.promptName)
                            PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                MainMenu(pCoords, shop)
                            end
                        end
                    else
                        -- Not Using Shop Hours - Shop Always Open - Job Locked
                        if Config.shops[shop].Blip then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[shopCfg.blipJob])) -- BlipAddModifier
                        end
                        local sDist = #(pCoords - shopCfg.npc)
                        if shopCfg.npcOn then
                            if sDist <= shopCfg.nDistance then
                                if not shopCfg.NPC then
                                    AddNPC(shop)
                                end
                            else
                                if shopCfg.NPC then
                                    DeleteEntity(shopCfg.NPC)
                                    shopCfg.NPC = nil
                                end
                            end
                        end
                        if sDist <= shopCfg.sDistance then
                            sleep = false
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', shopCfg.promptName)
                            PromptSetActiveGroupThisFrame(PortPrompt1, shopOpen)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPorts) then -- UiPromptHasStandardModeCompleted
                                CheckPlayerJob(pCoords, shop)
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
function MainMenu(pCoords, shop)
    MenuData.CloseAll()
    local player = PlayerPedId()
    local shopCfg = Config.shops[shop]
    DisplayRadar(false)
    TaskStandStill(player, -1)
    InMenu = true
    local elements = {}

    for _, outletCfg in pairs(shopCfg.outlets) do
        elements[#elements + 1] = {
            label = outletCfg.label,
            value = _,
            desc = '<span style=color:#C0C0C0;>' .. _U('choose') .. '</span>',
            location = outletCfg.location,
        }
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
    {
        title = '<span style=color:#999;>' .. shopCfg.shopName .. '</span>',
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
            TriggerServerEvent('bcc-portals:GetData', data.current.location, pCoords, shop)
        end
    end,
    function(data, menu)
        menu.close()
        InMenu = false
        ClearPedTasks(player)
        DisplayRadar(true)
    end)
end

RegisterNetEvent('bcc-portals:DestinationMenu', function(location, cashPrice, goldPrice, time, displayTime, shop)
    MenuData.CloseAll()
    InMenu = true
    local player = PlayerPedId()
    local elements = {}
    local currencyType = Config.shops[shop].currency
    local currency = {
        [1] = function()
            elements = {
                {
                    label = _U('cash'),
                    value = 'cash',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' ..  '<span style=color:#278664;>' .. ' $' .. cashPrice .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>'
                }
            }
        end,
        [2] = function()
            elements = {
                {
                    label = _U('gold'),
                    value = 'gold',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' .. '<span style=color:#CC9900;>' .. goldPrice .. ' ' .. 'gold' .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>'
                }
            }
        end,
        [3] = function()
            elements = {
                {
                    label = _U('cash'),
                    value = 'cash',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' ..  '<span style=color:#278664;>' .. ' $' .. cashPrice .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>'
                },
                {
                    label = _U('gold'),
                    value = 'gold',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' .. '<span style=color:#CC9900;>' .. goldPrice .. ' ' .. 'gold' .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>'
                }
            }
        end,
        [4] = function()
            elements = {
                {
                    label = _U('go'),
                    value = 'free',
                    desc =  '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>'
                }
            }
        end
    }
    if currency[currencyType] then
        currency[currencyType]()
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
    {
        title = '<span style=color:#999;>' .. Config.shops[shop].shopName .. '</span>',
        subtext = '<span style=color:#C0C0C0;>' .. _U('destination') .. '</span>' .. '<span style=color:#CC9900;>' .. Config.shops[location].shopName .. '</span>',
        align = 'top-left',
        elements = elements,
        lastmenu = '',
    },
    function(data, menu)
        if data.current == 'backup' then
            _G[data.trigger](shop)
        end
        local payment = nil
        if data.current.value == 'cash' then
            payment = 'cash'
            TriggerServerEvent('bcc-portals:BuyPassage', location, cashPrice, time, payment)

        elseif data.current.value == 'gold' then
            payment = 'gold'
            TriggerServerEvent('bcc-portals:BuyPassage', location, goldPrice, time, payment)

        elseif data.current.value == 'free' then
            payment = 'free'
            TriggerServerEvent('bcc-portals:BuyPassage', location, goldPrice, time, payment)
        end

        menu.close()
        InMenu = false
        ClearPedTasks(player)
        DisplayRadar(true)
    end,
    function(data, menu)
        menu.close()
        InMenu = false
        ClearPedTasks(player)
        DisplayRadar(true)
    end)
end)

-- Send Player to Destination
RegisterNetEvent('bcc-portals:SendPlayer', function(location, time)
    local shopCfg = Config.shops[location]
    DoScreenFadeOut(1000)
    Wait(1000)
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, _U('traveling') .. shopCfg.shopName, '', '') -- DisplayLoadingScreens
    Wait(time)
    Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), shopCfg.player) -- SetEntityCoordsAndHeading
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
function AddBlip(shop)
    local shopCfg = Config.shops[shop]
    shopCfg.Blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, shopCfg.npc) -- BlipAddForCoords
    SetBlipSprite(shopCfg.Blip, shopCfg.blipSprite, 1)
    SetBlipScale(shopCfg.Blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, shopCfg.Blip, shopCfg.blipName) -- SetBlipNameFromPlayerString
end

-- NPCs
function AddNPC(shop)
    local shopCfg = Config.shops[shop]
    LoadModel(shopCfg.npcModel)
    local npc = CreatePed(shopCfg.npcModel, shopCfg.npc, shopCfg.npcHeading, false, true, true, true)
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
    SetEntityCanBeDamaged(npc, false)
    SetEntityInvincible(npc, true)
    Wait(500)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    Config.shops[shop].NPC = npc
end

function LoadModel(npcModel)
    local model = joaat(npcModel)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
end

-- Check if Player has Required Job
function CheckPlayerJob(pCoords, shop)
    local playerJob, jobGrade = nil, nil
    local jobData = false
    VORPcore.RpcCall('GetJobData', function(result)
        playerJob = result[1]
        jobGrade = result[2]
        jobData = true
    end)
    while not jobData do
        Wait(5)
    end
    if playerJob then
        local shopCfg = Config.shops[shop]
        for _, job in pairs(shopCfg.allowedJobs) do
            if playerJob == job then
                if tonumber(jobGrade) >= tonumber(shopCfg.jobGrade) then
                    MainMenu(pCoords, shop)
                    DisplayRadar(false)
                    TaskStandStill(PlayerPedId(), -1)
                    break
                else
                    VORPcore.NotifyRightTip(_U('needJobGrade'), 4000)
                    break
                end
            else
                VORPcore.NotifyRightTip(_U('needJob'), 4000)
                break
            end
        end
    else
        VORPcore.NotifyRightTip(_U('needJob'), 4000)
    end
end

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

    for _, shopCfg in pairs(Config.shops) do
        if shopCfg.Blip then
            RemoveBlip(shopCfg.Blip)
        end
        if shopCfg.NPC then
            DeleteEntity(shopCfg.NPC)
            shopCfg.NPC = nil
        end
    end
end)

