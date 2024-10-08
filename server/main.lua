local BccUtils = exports['bcc-utils'].initiate()
local discord = BccUtils.Discord.setup(Config.webhook.url, Config.webhook.name, Config.webhook.avatar)
local VORPcore = exports.vorp_core:GetCore()

local function ConvertToTime(ms)
    local seconds = math.ceil(ms / 1000)
    local mins = math.floor(seconds / 60)
    local secs = math.ceil(seconds % 60)
    local realTime = { minutes = mins, seconds = secs }
    return realTime
end

VORPcore.Callback.Register('bcc-portals:GetTravelData', function(source, cb, location, coords)
    local src = source
    local user = VORPcore.getUser(src)
    if not user then return cb(false) end
    local distance = #(coords - Locations[location].npc.coords)
    local cashPrice, goldPrice = 0, 0

    if Config.price > 0 then
        cashPrice = math.ceil(distance * Config.price)
        goldPrice = math.ceil(cashPrice / 20.67) -- 1899 Gold Price = $20.67
    end

    local time = math.floor(distance * Config.time)
    local displayTime = ConvertToTime(time)
    local travelData = { location = location, cash = cashPrice, gold = goldPrice, timeMs = time, dispTime = displayTime }

    cb(travelData)
end)

VORPcore.Callback.Register('bcc-portals:GetPlayerCanTravel', function(source, cb, currency, price, location, destination)
    local src = source
    local user = VORPcore.getUser(src)
    if not user then return cb(false) end
    local character = user.getUsedCharacter
    local charId = character.charIdentifier

    if currency == 'cash' then
        if character.money >= price then
            character.removeCurrency(0, price)
            discord:sendMessage(character.firstname .. ' ' .. character.lastname .. '\n' .. _U('charid') .. tostring(charId),
            '\n' .. location .. _U('travelTo') .. destination .. '\n' .. _U('priceCash') .. tostring(price))
            cb(true)
        else
            VORPcore.NotifyRightTip(src, _U('shortCash'), 4000)
            cb(false)
        end
    elseif currency == 'gold' then
        if character.gold >= price then
            character.removeCurrency(1, price)
            discord:sendMessage(character.firstname .. ' ' .. character.lastname .. '\n' .. _U('charid') .. tostring(charId),
            '\n' .. location .. _U('travelTo') .. destination .. '\n' .. _U('price') .. tostring(price) .. _U('nugget'))
            cb(true)
        else
            VORPcore.NotifyRightTip(src, _U('shortGold'), 4000)
            cb(false)
        end
    elseif currency == 'free' then
        discord:sendMessage(character.firstname .. ' ' .. character.lastname .. '\n' .. _U('charid') .. tostring(charId),
            '\n' .. location .. _U('travelTo') .. destination .. '\n' .. _U('priceFree'))
        cb(true)
    end
end)

local function CheckPlayerJob(charJob, jobGrade, shop)
    for _, job in pairs(Locations[shop].shop.jobs) do
        if (charJob == job.name) and (tonumber(jobGrade) >= tonumber(job.grade)) then
            return true
        end
    end
end

VORPcore.Callback.Register('bcc-portals:CheckJob', function(source, cb, shop)
    local src = source
    local user = VORPcore.getUser(src)
    if not user then return cb(false) end
    local character = user.getUsedCharacter
    local charJob = character.job
    local jobGrade = character.jobGrade

    if not charJob then cb(false) return end
    local hasJob = false
    hasJob = CheckPlayerJob(charJob, jobGrade, shop)
    if hasJob then
        cb(true)
    else
        VORPcore.NotifyRightTip(src, _U('needJob'), 4000)
        cb(false)
    end
end)

BccUtils.Versioner.checkFile(GetCurrentResourceName(), 'https://github.com/BryceCanyonCounty/bcc-portals')
