local FeatherMenu =  exports['feather-menu'].initiate()

local PortalMenu = FeatherMenu:RegisterMenu('bcc:portals:menu', {
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
}, {
    opened = function()
        DisplayRadar(false)
    end,
    closed = function()
        DisplayRadar(true)
    end
})

-----------------------------------------------------
-- Main Page
-----------------------------------------------------
function OpenMainMenu(pCoords, shop)
    local MainPage = PortalMenu:RegisterPage('main:page')
    local shopCfg = Locations[shop]

    MainPage:RegisterElement('header', {
        value = shopCfg.shop.name,
        slot = 'header',
        style = {
            ['color'] = '#999'
        }
    })

    MainPage:RegisterElement('subheader', {
        value = _U('destinations'),
        slot = 'header',
        style = {
            ['color'] = '#CC9900',
            ['font-size'] = '0.94vw'
        }
    })

    MainPage:RegisterElement('line', {
        slot = 'header',
        style = {}
    })

    for outlet, outletCfg in pairs(shopCfg.outlets) do
        MainPage:RegisterElement('button', {
            label = outletCfg.label,
            style = {
                ['color'] = '#E0E0E0'
            },
            id = outlet
        }, function(data)
            local travelData = VORPcore.Callback.TriggerAwait('bcc-portals:GetTravelData', data.id, pCoords)
            if travelData then
                OpenTravelMenu(travelData, pCoords, shop)
            end
        end)
    end

    MainPage:RegisterElement('bottomline', {
        slot = 'footer',
    })

    TextDisplay = MainPage:RegisterElement('textdisplay', {
        value = _U('choose'),
        slot = 'footer',
        style = {
            ['color'] = '#C0C0C0'
        }
    })

    PortalMenu:Open({
        startupPage = MainPage
    })
end

-----------------------------------------------------
-- Travel Page
-----------------------------------------------------
function OpenTravelMenu(travelData, pCoords, shop)
    local TravelPage = PortalMenu:RegisterPage('travel:page')
    local travelLoc = travelData.location
    local cashPrice = travelData.cash
    local goldPrice = travelData.gold
    local currencyData = 'cash'
    local travelPrice = cashPrice

    TravelPage:RegisterElement('header', {
        value = Locations[shop].shop.name,
        slot = 'header',
        style = {
            ['color'] = '#999'
        }
    })

    TravelPage:RegisterElement('subheader', {
        value = _U('travelInfo'),
        slot = 'header',
        style = {
            ['color'] = '#CC9900',
            ['font-size'] = '0.94vw'
        }
    })

    TravelPage:RegisterElement('line', {
        slot = 'header'
    })

    LocDisplay = TravelPage:RegisterElement('textdisplay', {
        value = Locations[travelLoc].shop.name,
        style = {
            ['color'] = '#C0C0C0',
            ['font-size'] = '1.0vw',
            ['font-variant'] = 'small-caps',
            ['font-weight'] = '500',
            ['letter-spacing'] = '2px'
        },
        id = 'location'
    })

    PriceDisplay = TravelPage:RegisterElement('textdisplay', {
        value = _U('price') .. ' $' .. cashPrice,
        style = {
            ['color'] = '#C0C0C0',
            ['font-variant'] = 'small-caps',
            ['font-size'] = '0.83vw'
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

    TimeDisplay = TravelPage:RegisterElement('textdisplay', {
        value = _U('time') .. travelTime,
        style = {
            ['color'] = '#C0C0C0',
            ['font-variant'] = 'small-caps',
            ['font-size'] = '0.83vw'
        },
        id = 'time'
    })

    local currencyType = Locations[shop].shop.currency
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
            TravelPage:RegisterElement('arrows', {
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

    TravelPage:RegisterElement('button', {
        label = _U('go'),
        style = {
            ['color'] = '#E0E0E0'
        },
        id = 'go'
    }, function(data)
        local canTravelInfo = { currency = currencyData, price = travelPrice }
        local canTravel = VORPcore.Callback.TriggerAwait('bcc-portals:GetPlayerCanTravel', canTravelInfo)
        if canTravel then
            PortalMenu.Close()
            SendPlayer(travelLoc, travelData.timeMs)
        end
    end)

    TravelPage:RegisterElement('button', {
        label = _U('back'),
        style = {
            ['color'] = '#E0E0E0'
        },
        id = 'back'
    }, function(data)
        OpenMainMenu(pCoords, shop)
    end)

    TravelPage:RegisterElement('bottomline', {
        slot = 'footer',
    })

    PortalMenu:Open({
        startupPage = TravelPage
    })
end