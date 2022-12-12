Config = {}
-- Set Language
Config.defaultlang = "en_lang"
-- Open Fast Travel Menu
Config.shopKey = 0x760A9C6F --[G]
-- Travel Time Between Locations
Config.travelTime = 5000
-- Fast Travel Shops
Config.ftShops = {
    annesburg = {
        shopName = "Annesburg Travel", -- Name of Shop on Menu
        location = "annesburg", -- DON'T CHANGE / Used for Location in Database
        promptName = "Annesburg Travel", -- Text Below the Prompt Button
        blipAllowed = true, -- Turns Blips On / Off
        blipName = "Annesburg Travel", -- Name of the Blip on the Map
        blipSprite = 784218150, -- 2005921736 = Canoe / -1018164873 = Tugboat
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32", -- Shop Open - Blip Colors Shown Below
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10", -- Shop Closed - Blip Colors Shown Below
        npcx = 2931.614, npcy = 1283.1109, npcz = 44.65287, npch = 113.62, -- Blip and NPC Positions
        playerx = 2121.31, playery = -552.65, playerz = 42.7, playerh = 316.34, -- Player Teleport Position
        distanceShop = 2.0, -- Distance from NPC to Get Menu Prompt
        npcAllowed = true, -- Turns NPCs On / Off
        npcModel = "A_M_M_UniBoatCrew_01", -- Sets Model for NPCs
        allowedJobs = {}, -- Empty, Everyone Can Use / Insert Job to limit access - ex. "police"
        jobGrade = 0, -- Enter Minimum Rank / Job Grade to Access Shop
        shopHours = false, -- If You Want the Shops to Use Open and Closed Hours
        shopOpen = 7, -- Shop Open Time / 24 Hour Clock
        shopClose = 21, -- Shop Close Time / 24 Hour Clock
        price = 50, -- Price for Fast Travel
    },

    armadillo = {
        shopName = "Armadillo Travel",
        location = "armadillo", -- DON'T CHANGE
        promptName = "Armadillo Travel",
        blipAllowed = true,
        blipName = "Armadillo Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -3729.09, npcy = -2603.55, npcz = -12.94, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 40,
    },

    blackwater = {
        shopName = "Blackwater Travel",
        location = "blackwater", -- DON'T CHANGE
        promptName = "Blackwater Travel",
        blipAllowed = true,
        blipName = "Blackwater Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -830.92, npcy = -1343.15, npcz = 43.67, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 20,
    },

    rhodes = {
        shopName = "Rhodes Travel",
        location = "rhodes", -- DON'T CHANGE
        promptName = "Rhodes Travel",
        blipAllowed = true,
        blipName = "Rhodes Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = 1231.26, npcy = -1299.74, npcz = 76.9, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 20,
    },

    strawberry = {
        shopName = "Strawberry Travel",
        location = "strawberry", -- DON'T CHANGE
        promptName = "Strawberry Travel",
        blipAllowed = true,
        blipName = "Strawberry Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -1827.5, npcy = -437.65, npcz = 159.78, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 10,
    },

    stdenis = {
        shopName = "Saint Denis Travel",
        location = "saintdenis", -- DON'T CHANGE
        promptName = "Saint Denis Travel",
        blipAllowed = true,
        blipName = "Saint Denis Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = 2747.10, npcy = -1394.87, npcz = 46.18, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 30,
    },

    tumbleweed = {
        shopName = "Tumbleweed Travel",
        location = "tumbleweed", -- DON'T CHANGE
        promptName = "Tumbleweed Travel",
        blipAllowed = true,
        blipName = "Tumbleweed Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -5501.2, npcy = -2954.32, npcz = -1.73, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 50,
    },

    valentine = {
        shopName = "Valentine Travel",
        location = "valentine", -- DON'T CHANGE
        promptName = "Valentine Travel",
        blipAllowed = true,
        blipName = "Valentine Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = -174.39, npcy = 633.33, npcz = 114.09, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 30,
    },

    vanhorn = {
        shopName = "Van Horn Travel",
        location = "vanhorn", -- DON'T CHANGE
        promptName = "Van Horn Travel",
        blipAllowed = true,
        blipName = "Van Horn Travel",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        npcx = 2893.37, npcy = 624.33, npcz = 57.72, npch = 95.39,
        playerx = 2946.99, playery = -1250.47, playerz = 42.41, playerh = 270.52,
        distanceShop = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        price = 40,
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
