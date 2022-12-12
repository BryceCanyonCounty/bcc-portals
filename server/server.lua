local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

-- Buy New Boats
RegisterServerEvent('oss_fasttravel:BuyTicket')
AddEventHandler('oss_fasttravel:BuyTicket', function(location, currencyType, buyPrice)
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local money = Character.money
    local gold = Character.gold

    if currencyType == "cash" then
        if money >= buyPrice then
            Character.removeCurrency(0, buyPrice)
            VORPcore.NotifyRightTip(_source, _U("bought") .. name .. _U("frcash") .. buyPrice, 4000)
        else
            VORPcore.NotifyRightTip(_source, _U("shortCash"), 4000)
        end

    elseif currencyType == "gold" then
        if gold >= buyPrice then
            Character.removeCurrency(1, buyPrice)
            VORPcore.NotifyRightTip(_source, _U("bought") .. name .. _U("fr") .. buyPrice .. _U("ofgold"), 4000)
        else
            VORPcore.NotifyRightTip(_source, _U("shortGold"), 4000)
        end
    end
end)

-- Check Player Job and Job Grade
RegisterServerEvent('oss_fasttravel:getPlayerJob')
AddEventHandler('oss_fasttravel:getPlayerJob', function()
    local _source = source
    if _source then
        local Character = VORPcore.getUser(_source).getUsedCharacter
        local CharacterJob = Character.job
        local CharacterGrade = Character.jobGrade

        TriggerClientEvent('oss_fasttravel:sendPlayerJob', _source, CharacterJob, CharacterGrade)
    end
end)
