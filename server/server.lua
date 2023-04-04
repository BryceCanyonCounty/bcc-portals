local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

-- Buy New Boats
RegisterServerEvent('oss_portals:BuyPassage')
AddEventHandler('oss_portals:BuyPassage', function(outletData)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local location = outletData.location
    local currencyType = outletData.currencyType
    local buyPrice = outletData.buyPrice

    if currencyType == "cash" then
        local money = Character.money
        if money >= buyPrice then
            Character.removeCurrency(0, buyPrice)
            TriggerClientEvent('oss_portals:SendPlayer', src, location)
        else
            VORPcore.NotifyRightTip(src, _U("shortCash"), 4000)
        end

    elseif currencyType == "gold" then
        local gold = Character.gold
        if gold >= buyPrice then
            Character.removeCurrency(1, buyPrice)
            TriggerClientEvent('oss_portals:SendPlayer', src, location)
        else
            VORPcore.NotifyRightTip(src, _U("shortGold"), 4000)
        end
    end
end)

-- Check Player Job and Job Grade
RegisterServerEvent('oss_portals:getPlayerJob')
AddEventHandler('oss_portals:getPlayerJob', function()
    local src = source
    if src then
        local Character = VORPcore.getUser(src).getUsedCharacter
        local CharacterJob = Character.job
        local CharacterGrade = Character.jobGrade

        TriggerClientEvent('oss_portals:sendPlayerJob', src, CharacterJob, CharacterGrade)
    end
end)
