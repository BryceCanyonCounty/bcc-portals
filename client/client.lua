local VORPcore = {}
local VORPMenu = {}
local Portal
local PromptGroup = GetRandomIntInRange(0, 0xffffff)
local InMenu = false

TriggerEvent('getCore', function(core)
    VORPcore = core
end)
TriggerEvent('vorp_menu:getData', function(cb)
    VORPMenu = cb
end)

-- Start Portals
CreateThread(function()
    PortPrompt()
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
                        local sDist = #(pCoords - shopCfg.npcPos)
                        if sDist <= shopCfg.sDistance then
                            sleep = false
                            local shopClosed = CreateVarString(10, 'LITERAL_STRING', shopCfg.shopName .. _U('hours') .. shopCfg.shopOpen .. _U('to') .. shopCfg.shopClose .. _U('hundred'))
                            PromptSetActiveGroupThisFrame(PromptGroup, shopClosed)
                            PromptSetEnabled(Portal, 0)
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
                            local sDist = #(pCoords - shopCfg.npcPos)
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
                                PromptSetActiveGroupThisFrame(PromptGroup, shopOpen)
                                PromptSetEnabled(Portal, 1)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, Portal) then -- UiPromptHasStandardModeCompleted
                                    OpenMenu(pCoords, shop)
                                end
                            end
                        else
                            -- Using Shop Hours - Shop Open - Job Locked
                            if Config.shops[shop].Blip then
                                Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[shopCfg.blipJob])) -- BlipAddModifier
                            end
                            local sDist = #(pCoords - shopCfg.npcPos)
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
                                PromptSetActiveGroupThisFrame(PromptGroup, shopOpen)
                                PromptSetEnabled(Portal, 1)

                                if Citizen.InvokeNative(0xC92AC953F0A982AE, Portal) then -- UiPromptHasStandardModeCompleted
                                    VORPcore.RpcCall('CheckPlayerJob', function(hasJob)
                                    if hasJob then
                                        OpenMenu(pCoords, shop)
                                    else
                                        return
                                    end
                                end, shop)
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
                        local sDist = #(pCoords - shopCfg.npcPos)
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
                            PromptSetActiveGroupThisFrame(PromptGroup, shopOpen)
                            PromptSetEnabled(Portal, 1)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, Portal) then -- UiPromptHasStandardModeCompleted
                                OpenMenu(pCoords, shop)
                            end
                        end
                    else
                        -- Not Using Shop Hours - Shop Always Open - Job Locked
                        if Config.shops[shop].Blip then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[shopCfg.blipJob])) -- BlipAddModifier
                        end
                        local sDist = #(pCoords - shopCfg.npcPos)
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
                            PromptSetActiveGroupThisFrame(PromptGroup, shopOpen)
                            PromptSetEnabled(Portal, 1)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, Portal) then -- UiPromptHasStandardModeCompleted
                                VORPcore.RpcCall('CheckPlayerJob', function(hasJob)
                                    if hasJob then
                                        OpenMenu(pCoords,shop)
                                    else
                                        return
                                    end
                                end, shop)
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
function OpenMenu(pCoords, shop)
    VORPMenu.CloseAll()
    local player = PlayerPedId()
    local shopCfg = Config.shops[shop]
    TaskStandStill(player, -1)
    DisplayRadar(false)
    InMenu = true
    local MenuElements = {}

    for outlet, outletCfg in pairs(shopCfg.outlets) do
        MenuElements[#MenuElements + 1] = {
            label = outletCfg.label,
            value = outlet,
            desc = '<span style=color:#C0C0C0;>' .. _U('choose') .. '</span>',
        }
    end
    VORPMenu.Open('default', GetCurrentResourceName(), 'vorp_menu',
    {
        title = '<span style=color:#999;>' .. shopCfg.shopName .. '</span>',
        subtext = '<span style=color:#C0C0C0;>' .. _U('subMenu') .. '</span>',
        align = 'top-left',
        elements = MenuElements,
        lastmenu = '',
        itemHeight = '3vh',
    },
    function(data, menu)
        if data.current == 'backup' then
            return _G[data.trigger]()
        end
        if data.current.value then
            local travelInfo = {location = data.current.value, coords = pCoords}
            VORPcore.RpcCall("GetTravelData", function(travelData)
                if travelData then
                    DestinationMenu(travelData, shop, pCoords)
                end
            end, travelInfo)
        end
    end,
    function(data, menu)
        menu.close()
        InMenu = false
        ClearPedTasks(player)
        DisplayRadar(true)
    end)
end

