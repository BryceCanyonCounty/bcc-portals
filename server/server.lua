local VORPcore = {}
TriggerEvent('getCore', function(core)
    VORPcore = core
end)

-- Get Travel Time and Price Data
RegisterNetEvent('bcc-portals:GetData', function(location, pCoords,shopId)
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

    TriggerClientEvent('bcc-portals:DestinationMenu', src, location, cashPrice, goldPrice, time, displayTime, shopId)
end)

-- Buy Portal Passage
RegisterNetEvent('bcc-portals:BuyPassage', function(location, price, time, isCash)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter

    if isCash then
        if Character.money >= price then
            Character.removeCurrency(0, price)
            TriggerClientEvent('bcc-portals:SendPlayer', src, location, time)
        else
            VORPcore.NotifyRightTip(src, _U('shortCash'), 4000)
        end
    else
        if Character.gold >= price then
            Character.removeCurrency(1, price)
            TriggerClientEvent('bcc-portals:SendPlayer', src, location, time)
        else
            VORPcore.NotifyRightTip(src, _U('shortGold'), 4000)
        end
    end
end)

-- Get Player Job and Job Grade
VORPcore.addRpcCallback('GetJobData', function(source, cb)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
        cb({Character.job, Character.jobGrade})
    end)
