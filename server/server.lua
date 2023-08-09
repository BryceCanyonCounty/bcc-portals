local VORPcore = {}
TriggerEvent('getCore', function(core)
    VORPcore = core
end)

-- Get Travel Time and Price Data
VORPcore.addRpcCallback("GetTravelData", function(source, cb, travelInfo)
    local travelLoc = travelInfo.location
    local distance = #(travelInfo.coords - Config.shops[travelLoc].npcPos)
    local cashPrice = 0
    local goldPrice = 0
    if Config.price > 0 then
        cashPrice = math.ceil(distance * Config.price)
        goldPrice = math.ceil(cashPrice / 20.67) -- 1899 Gold Price = $20.67
    end
    local time = math.ceil(distance * Config.time)
    local displayTime = math.ceil(time / 1000)
    local travelData = {location = travelLoc, cash = cashPrice, gold = goldPrice, travelTime = time, dispTime = displayTime}

    cb(travelData)
end)

-- Buy Portal Passage
VORPcore.addRpcCallback("GetPlayerCanTravel", function(source, cb, canTravelInfo)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local currency = canTravelInfo.currency
    local price = canTravelInfo.price

    if currency == 'cash' then
        if Character.money >= price then
            Character.removeCurrency(0, price)
            cb(true)
        else
            VORPcore.NotifyRightTip(src, _U('shortCash'), 4000)
            cb(false)
        end
    elseif currency == 'gold' then
        if Character.gold >= price then
            Character.removeCurrency(1, price)
            cb(true)
        else
            VORPcore.NotifyRightTip(src, _U('shortGold'), 4000)
            cb(false)
        end
    else
        cb(true)
    end
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
