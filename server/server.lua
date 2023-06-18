local VORPcore = {}
TriggerEvent('getCore', function(core)
    VORPcore = core
end)

-- Buy Portal Passage
RegisterNetEvent('bcc-portals:BuyPassage', function(data)
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local currencyType = data.currencyType
    local buyPrice = data.buyPrice

    if currencyType == 'cash' then
        if Character.money >= buyPrice then
            Character.removeCurrency(0, buyPrice)
            TriggerClientEvent('bcc-portals:SendPlayer', _source, data.location)
        else
            VORPcore.NotifyRightTip(_source, _U('shortCash'), 4000)
        end

    elseif currencyType == 'gold' then
        if Character.gold >= buyPrice then
            Character.removeCurrency(1, buyPrice)
            TriggerClientEvent('bcc-portals:SendPlayer', _source, data.location)
        else
            VORPcore.NotifyRightTip(_source, _U('shortGold'), 4000)
        end
    end
end)

-- Check Player Job and Job Grade
RegisterNetEvent('bcc-portals:getPlayerJob', function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local CharacterJob = Character.job
    local CharacterGrade = Character.jobGrade

    TriggerClientEvent('bcc-portals:sendPlayerJob', _source, CharacterJob, CharacterGrade)
end)
