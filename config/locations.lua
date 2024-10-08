-----------------------------------------------------
-- Portal Location Configuration
-----------------------------------------------------
Locations = {
    ['Annesburg'] = {
        shop = {
            name        = 'Annesburg Portal', -- Name of Shop on Menu Header
            prompt      = 'Annesburg Portal', -- Text Below the Menu Prompt Button
            distance    = 2.0,                -- Distance Between Player and Shop to Show Menu Prompt
            currency    = 3,                  -- 1 = Cash-Only / 2 = Gold-Only / 3 = Cash and Gold / 4 = Free
            jobsEnabled = false,              -- Allow Shop Access to Specified Jobs Only
            jobs        = {                   -- Insert Job to Limit Access - ex. jobs = {{name = 'police', grade = 1},{name = 'doctor', grade = 3}}
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false, -- Shop uses Open and Closed Hours
                open   = 7,     -- Shop Open Time / 24 Hour Clock
                close  = 21     -- Shop Close Time / 24 Hour Clock
            }
        },
        blip = {
            show       = true,               -- Show Blip On Map
            showClosed = true,               -- Show Blip On Map when Closed
            name       = 'Annesburg Portal', -- Name of Blip on Map
            sprite     = 784218150,          -- Default: 784218150
            color      = {
                open   = 'WHITE',            -- Shop Open - Default: White - Blip Colors Shown Below
                closed = 'RED',              -- Shop Closed - Default: Red - Blip Colors Shown Below
                job    = 'YELLOW_ORANGE'     -- Shop Job Locked - Default: Yellow - Blip Colors Shown Below
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
        excludes = {}                                   -- Exclude Specific Locations from Menu / ex. excludes = {'Valentine', 'Saint Denis'}
    },
    -----------------------------------------------------

    ['Armadillo'] = {
        shop = {
            name        = 'Armadillo Portal',
            prompt      = 'Armadillo Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Armadillo Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    },
    -----------------------------------------------------

    ['Blackwater'] = {
        shop = {
            name        = 'Blackwater Portal',
            prompt      = 'Blackwater Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Blackwater Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    },
    -----------------------------------------------------

    ['Rhodes'] = {
        shop = {
            name        = 'Rhodes Portal',
            prompt      = 'Rhodes Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Rhodes Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    },
    -----------------------------------------------------

    ['Strawberry'] = {
        shop = {
            name        = 'Strawberry Portal',
            prompt      = 'Strawberry Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Strawberry Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    },
    -----------------------------------------------------

    ['Saint Denis'] = {
        shop = {
            name        = 'Saint Denis Portal',
            prompt      = 'Saint Denis Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Saint Denis Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    },
    -----------------------------------------------------

    ['Tumbleweed'] = {
        shop = {
            name        = 'Tumbleweed Portal',
            prompt      = 'Tumbleweed Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Tumbleweed Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    },
    -----------------------------------------------------

    ['Valentine'] = {
        shop = {
            name        = 'Valentine Portal',
            prompt      = 'Valentine Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Valentine Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    },
    -----------------------------------------------------

    ['Van Horn'] = {
        shop = {
            name        = 'Van Horn Portal',
            prompt      = 'Van Horn Portal',
            distance    = 2.0,
            currency    = 3,
            jobsEnabled = false,
            jobs        = {
                { name = 'police', grade = 1 },
                { name = 'doctor', grade = 3 }
            },
            hours       = {
                active = false,
                open   = 7,
                close  = 21
            }
        },
        blip = {
            show       = true,
            showClosed = true,
            name       = 'Van Horn Portal',
            sprite     = 784218150,
            color      = {
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
        excludes = {}
    }
}
-----------------------------------------------------
