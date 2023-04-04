-- oss_portals
Config = {}

-- Set Language
Config.defaultlang = "en_lang"

-- Open Portals Menu
Config.portKey = 0x760A9C6F --[G]

-- Travel Time in Milliseconds Between Locations
Config.travelTime = 15000 -- Default: 15000ms = 15 Seconds

-- Allow Blips on Map when Stable is Closed
Config.blipAllowedClosed = true -- true = Show Blips / false = Remove Blips

-- Portal Shops
Config.ports = {
    annesburg = {
        portName = "Annesburg Portal", -- Name of Shop on Menu Header
        promptName = "Annesburg Portal", -- Text Below the Prompt Button
        blipAllowed = true, -- Turns Blips On / Off
        blipName = "Annesburg Portal", -- Name of the Blip on the Map
        blipSprite = 784218150, -- 784218150 = Default
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32", -- Shop Open - Blip Colors Shown Below
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10", -- Shop Closed - Blip Colors Shown Below
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23", -- Shop Job Locked - Default: Yellow - Blip Colors Shown Below
        npc = {x = 2941.59, y = 1273.58, z = 43.64, h = 237.13}, -- NPC and Shop Blip Positions
        player = {x = 2942.39, y = 1272.97, z = 44.64, h = 52.18}, -- Player Teleport Position
        distPort = 2.0, -- Distance from NPC to Get Menu Prompt
        npcAllowed = true, -- Turns NPCs On / Off
        npcModel = "A_M_M_UniBoatCrew_01", -- Sets Model for NPCs
        allowedJobs = {}, -- Empty, Everyone Can Use / Insert Job to limit access - ex. "police"
        jobGrade = 0, -- Enter Minimum Rank / Job Grade to Access Shop
        portHours = false, -- If You Want the Shops to Use Open and Closed Hours
        portOpen = 7, -- Shop Open Time / 24 Hour Clock
        portClose = 21, -- Shop Close Time / 24 Hour Clock
        outlets = { -- label is the name used in the body of the menu / currencyType = "cash" or "gold" / DO NOT CHANGE "location"
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 50 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 40 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 20 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 40 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 20 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 50 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 30 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 10 },
        }
    },
    armadillo = {
        portName = "Armadillo Portal",
        promptName = "Armadillo Portal",
        blipAllowed = true,
        blipName = "Armadillo Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = -3724.68, y = -2602.43, z = -13.91, h = 246.94},
        player = {x = -3724.04, y = -2603.28, z = -12.94, h = 16.65},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 50 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 20 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 40 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 20 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 40 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 10 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 30 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 50 },
        }
    },
    blackwater = {
        portName = "Blackwater Portal",
        promptName = "Blackwater Portal",
        blipAllowed = true,
        blipName = "Blackwater Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = -732.87, y = -1232.39, z = 43.73, h = 133.34},
        player = {x = -733.99, y = -1233.41, z = 44.73, h = 313.2},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 40 },
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 20 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 30 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 10 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 40 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 30 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 20 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 40 },
        }
    },
    rhodes = {
        portName = "Rhodes Portal",
        promptName = "Rhodes Portal",
        blipAllowed = true,
        blipName = "Rhodes Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = 1233.52, y = -1287.75, z = 75.97, h = 284.16},
        player = {x = 1234.95, y = -1287.43, z = 76.97, h = 103.86},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 20 },
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 40 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 30 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 30 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 10 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 40 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 20 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 20 },
        }
    },
    strawberry = {
        portName = "Strawberry Portal",
        promptName = "Strawberry Portal",
        blipAllowed = true,
        blipName = "Strawberry Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = -1836.82, y = -422.29, z = 159.86, h = 244.28},
        player = {x = -1835.75, y = -422.89, z = 160.83, h = 58.27},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 40 },
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 20 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 10 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 30 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 30 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 30 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 10 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 40 },
        }
    },
    stdenis = {
        portName = "Saint Denis Portal",
        promptName = "Saint Denis Portal",
        blipAllowed = true,
        blipName = "Saint Denis Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = 2740.99, y = -1391.48, z = 45.21, h = 17.09},
        player = {x = 2740.67, y = -1390.49, z = 46.23, h = 201.54},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 20 },
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 40 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 40 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 10 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 30 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 50 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 30 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 20 },
        }
    },
    tumbleweed = {
        portName = "Tumbleweed Portal",
        promptName = "Tumbleweed Portal",
        blipAllowed = true,
        blipName = "Tumbleweed Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = -5495.56, y = -2958.57, z = -1.69, h = 314.82},
        player = {x = -5494.4, y = -2957.35, z = -0.71, h = 149.64},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 50 },
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 10 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 30 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 40 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 30 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 50 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 30 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 50 },
        }
    },
    valentine = {
        portName = "Valentine Portal",
        promptName = "Valentine Portal",
        blipAllowed = true,
        blipName = "Valentine Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = -184.38, y = 642.8, z = 112.59, h = 50.3},
        player = {x = -185.79, y = 643.63, z = 113.44, h = 239.31},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 30 },
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 30 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 20 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 20 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 10 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 30 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 30 },
            vanhorn    = { label = "Van Horn",    location = "vanhorn",    currencyType = "cash", buyPrice = 30 },
        }
    },
    vanhorn = {
        portName = "Van Horn Portal",
        promptName = "Van Horn Portal",
        blipAllowed = true,
        blipName = "Van Horn Portal",
        blipSprite = 784218150,
        blipColorOpen = "BLIP_MODIFIER_MP_COLOR_32",
        blipColorClosed = "BLIP_MODIFIER_MP_COLOR_10",
        blipColorJob = "BLIP_MODIFIER_MP_COLOR_23",
        npc = {x = 2893.08, y = 623.51, z = 56.72, h = 64.27},
        player = {x = 2891.88, y = 623.66, z = 57.77, h = 254.74},
        distPort = 2.0,
        npcAllowed = true,
        npcModel = "A_M_M_UniBoatCrew_01",
        allowedJobs = {},
        jobGrade = 0,
        portHours = false,
        portOpen = 7,
        portClose = 21,
        outlets = {
            annesburg  = { label = "Annesburg",   location = "annesburg",  currencyType = "cash", buyPrice = 10 },
            armadillo  = { label = "Armadillo",   location = "armadillo",  currencyType = "cash", buyPrice = 50 },
            blackwater = { label = "Blackwater",  location = "blackwater", currencyType = "cash", buyPrice = 40 },
            rhodes     = { label = "Rhodes",      location = "rhodes",     currencyType = "cash", buyPrice = 20 },
            strawberry = { label = "Strawberry",  location = "strawberry", currencyType = "cash", buyPrice = 40 },
            stdenis    = { label = "Saint Denis", location = "stdenis",    currencyType = "cash", buyPrice = 20 },
            tumbleweed = { label = "Tumbleweed",  location = "tumbleweed", currencyType = "cash", buyPrice = 50 },
            valentine  = { label = "Valentine",   location = "valentine",  currencyType = "cash", buyPrice = 30 },
        }
    }
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
