-- bcc-portals
Config = {}

-- Set Language
Config.defaultlang = 'en_lang'
-----------------------------------------------------

-- Open Portals Menu
Config.key = 0x760A9C6F --[G]
-----------------------------------------------------

-- Travel Time is Computed Based on Distance
Config.time = 3.0 -- Default: 3.0 / Travel Time Multiplier
-----------------------------------------------------

-- Price is Computed Based on Distance
Config.price = 0.012 -- Default: 0.012 / Price Multiplier
-----------------------------------------------------

-- Allow Blips on Map when Shop is Closed
Config.blipOnClosed = true -- true = Show Blips / false = Remove Blips
-----------------------------------------------------

-- Portal Shops
Config.shops = {
    annesburg = {
        shopName = 'Annesburg Portal', -- Name of Shop on Menu Header
        promptName = 'Annesburg Portal', -- Text Below the Prompt Button
        blipOn = true, -- Turns Blips On / Off
        blipName = 'Annesburg Portal', -- Name of the Blip on the Map
        blipSprite = 784218150, -- Default: 784218150
        blipOpen = 'WHITE', -- Shop Open - Default: White - Blip Colors Shown Below
        blipClosed = 'RED', -- Shop Closed - Deafault: Red - Blip Colors Shown Below
        blipJob = 'YELLOW_ORANGE', -- Shop Job Locked - Default: Yellow - Blip Colors Shown Below
        npcOn = true, -- Turns NPCs On / Off
        npcModel = 's_m_m_sdticketseller_01', -- Sets Model for NPCs
        npcPos = vector3(2941.59, 1273.58, 43.64), -- NPC and Shop Blip Positions
        npcHeading =  237.13, -- NPC Heading
        playerPos = vector3(2942.39, 1272.97, 44.64), -- Player Teleport Position
        playerHeading = 52.18, -- Player Heading
        nDistance = 100.0, -- Distance from Shop for NPC to Spawn
        sDistance = 2.0, -- Distance from NPC to Get Menu Prompt
        allowedJobs = {}, -- Empty, Everyone Can Use / Insert Job to limit access - ex. 'police'
        jobGrade = 0, -- Enter Minimum Rank / Job Grade to Access Shop
        shopHours = false, -- If You Want the Shops to Use Open and Closed Hours
        shopOpen = 7, -- Shop Open Time / 24 Hour Clock
        shopClose = 21, -- Shop Close Time / 24 Hour Clock
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = { -- label is the name used in the body of the menu / DO NOT CHANGE 'location'
            armadillo  = { label = 'Armadillo'   },
            blackwater = { label = 'Blackwater'  },
            rhodes     = { label = 'Rhodes'      },
            strawberry = { label = 'Strawberry'  },
            stdenis    = { label = 'Saint Denis' },
            tumbleweed = { label = 'Tumbleweed'  },
            valentine  = { label = 'Valentine'   },
            vanhorn    = { label = 'Van Horn'    }
        }
    },
    armadillo = {
        shopName = 'Armadillo Portal',
        promptName = 'Armadillo Portal',
        blipOn = true,
        blipName = 'Armadillo Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(-3724.68, -2602.43, -13.91),
        npcHeading =  246.94,
        playerPos = vector3(-3724.04, -2603.28, -12.94),
        playerHeading = 16.65,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'   },
            blackwater = { label = 'Blackwater'  },
            rhodes     = { label = 'Rhodes'      },
            strawberry = { label = 'Strawberry'  },
            stdenis    = { label = 'Saint Denis' },
            tumbleweed = { label = 'Tumbleweed'  },
            valentine  = { label = 'Valentine'   },
            vanhorn    = { label = 'Van Horn'    }
        }
    },
    blackwater = {
        shopName = 'Blackwater Portal',
        promptName = 'Blackwater Portal',
        blipOn = true,
        blipName = 'Blackwater Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(-732.87, -1232.39, 43.73),
        npcHeading =  133.34,
        playerPos = vector3(-733.99, -1233.41, 44.73),
        playerHeading = 313.2,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'   },
            armadillo  = { label = 'Armadillo'   },
            rhodes     = { label = 'Rhodes'      },
            strawberry = { label = 'Strawberry'  },
            stdenis    = { label = 'Saint Denis' },
            tumbleweed = { label = 'Tumbleweed'  },
            valentine  = { label = 'Valentine'   },
            vanhorn    = { label = 'Van Horn'    }
        }
    },
    rhodes = {
        shopName = 'Rhodes Portal',
        promptName = 'Rhodes Portal',
        blipOn = true,
        blipName = 'Rhodes Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(1233.52, -1287.75, 75.97),
        npcHeading =  284.16,
        playerPos = vector3(1234.95, -1287.43, 76.97),
        playerHeading = 103.86,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'   },
            armadillo  = { label = 'Armadillo'   },
            blackwater = { label = 'Blackwater'  },
            strawberry = { label = 'Strawberry'  },
            stdenis    = { label = 'Saint Denis' },
            tumbleweed = { label = 'Tumbleweed'  },
            valentine  = { label = 'Valentine'   },
            vanhorn    = { label = 'Van Horn'    }
        }
    },
    strawberry = {
        shopName = 'Strawberry Portal',
        promptName = 'Strawberry Portal',
        blipOn = true,
        blipName = 'Strawberry Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(-1836.82, -422.29, 159.86),
        npcHeading =  244.28,
        playerPos = vector3(-1835.75, -422.89, 160.83),
        playerHeading = 58.27,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'   },
            armadillo  = { label = 'Armadillo'   },
            blackwater = { label = 'Blackwater'  },
            rhodes     = { label = 'Rhodes'      },
            stdenis    = { label = 'Saint Denis' },
            tumbleweed = { label = 'Tumbleweed'  },
            valentine  = { label = 'Valentine'   },
            vanhorn    = { label = 'Van Horn'    }
        }
    },
    stdenis = {
        shopName = 'Saint Denis Portal',
        promptName = 'Saint Denis Portal',
        blipOn = true,
        blipName = 'Saint Denis Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(2740.99, -1391.48, 45.21),
        npcHeading =  17.09,
        playerPos = vector3(2740.67, -1390.49, 46.23),
        playerHeading = 201.54,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'  },
            armadillo  = { label = 'Armadillo'  },
            blackwater = { label = 'Blackwater' },
            rhodes     = { label = 'Rhodes'     },
            strawberry = { label = 'Strawberry' },
            tumbleweed = { label = 'Tumbleweed' },
            valentine  = { label = 'Valentine'  },
            vanhorn    = { label = 'Van Horn'   }
        }
    },
    tumbleweed = {
        shopName = 'Tumbleweed Portal',
        promptName = 'Tumbleweed Portal',
        blipOn = true,
        blipName = 'Tumbleweed Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(-5495.56, -2958.57, -1.69),
        npcHeading =  314.82,
        playerPos = vector3(-5494.4, -2957.35, -0.71),
        playerHeading = 149.64,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'   },
            armadillo  = { label = 'Armadillo'   },
            blackwater = { label = 'Blackwater'  },
            rhodes     = { label = 'Rhodes'      },
            strawberry = { label = 'Strawberry'  },
            stdenis    = { label = 'Saint Denis' },
            valentine  = { label = 'Valentine'   },
            vanhorn    = { label = 'Van Horn'    }
        }
    },
    valentine = {
        shopName = 'Valentine Portal',
        promptName = 'Valentine Portal',
        blipOn = true,
        blipName = 'Valentine Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(-184.38, 642.8, 112.59),
        npcHeading =  50.3,
        playerPos = vector3(-185.79, 643.63, 113.44),
        playerHeading = 239.31,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'   },
            armadillo  = { label = 'Armadillo'   },
            blackwater = { label = 'Blackwater'  },
            rhodes     = { label = 'Rhodes'      },
            strawberry = { label = 'Strawberry'  },
            stdenis    = { label = 'Saint Denis' },
            tumbleweed = { label = 'Tumbleweed'  },
            vanhorn    = { label = 'Van Horn'    }
        }
    },
    vanhorn = {
        shopName = 'Van Horn Portal',
        promptName = 'Van Horn Portal',
        blipOn = true,
        blipName = 'Van Horn Portal',
        blipSprite = 784218150,
        blipOpen = 'WHITE',
        blipClosed = 'RED',
        blipJob = 'YELLOW_ORANGE',
        npcOn = true,
        npcModel = 's_m_m_sdticketseller_01',
        npcPos = vector3(2893.08, 623.51, 56.72),
        npcHeading =  64.27,
        playerPos = vector3(2891.88, 623.66, 57.77),
        playerHeading = 254.74,
        nDistance = 100.0,
        sDistance = 2.0,
        allowedJobs = {},
        jobGrade = 0,
        shopHours = false,
        shopOpen = 7,
        shopClose = 21,
        currency = 3, -- 1 = cash-only / 2 = gold-only / 3 = cash and gold / 4 = free
        outlets = {
            annesburg  = { label = 'Annesburg'   },
            armadillo  = { label = 'Armadillo'   },
            blackwater = { label = 'Blackwater'  },
            rhodes     = { label = 'Rhodes'      },
            strawberry = { label = 'Strawberry'  },
            stdenis    = { label = 'Saint Denis' },
            tumbleweed = { label = 'Tumbleweed'  },
            valentine  = { label = 'Valentine'   }
        }
    }
}
-----------------------------------------------------

Config.BlipColors = {
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
    WHITE         = 'BLIP_MODIFIER_MP_COLOR_32'
}