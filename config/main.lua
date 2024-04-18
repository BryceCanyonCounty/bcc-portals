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

-- Portal Shops
Config.shops = {
    annesburg = {
        shop = {
            name     = 'Annesburg Portal',              -- Name of Shop on Menu Header
            prompt   = 'Annesburg Portal',              -- Text Below the Menu Prompt Button
            distance = 2.0,                             -- Distance Between Player and Shop to Show Menu Prompt
            currency = 3,                               -- 1 = Cash-Only / 2 = Gold-Only / 3 = Cash and Gold / 4 = Free
            jobsEnabled = false,                        -- Allow Shop Access to Specified Jobs Only
            jobs     = {                                -- Insert Job to Limit Access - ex. jobs = {{name = 'police', grade = 1},{name = 'doctor', grade = 3}}
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,                         -- Shop uses Open and Closed Hours
                open   = 7,                             -- Shop Open Time / 24 Hour Clock
                close  = 21                             -- Shop Close Time / 24 Hour Clock
            }
        },
        blip = {
            show   = true,                              -- Show Blip On Map
            showClosed = true,                          -- Show Blip On Map when Closed
            name   = 'Annesburg Portal',                -- Name of Blip on Map
            sprite = 784218150,                         -- Default: 784218150
            color  = {
                open   = 'WHITE',                       -- Shop Open - Default: White - Blip Colors Shown Below
                closed = 'RED',                         -- Shop Closed - Deafault: Red - Blip Colors Shown Below
                job    = 'YELLOW_ORANGE'                -- Shop Job Locked - Default: Yellow - Blip Colors Shown Below
            }
        },
        npc = {
            active   = true,                             -- Turns NPC On / Off
            model    = 's_m_m_sdticketseller_01',        -- Model Used for NPC
            coords   = vector3(2941.59, 1273.58, 43.64), -- NPC and Shop Blip Positions
            heading  = 237.13,                           -- NPC Heading
            distance = 100.0                             -- Distance Between Player and Shop for NPC to Spawn
        },
        player = {
            coords  = vector3(2942.39, 1272.97, 44.64), -- Player Teleport Position
            heading = 52.18                             -- Player Heading
        },
        outlets = {                                     -- Available Locations for Shop / label is the Name Used in the Body of the Menu
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
    -----------------------------------------------------

    armadillo = {
        shop = {
            name     = 'Armadillo Portal',
            prompt   = 'Armadillo Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Armadillo Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(-3724.68, -2602.43, -13.91),
            heading  = 246.94,
            distance = 100.0
        },
        player = {
            coords  = vector3(-3724.04, -2603.28, -12.94),
            heading = 16.65
        },
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
    -----------------------------------------------------

    blackwater = {
        shop = {
            name     = 'Blackwater Portal',
            prompt   = 'Blackwater Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Blackwater Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(-732.87, -1232.39, 43.73),
            heading  = 133.34,
            distance = 100.0
        },
        player = {
            coords  = vector3(-733.99, -1233.41, 44.73),
            heading = 313.2
        },
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
    -----------------------------------------------------

    rhodes = {
        shop = {
            name     = 'Rhodes Portal',
            prompt   = 'Rhodes Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Rhodes Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(1233.52, -1287.75, 75.97),
            heading  = 284.16,
            distance = 100.0
        },
        player = {
            coords  = vector3(1234.95, -1287.43, 76.97),
            heading = 103.86
        },
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
    -----------------------------------------------------

    strawberry = {
        shop = {
            name     = 'Strawberry Portal',
            prompt   = 'Strawberry Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Strawberry Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(-1836.82, -422.29, 159.86),
            heading  = 244.28,
            distance = 100.0
        },
        player = {
            coords  = vector3(-1835.75, -422.89, 160.83),
            heading = 58.27
        },
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
    -----------------------------------------------------

    stdenis = {
        shop = {
            name     = 'Saint Denis Portal',
            prompt   = 'Saint Denis Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Saint Denis Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(2740.99, -1391.48, 45.21),
            heading  = 17.09,
            distance = 100.0
        },
        player = {
            coords  = vector3(2740.67, -1390.49, 46.23),
            heading = 201.54
        },
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
    -----------------------------------------------------

    tumbleweed = {
        shop = {
            name     = 'Tumbleweed Portal',
            prompt   = 'Tumbleweed Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Tumbleweed Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(-5495.56, -2958.57, -1.69),
            heading  = 314.82,
            distance = 100.0
        },
        player = {
            coords  = vector3(-5494.4, -2957.35, -0.71),
            heading = 149.64
        },
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
    -----------------------------------------------------

    valentine = {
        shop = {
            name     = 'Valentine Portal',
            prompt   = 'Valentine Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Valentine Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(-184.38, 642.8, 112.59),
            heading  = 50.3,
            distance = 100.0
        },
        player = {
            coords  = vector3(-185.79, 643.63, 113.44),
            heading = 239.31
        },
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
    -----------------------------------------------------

    vanhorn = {
        shop = {
            name     = 'Van Horn Portal',
            prompt   = 'Van Horn Portal',
            distance = 2.0,
            currency = 3,
            jobsEnabled = false,
            jobs     = {
                {name = 'police', grade = 1},
                {name = 'doctor', grade = 3}
            },
            hours    = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show   = true,
            showClosed = true,
            name   = 'Van Horn Portal',
            sprite = 784218150,
            color  = {
                open   = 'WHITE',
                closed = 'RED',
                job    = 'YELLOW_ORANGE'
            }
        },
        npc = {
            active   = true,
            model    = 's_m_m_sdticketseller_01',
            coords   = vector3(2893.08, 623.51, 56.72),
            heading  = 64.27,
            distance = 100.0
        },
        player = {
            coords  = vector3(2891.88, 623.66, 57.77),
            heading = 254.74
        },
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