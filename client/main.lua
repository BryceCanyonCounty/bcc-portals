VORPcore = exports.vorp_core:GetCore()

local PromptGroup = GetRandomIntInRange(0, 0xffffff)
local HasJob = false

local function StartPrompt()
    MenuPrompt = PromptRegisterBegin()
    PromptSetControlAction(MenuPrompt, Config.key)
    PromptSetText(MenuPrompt, CreateVarString(10, 'LITERAL_STRING', _U('portPrompt')))
    PromptSetVisible(MenuPrompt, true)
    PromptSetStandardMode(MenuPrompt, true)
    PromptSetGroup(MenuPrompt, PromptGroup)
    PromptRegisterEnd(MenuPrompt)
end

local function ManageBlip(shop, closed)
    local shopCfg = Locations[shop]

    if closed and not shopCfg.blip.showClosed then
        if Locations[shop].Blip then
            RemoveBlip(Locations[shop].Blip)
            Locations[shop].Blip = nil
        end
        return
    end

    if not Locations[shop].Blip then
        shopCfg.Blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, shopCfg.npc.coords) -- BlipAddForCoords
        SetBlipSprite(shopCfg.Blip, shopCfg.blip.sprite, true)
        Citizen.InvokeNative(0x9CB1A1623062F402, shopCfg.Blip, shopCfg.blip.name) -- SetBlipNameFromPlayerString
    end

    local color = shopCfg.blip.color.open
    if shopCfg.shop.jobsEnabled then color = shopCfg.blip.color.job end
    if closed then color = shopCfg.blip.color.closed end
    Citizen.InvokeNative(0x662D364ABF16DE2F, Locations[shop].Blip, joaat(Config.BlipColors[color])) -- BlipAddModifier
end

local function LoadModel(model, modelName)
    if not IsModelValid(model) then
        return print('Invalid model:', modelName)
    end
    RequestModel(model, false)
    while not HasModelLoaded(model) do
        Wait(10)
    end
end

local function AddNPC(shop)
    local shopCfg = Locations[shop]
    if not shopCfg.NPC then
        local modelName = shopCfg.npc.model
        local model = joaat(modelName)
        LoadModel(model, modelName)
        shopCfg.NPC = CreatePed(model, shopCfg.npc.coords, shopCfg.npc.heading, false, false, false, false, false)
        Citizen.InvokeNative(0x283978A15512B2FE, shopCfg.NPC, true) -- SetRandomOutfitVariation
        SetEntityCanBeDamaged(shopCfg.NPC, false)
        SetEntityInvincible(shopCfg.NPC, true)
        Wait(500)
        FreezeEntityPosition(shopCfg.NPC, true)
        SetBlockingOfNonTemporaryEvents(shopCfg.NPC, true)
    end
end

local function RemoveNPC(shop)
    local shopCfg = Locations[shop]
    if shopCfg.NPC then
        DeleteEntity(shopCfg.NPC)
        shopCfg.NPC = nil
    end
end

local function CheckPlayerJob(shop)
    HasJob = false
    local result = VORPcore.Callback.TriggerAwait('bcc-portals:CheckJob', shop)
    if result then
        HasJob = true
    end
end

CreateThread(function()
    StartPrompt()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local sleep = 1000
        local hour = GetClockHours()

        if IsEntityDead(playerPed) then goto END end

        for shop, shopCfg in pairs(Locations) do
            local distance = #(playerCoords - shopCfg.npc.coords)

            -- Shop Closed
            if (shopCfg.shop.hours.active and hour >= shopCfg.shop.hours.close) or (shopCfg.shop.hours.active and hour < shopCfg.shop.hours.open) then
                if shopCfg.blip.show then
                    ManageBlip(shop, true)
                end
                RemoveNPC(shop)
                if distance <= shopCfg.shop.distance then
                    sleep = 0
                    PromptSetActiveGroupThisFrame(PromptGroup, CreateVarString(10, 'LITERAL_STRING', shopCfg.shop.name .. _U('hours') ..
                    shopCfg.shop.hours.open .. _U('to') .. shopCfg.shop.hours.close .. _U('hundred')))
                    PromptSetEnabled(MenuPrompt, false)
                end

            -- Shop Open
            else
                if shopCfg.blip.show then
                    ManageBlip(shop, false)
                end
                if distance <= shopCfg.npc.distance then
                    if shopCfg.npc.active then
                        AddNPC(shop)
                    end
                else
                    RemoveNPC(shop)
                end
                if distance <= shopCfg.shop.distance then
                    sleep = 0
                    PromptSetActiveGroupThisFrame(PromptGroup, CreateVarString(10, 'LITERAL_STRING', shopCfg.shop.prompt))
                    PromptSetEnabled(MenuPrompt, true)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE, MenuPrompt) then -- UiPromptHasStandardModeCompleted
                        if shopCfg.shop.jobsEnabled then
                            CheckPlayerJob(shop)
                            if not HasJob then goto END end
                        end
                        OpenMainMenu(playerCoords, shop)
                    end
                end
            end
        end
        ::END::
        Wait(sleep)
    end
end)

function SendPlayer(location, time)
    local shopCfg = Locations[location]
    DoScreenFadeOut(1000)
    Wait(1000)
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, _U('traveling') .. shopCfg.shop.name, '', '') -- DisplayLoadingScreens
    Wait(time)
    Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), shopCfg.player.coords, shopCfg.player.heading, false, false, false) -- SetEntityCoordsAndHeading
    ShutdownLoadingScreen()
    DoScreenFadeIn(1000)
    Wait(1000)
    SetCinematicModeActive(false)
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    for _, shopCfg in pairs(Locations) do
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