function DestinationMenu(travelData, shop, pCoords)
    VORPMenu.CloseAll()
    InMenu = true
    local player = PlayerPedId()
    local MenuElements = {}
    local travelLoc = travelData.location
    local cashPrice = travelData.cash
    local goldPrice = travelData.gold
    local displayTime = travelData.dispTime
    local currencyType = Config.shops[shop].currency
    local currency = {
        [1] = function()
            MenuElements = {
                {
                    label = _U('cash'),
                    value = 'cash',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' ..  '<span style=color:#278664;>' .. ' $' .. cashPrice .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>',
                    info = cashPrice
                }
            }
        end,
        [2] = function()
            MenuElements = {
                {
                    label = _U('gold'),
                    value = 'gold',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' .. '<span style=color:#CC9900;>' .. goldPrice .. ' ' .. 'gold' .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>',
                    info = goldPrice
                }
            }
        end,
        [3] = function()
            MenuElements = {
                {
                    label = _U('cash'),
                    value = 'cash',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' ..  '<span style=color:#278664;>' .. ' $' .. cashPrice .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>',
                    info = cashPrice
                },
                {
                    label = _U('gold'),
                    value = 'gold',
                    desc = '<span style=color:#C0C0C0;>' .. 'Price: ' .. '</span>' .. '<span style=color:#CC9900;>' .. goldPrice .. ' ' .. 'gold' .. '</span>' .. '<br>' ..
                    '<span style=color:#C0C0C0;>' .. 'Travel Time: ' .. '</span>' .. '<span style=color:#888;>' .. ' ' .. displayTime .. ' seconds' .. '</span>',
                    info = goldPrice
                }
            }
        end,
        [4] = function()
            MenuElements = {
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
    VORPMenu.Open('default', GetCurrentResourceName(), 'vorp_menu',
    {
        title = '<span style=color:#999;>' .. Config.shops[shop].shopName .. '</span>',
        subtext = '<span style=color:#C0C0C0;>' .. _U('destination') .. '</span>' .. '<span style=color:#CC9900;>' .. Config.shops[travelLoc].shopName .. '</span>',
        align = 'top-left',
        elements = MenuElements,
        lastmenu = 'OpenMenu',
        itemHeight = '3vh',
    },
    function(data, menu)
        if data.current == 'backup' then
            return _G[data.trigger](pCoords, shop)
        end

        local canTravelInfo = {currency = data.current.value, price = data.current.info}
        VORPcore.RpcCall("GetPlayerCanTravel", function(canTravel)
            if canTravel then
                SendPlayer(travelLoc, travelData.travelTime)
            end
        end, canTravelInfo)

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
end

-- Send Player to Destination
function SendPlayer(location, time)
    local shopCfg = Config.shops[location]
    DoScreenFadeOut(1000)
    Wait(1000)
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, _U('traveling') .. shopCfg.shopName, '', '') -- DisplayLoadingScreens
    Wait(time)
    Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), shopCfg.playerPos.x, shopCfg.playerPos.y, shopCfg.playerPos.z, shopCfg.playerHeading, false, false, false) -- SetEntityCoordsAndHeading
    ShutdownLoadingScreen()
    DoScreenFadeIn(1000)
    Wait(1000)
    SetCinematicModeActive(false)
end

-- Menu Prompts
function PortPrompt()
    local str = CreateVarString(10, 'LITERAL_STRING', _U('portPrompt'))
    Portal = PromptRegisterBegin()
    PromptSetControlAction(Portal, Config.key)
    PromptSetText(Portal, str)
    PromptSetVisible(Portal, 1)
    PromptSetStandardMode(Portal, 1)
    PromptSetGroup(Portal, PromptGroup)
    PromptRegisterEnd(Portal)
end

-- Blips
function AddBlip(shop)
    local shopCfg = Config.shops[shop]
    shopCfg.Blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, shopCfg.npcPos) -- BlipAddForCoords
    SetBlipSprite(shopCfg.Blip, shopCfg.blipSprite, true)
    SetBlipScale(shopCfg.Blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, shopCfg.Blip, shopCfg.blipName) -- SetBlipNameFromPlayerString
end

-- NPCs
function AddNPC(shop)
    local shopCfg = Config.shops[shop]
    LoadModel(shopCfg.npcModel)
    shopCfg.NPC = CreatePed(shopCfg.npcModel, shopCfg.npcPos.x, shopCfg.npcPos.y, shopCfg.npcPos.z, shopCfg.npcHeading, false, false, false, false)
    Citizen.InvokeNative(0x283978A15512B2FE, shopCfg.NPC, true) -- SetRandomOutfitVariation
    SetEntityCanBeDamaged(shopCfg.NPC, false)
    SetEntityInvincible(shopCfg.NPC, true)
    Wait(500)
    FreezeEntityPosition(shopCfg.NPC, true)
    SetBlockingOfNonTemporaryEvents(shopCfg.NPC, true)
end

function LoadModel(npcModel)
    local model = joaat(npcModel)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if InMenu then
        ClearPedTasksImmediately(PlayerPedId())
        VORPMenu.CloseAll()
        DisplayRadar(true)
    end

    for _, shopCfg in pairs(Config.shops) do
        if shopCfg.Blip then
            RemoveBlip(shopCfg.Blip)
            shopCfg.Blip = nil
        end
        if shopCfg.NPC then
            DeleteEntity(shopCfg.NPC)
            shopCfg.NPC = nil
        end
    end
end)

