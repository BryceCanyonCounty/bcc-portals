Config = {}
-- Set Language
Config.defaultlang = "en_lang"
-- Open Fast Travel Menu
Config.shopKey = 0x760A9C6F --[G]
-- Travel Time Between Locations
Config.travelTime = 5000
-- Fast Travel Shops
Config.travelShops = {
    annesburg = {
        shopName = "Annesburg Travel", -- Name of Shop on Menu Header
        menuName = "Annesburg", -- Name of Destination in Menu Body
        location = "annesburg", -- DON'T CHANGE
        promptName = "Annesburg Travel", -- Text Below the Prompt Button
        blipAllowed = true, -- Turns Blips On / Off
        blipName = "Annesburg Travel", -- Name of the Blip on the Map
        blipSprite = 784218150, -- 2005921736 = Canoe / -1018164873 = Tugboat
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32", -- Shop Open - Blip Colors Shown Below
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10", -- Shop Closed - Blip Colors Shown Below
        npcx = 2926.16, npcy = 1278.9, npcz = 44.63, npch = 59.22, -- Blip and NPC Positions
        playerx = 2924.99, playery = 1279.23, playerz = 44.63, playerh = 283.09, -- Player Teleport Position
        distanceShop = 2.0, -- Distance from NPC to Get Menu Prompt
        npcAllowed = true, -- Turns NPCs On / Off
        npcModel = "A_M_M_UniBoatCrew_01", -- Sets Model for NPCs
        allowedJobs = {}, -- Empty, Everyone Can Use / Insert Job to limit access - ex. "police"
        jobGrade = 0, -- Enter Minimum Rank / Job Grade to Access Shop
        shopHours = false, -- If You Want the Shops to Use Open and Closed Hours
        shopOpen = 7, -- Shop Open Time / 24 Hour Clock
        shopClose = 21, -- Shop Close Time / 24 Hour Clock
        buyPrice = 50, -- Price for Fast Travel
        currencyType = "cash", -- "cash" or "gold"
    },
    armadillo = {
        shopName = "Armadillo Travel",
        menuName = "Armadillo",
        location = "armadillo", -- DON'T CHANGE
        promptName = "Armadillo Travel",
        blipAllowed = true,
        blipName = "Armadillo Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -3724.68, npcy = -2602.43, npcz = -12.91, npch = 246.94,
        playerx = -3724.04, playery = -2603.28, playerz = -12.94, playerh = 16.65,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 40,
        currencyType = "cash",
    },
    blackwater = {
        shopName = "Blackwater Travel",
        menuName = "Blackwater",
        location = "blackwater", -- DON'T CHANGE
        promptName = "Blackwater Travel",
        blipAllowed = true,
        blipName = "Blackwater Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -732.87, npcy = -1232.39, npcz = 44.73, npch = 133.34,
        playerx = -733.99, playery = -1233.41, playerz = 44.73, playerh = 313.2,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 20,
        currencyType = "cash",
    },
    rhodes = {
        shopName = "Rhodes Travel",
        menuName = "Rhodes",
        location = "rhodes", -- DON'T CHANGE
        promptName = "Rhodes Travel",
        blipAllowed = true,
        blipName = "Rhodes Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = 1233.52, npcy = -1287.75, npcz = 76.97, npch = 284.16,
        playerx = 1234.95, playery = -1287.43, playerz = 76.97, playerh = 103.86,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 20,
        currencyType = "cash",
    },
    strawberry = {
        shopName = "Strawberry Travel",
        menuName = "Strawberry",
        location = "strawberry", -- DON'T CHANGE
        promptName = "Strawberry Travel",
        blipAllowed = true,
        blipName = "Strawberry Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -1836.82, npcy = -422.29, npcz = 160.86, npch = 244.28,
        playerx = -1835.75, playery = -422.89, playerz = 160.83, playerh = 58.27,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 10,
        currencyType = "cash",
    },
    stdenis = {
        shopName = "Saint Denis Travel",
        menuName = "Saint Denis",
        location = "stdenis", -- DON'T CHANGE
        promptName = "Saint Denis Travel",
        blipAllowed = true,
        blipName = "Saint Denis Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = 2740.99, npcy = -1391.48, npcz = 46.21, npch = 17.09,
        playerx = 2740.67, playery = -1390.49, playerz = 46.23, playerh = 201.54,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 30,
        currencyType = "cash",
    },
    tumbleweed = {
        shopName = "Tumbleweed Travel",
        menuName = "Tumbleweed",
        location = "tumbleweed", -- DON'T CHANGE
        promptName = "Tumbleweed Travel",
        blipAllowed = true,
        blipName = "Tumbleweed Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -5495.56, npcy = -2958.57, npcz = -0.69, npch = 314.82,
        playerx = -5494.4, playery = -2957.35, playerz = -0.71, playerh = 149.64,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 50,
        currencyType = "cash",
    },
    valentine = {
        shopName = "Valentine Travel",
        menuName = "Valentine",
        location = "valentine", -- DON'T CHANGE
        promptName = "Valentine Travel",
        blipAllowed = true,
        blipName = "Valentine Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -184.38, npcy = 642.8, npcz = 113.59, npch = 50.3,
        playerx = -185.79, playery = 643.63, playerz = 113.44, playerh = 239.31,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 30,
        currencyType = "cash",
    },
    vanhorn = {
        shopName = "Van Horn Travel",
        menuName = "Van Horn",
        location = "vanhorn", -- DON'T CHANGE
        promptName = "Van Horn Travel",
        blipAllowed = true,
        blipName = "Van Horn Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = 2893.08, npcy = 623.51, npcz = 57.72, npch = 64.27,
        playerx = 2891.88, playery = 623.66, playerz = 57.77, playerh = 254.74,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        buyPrice = 40,
        currencyType = "cash",
    },
}

