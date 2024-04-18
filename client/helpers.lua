function SendPlayer(location, time)
    local shopCfg = Config.shops[location]
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

function CheckPlayerJob(shop)
    HasJob = false
    local result = ClientRPC.Callback.TriggerAwait('bcc-portals:CheckJob', shop)
    if result then
        HasJob = true
    end
end

function StartPrompt()
    MenuPrompt = PromptRegisterBegin()
    PromptSetControlAction(MenuPrompt, Config.key)
    PromptSetText(MenuPrompt, CreateVarString(10, 'LITERAL_STRING', _U('portPrompt')))
    PromptSetVisible(MenuPrompt, true)
    PromptSetStandardMode(MenuPrompt, true)
    PromptSetGroup(MenuPrompt, PromptGroup)
    PromptRegisterEnd(MenuPrompt)
end

function ManageBlip(shop, closed)
    local shopCfg = Config.shops[shop]

    if closed and not shopCfg.blip.showClosed then
        if Config.shops[shop].Blip then
            RemoveBlip(Config.shops[shop].Blip)
            Config.shops[shop].Blip = nil
        end
        return
    end

    if not Config.shops[shop].Blip then
        shopCfg.Blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, shopCfg.npc.coords) -- BlipAddForCoords
        SetBlipSprite(shopCfg.Blip, shopCfg.blip.sprite, true)
        Citizen.InvokeNative(0x9CB1A1623062F402, shopCfg.Blip, shopCfg.blip.name) -- SetBlipNameFromPlayerString
    end

    local color = shopCfg.blip.color.open
    if shopCfg.shop.jobsEnabled then color = shopCfg.blip.color.job end
    if closed then color = shopCfg.blip.color.closed end
    Citizen.InvokeNative(0x662D364ABF16DE2F, Config.shops[shop].Blip, joaat(Config.BlipColors[color])) -- BlipAddModifier
end

function AddNPC(shop)
    local shopCfg = Config.shops[shop]
    if not shopCfg.NPC then
        local modelName = shopCfg.npc.model
        local model = joaat(modelName)
        LoadModel(model, modelName)
        shopCfg.NPC = CreatePed(model, shopCfg.npc.coords, shopCfg.npc.heading, false, false, false, false)
        Citizen.InvokeNative(0x283978A15512B2FE, shopCfg.NPC, true) -- SetRandomOutfitVariation
        SetEntityCanBeDamaged(shopCfg.NPC, false)
        SetEntityInvincible(shopCfg.NPC, true)
        Wait(500)
        FreezeEntityPosition(shopCfg.NPC, true)
        SetBlockingOfNonTemporaryEvents(shopCfg.NPC, true)
    end
end

function RemoveNPC(shop)
    local shopCfg = Config.shops[shop]
    if shopCfg.NPC then
        DeleteEntity(shopCfg.NPC)
        shopCfg.NPC = nil
    end
end

function LoadModel(model, modelName)
    if not IsModelValid(model) then
        return print('Invalid model:', modelName)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
end