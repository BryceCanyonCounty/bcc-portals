local VORPcore = {}
TriggerEvent('getCore', function(core)
    VORPcore = core
end)

-- Get Travel Time and Price Data
RegisterNetEvent('bcc-portals:GetData', function(location, pCoords,shop)
    local src = source
    local distance = #(pCoords - Config.shops[location].npc)
    local cashPrice = 0
    local goldPrice = 0
    if Config.price > 0 then
        cashPrice = math.ceil(distance * Config.price)
        goldPrice = math.ceil(cashPrice / 20.67) -- 1899 Gold Price = $20.67
    end
    local time = math.ceil(distance * Config.time)
    local displayTime = math.ceil(time / 1000)

    TriggerClientEvent('bcc-portals:DestinationMenu', src, location, cashPrice, goldPrice, time, displayTime, shop)
end)

-- Buy Portal Passage
RegisterNetEvent('bcc-portals:BuyPassage', function(location, price, time, payment)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter

    if payment == 'cash' then
        if Character.money >= price then
            Character.removeCurrency(0, price)
            goto continue
        else
            VORPcore.NotifyRightTip(src, _U('shortCash'), 4000)
            return
        end
    elseif payment == 'gold' then
        if Character.gold >= price then
            Character.removeCurrency(1, price)
            goto continue
        else
            VORPcore.NotifyRightTip(src, _U('shortGold'), 4000)
            return
        end
    elseif payment == 'free' then
        goto continue
    end
    ::continue::
    TriggerClientEvent('bcc-portals:SendPlayer', src, location, time)
end)

-- Get Player Job and Job Grade
VORPcore.addRpcCallback('CheckPlayerJob', function(source, cb, shop)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local playerJob = Character.job
    local jobGrade = Character.jobGrade

    if playerJob then
        for _, job in pairs(Config.shops[shop].allowedJobs) do
            if playerJob == job then
                if tonumber(jobGrade) >= tonumber(Config.shops[shop].jobGrade) then
                    cb(true)
                    return
                end
            end
        end
    end
    VORPcore.NotifyRightTip(src, _U('needJob'), 4000)
    cb(false)
end)