--[[--------BLIP_COLORS----------
LIGHT_BLUE    = 'BLIP_MODIFIER_MP_COLOR_1',
DARK_RED      = 'BLIP_MODIFIER_MP_COLOR_2',
PURPLE        = 'BLIP_MODIFIER_MP_COLOR_3',
ORANGE        = 'BLIP_MODIFIER_MP_COLOR_4',
TEAL          = 'BLIP_MODIFIER_MP_COLOR_5',
LIGHT_YELLOW  = 'BLIP_MODIFIER_MP_COLOR_6',
PINK          = 'BLIP_MODIFIER_MP_COLOR_7',
GREEN         = 'BLIP_MODIFIER_MP_COLOR_8',
DARK_TEAL     = 'BLIP_MODIFIER_MP_COLOR_9',
RED           = 'BLIP_MODIFIER_MP_COLOR_10',
LIGHT_GREEN   = 'BLIP_MODIFIER_MP_COLOR_11',
TEAL2         = 'BLIP_MODIFIER_MP_COLOR_12',
BLUE          = 'BLIP_MODIFIER_MP_COLOR_13',
DARK_PUPLE    = 'BLIP_MODIFIER_MP_COLOR_14',
DARK_PINK     = 'BLIP_MODIFIER_MP_COLOR_15',
DARK_DARK_RED = 'BLIP_MODIFIER_MP_COLOR_16',
GRAY          = 'BLIP_MODIFIER_MP_COLOR_17',
PINKISH       = 'BLIP_MODIFIER_MP_COLOR_18',
YELLOW_GREEN  = 'BLIP_MODIFIER_MP_COLOR_19',
DARK_GREEN    = 'BLIP_MODIFIER_MP_COLOR_20',
BRIGHT_BLUE   = 'BLIP_MODIFIER_MP_COLOR_21',
BRIGHT_PURPLE = 'BLIP_MODIFIER_MP_COLOR_22',
YELLOW_ORANGE = 'BLIP_MODIFIER_MP_COLOR_23',
BLUE2         = 'BLIP_MODIFIER_MP_COLOR_24',
TEAL3         = 'BLIP_MODIFIER_MP_COLOR_25',
TAN           = 'BLIP_MODIFIER_MP_COLOR_26',
OFF_WHITE     = 'BLIP_MODIFIER_MP_COLOR_27',
LIGHT_YELLOW2 = 'BLIP_MODIFIER_MP_COLOR_28',
LIGHT_PINK    = 'BLIP_MODIFIER_MP_COLOR_29',
LIGHT_RED     = 'BLIP_MODIFIER_MP_COLOR_30',
LIGHT_YELLOW3 = 'BLIP_MODIFIER_MP_COLOR_31',
WHITE         = 'BLIP_MODIFIER_MP_COLOR_32']]
