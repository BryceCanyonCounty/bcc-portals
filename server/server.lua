local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

-- Buy New Boats
RegisterServerEvent('oss_portals:BuyPassage')
AddEventHandler('oss_portals:BuyPassage', function(outletData, portId)
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local money = Character.money
    local gold = Character.gold
    local location = outletData.location
    local currencyType = outletData.currencyType
    local buyPrice = outletData.buyPrice

    if currencyType == "cash" then
        if money >= buyPrice then
            Character.removeCurrency(0, buyPrice)
            TriggerClientEvent('oss_portals:SendPlayer', _source, location, portId)
        else
            VORPcore.NotifyRightTip(_source, _U("shortCash"), 4000)
        end

    elseif currencyType == "gold" then
        if gold >= buyPrice then
            Character.removeCurrency(1, buyPrice)
            TriggerClientEvent('oss_portals:SendPlayer', _source, location, portId)
        else
            VORPcore.NotifyRightTip(_source, _U("shortGold"), 4000)
        end
    end
end)

-- Check Player Job and Job Grade
RegisterServerEvent('oss_portals:getPlayerJob')
AddEventHandler('oss_portals:getPlayerJob', function()
    local _source = source
    if _source then
        local Character = VORPcore.getUser(_source).getUsedCharacter
        local CharacterJob = Character.job
        local CharacterGrade = Character.jobGrade

        TriggerClientEvent('oss_portals:sendPlayerJob', _source, CharacterJob, CharacterGrade)
    end
end)
