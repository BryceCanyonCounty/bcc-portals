FeatherMenu =  exports['feather-menu'].initiate()

ClientRPC = exports.vorp_core:ClientRpcCall()

PromptGroup = GetRandomIntInRange(0, 0xffffff)
HasJob = false

CreateThread(function()
    StartPrompt()
    while true do
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        local sleep = 1000
        local hour = GetClockHours()

        if IsEntityDead(playerPed) then goto END end

        for shop, shopCfg in pairs(Config.shops) do
            local distance = #(pCoords - shopCfg.npc.coords)

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
                        MainMenu(pCoords, shop)
                    end
                end
            end
        end
        ::END::
        Wait(sleep)
    end
end)

function MainMenu(pCoords, shop)
    local shopCfg = Config.shops[shop]
    local mainMenu = FeatherMenu:RegisterMenu('bcc-portals:MainMenu', {
        top = '3%',
        left = '3%',
        ['720width'] = '400px',
        ['1080width'] = '500px',
        ['2kwidth'] = '600px',
        ['4kwidth'] = '800px',
        style = {},
        contentslot = {
            style = {
                ['height'] = '325px',
                ['min-height'] = '325px'
            }
        },
        draggable = true,
        canclose = true
    })

    local destinations = mainMenu:RegisterPage('first:page')

    destinations:RegisterElement('header', {
        value = shopCfg.shop.name,
        slot = 'header',
        style = {
            ['color'] = '#999'
        }
    })

    destinations:RegisterElement('subheader', {
        value = _U('destinations'),
        slot = 'header',
        style = {
            ['color'] = '#CC9900',
            ['font-size'] = '18px'
        }
    })

    destinations:RegisterElement('line', {
        slot = 'header'
    })

    for outlet, outletCfg in pairs(shopCfg.outlets) do
        destinations:RegisterElement('button', {
            label = outletCfg.label,
            style = {
                ['color'] = '#E0E0E0'
            },
            id = outlet
        }, function(data)
            local travelInfo = { location = data.id, coords = pCoords }
            local travelData = ClientRPC.Callback.TriggerAwait('bcc-portals:GetTravelData', travelInfo)
            if travelData then
                TravelMenu(travelData, shop, pCoords)
            end
        end)
    end

    destinations:RegisterElement('bottomline', {
        slot = 'footer',
    })

    TextDisplay = destinations:RegisterElement('textdisplay', {
        value = _U('choose'),
        slot = 'footer',
        style = {
            ['color'] = '#C0C0C0'
        }
    })

    mainMenu:Open({
        startupPage = destinations
    })
end

function TravelMenu(travelData, shop, pCoords)
    local travelLoc = travelData.location
    local cashPrice = travelData.cash
    local goldPrice = travelData.gold
    local currencyData = 'cash'
    local travelPrice = cashPrice

    local travelMenu = FeatherMenu:RegisterMenu('bcc-portals:TravelMenu', {
        top = '3%',
        left = '3%',
        ['720width'] = '400px',
        ['1080width'] = '500px',
        ['2kwidth'] = '600px',
        ['4kwidth'] = '800px',
        style = {},
        contentslot = {
            style = {
                ['height'] = '325px',
                ['min-height'] = '325px'
            }
        },
        draggable = true,
        canclose = true
    })

    local travelInfo = travelMenu:RegisterPage('first:page')

    travelInfo:RegisterElement('header', {
        value = Config.shops[shop].shop.name,
        slot = 'header',
        style = {
            ['color'] = '#999'
        }
    })

    travelInfo:RegisterElement('subheader', {
        value = _U('travelInfo'),
        slot = 'header',
        style = {
            ['color'] = '#CC9900',
            ['font-size'] = '18px'
        }
    })

    travelInfo:RegisterElement('line', {
        slot = 'header'
    })

    LocDisplay = travelInfo:RegisterElement('textdisplay', {
        value = Config.shops[travelLoc].shop.name,
        style = {
            ['color'] = '#C0C0C0',
            ['font-size'] = '20px',
            ['font-variant'] = 'small-caps',
            ['font-weight'] = '500',
            ['letter-spacing'] = '2px'
        },
        id = 'location'
    })

    PriceDisplay = travelInfo:RegisterElement('textdisplay', {
        value = _U('price') .. ' $' .. cashPrice,
        style = {
            ['color'] = '#C0C0C0',
            ['font-variant'] = 'small-caps',
            ['font-size'] = '16px'
        },
        id = 'price'
    })

    local minutes = tonumber(travelData.dispTime.minutes)
    local seconds = tonumber(travelData.dispTime.seconds)
    local travelTime = nil
    if minutes >= 1 then
        travelTime = minutes .. _U('minutes') .. ' ' .. seconds .. _U('seconds')
    else
        travelTime = seconds .. _U('seconds')
    end

    TimeDisplay = travelInfo:RegisterElement('textdisplay', {
        value = _U('time') .. travelTime,
        style = {
            ['color'] = '#C0C0C0',
            ['font-variant'] = 'small-caps',
            ['font-size'] = '16px'
        },
        id = 'time'
    })

    local currencyType = Config.shops[shop].shop.currency
    local currency = {
        [1] = function() -- Cash-Only
            currencyData = 'cash'
            travelPrice = cashPrice
        end,
        [2] = function() -- Gold-Only
            PriceDisplay:update({
                value = _U('price') .. goldPrice .. _U('nugget'),
                style = {},
            })
            currencyData = 'gold'
            travelPrice = goldPrice
        end,
        [3] = function() -- Cash and Gold
            travelInfo:RegisterElement('arrows', {
                label = _U('currency'),
                start = 1,
                options = {
                    {
                        display = _U('cash'),
                        extra = 'cash'
                    },
                    {
                        display = _U('gold'),
                        extra = 'gold'
                    }
                },
                style = {
                    ['color'] = '#E0E0E0'
                },
                persist = false,
            }, function(data)
                if data.value.extra == 'cash' then
                    PriceDisplay:update({
                        value = _U('price') .. ' $' .. cashPrice,
                        style = {},
                    })
                    currencyData = 'cash'
                    travelPrice = cashPrice
                elseif data.value.extra == 'gold' then
                    PriceDisplay:update({
                        value = _U('price') .. goldPrice .. _U('nugget'),
                        style = {},
                    })
                    currencyData = 'gold'
                    travelPrice = goldPrice
                end
            end)
        end,
        [4] = function() -- Free
            PriceDisplay:update({
                value = _U('price') .. _U('free'),
                style = {},
            })
            currencyData = 'free'
        end
    }
    if currency[currencyType] then
        currency[currencyType]()
    end

    travelInfo:RegisterElement('button', {
        label = _U('go'),
        style = {
            ['color'] = '#E0E0E0'
        },
        id = 'go'
    }, function(data)
        local canTravelInfo = { currency = currencyData, price = travelPrice }
        local canTravel = ClientRPC.Callback.TriggerAwait('bcc-portals:GetPlayerCanTravel', canTravelInfo)
        if canTravel then
            travelMenu.Close()
            SendPlayer(travelLoc, travelData.timeMs)
        end
    end)

    travelInfo:RegisterElement('button', {
        label = _U('back'),
        style = {
            ['color'] = '#E0E0E0'
        },
        id = 'back'
    }, function(data)
        MainMenu(pCoords, shop)
    end)

    travelInfo:RegisterElement('bottomline', {
        slot = 'footer',
    })

    travelMenu:Open({
        startupPage = travelInfo
    })
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
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

