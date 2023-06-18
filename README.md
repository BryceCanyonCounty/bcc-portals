# bcc-portals

#### Description
Looking for fast and convenient travel in your server? Our script has got you covered! With multiple ticket sellers to choose from and the option to add more, you'll have access to quick transportation to your desired location. Plus, with customizable shop hours and access restrictions based on job and job grade, you can tailor the script to fit your needs perfectly. 

#### Features
- Buy passage to a location from a ticket seller
- Cash or gold may be used for payments
- Shop hours may be set individually for each shop or disabled to allow the shop to remain open
- Shop blips are colored and changeable per shop location
- Blips can change color reflecting if shop is open, closed or job locked
- Shop access can be limited by job and jobgrade
- Distance based NPC spawns

#### Configuration
Settings can be changed in the `config.lua` file. Here is an example of one shop:
```lua
    annesburg = {
        shopName = 'Annesburg Portal', -- Name of Shop on Menu Header
        promptName = 'Annesburg Portal', -- Text Below the Prompt Button
        blipOn = true, -- Turns Blips On / Off
        blipName = 'Annesburg Portal', -- Name of the Blip on the Map
        blipSprite = 784218150, -- 784218150 = Default
        blipColorOpen = 'WHITE', -- Shop Open - Default: White - Blip Colors Shown Below
        blipColorClosed = 'RED', -- Shop Closed - Deafault: Red - Blip Colors Shown Below
        blipColorJob = 'YELLOW_ORANGE', -- Shop Job Locked - Default: Yellow - Blip Colors Shown Below
        npc = {x = 2941.59, y = 1273.58, z = 43.64, h = 237.13}, -- NPC and Shop Blip Positions
        player = {x = 2942.39, y = 1272.97, z = 44.64, h = 52.18}, -- Player Teleport Position
        nDistance = 100.0, -- Distance from Shop for NPC to Spawn
        sDistance = 2.0, -- Distance from NPC to Get Menu Prompt
        npcOn = true, -- Turns NPCs On / Off
        npcModel = 's_m_m_sdticketseller_01', -- Sets Model for NPCs
        allowedJobs = {}, -- Empty, Everyone Can Use / Insert Job to limit access - ex. 'police'
        jobGrade = 0, -- Enter Minimum Rank / Job Grade to Access Shop
        shopHours = false, -- If You Want the Shops to Use Open and Closed Hours
        shopOpen = 7, -- Shop Open Time / 24 Hour Clock
        shopClose = 21, -- Shop Close Time / 24 Hour Clock
        outlets = { -- label is the name used in the body of the menu / currencyType = 'cash' or 'gold' / DO NOT CHANGE 'location'
            { label = 'Armadillo',   location = 'armadillo',  currencyType = 'cash', buyPrice = 100 },
            { label = 'Blackwater',  location = 'blackwater', currencyType = 'cash', buyPrice = 80  },
            { label = 'Rhodes',      location = 'rhodes',     currencyType = 'cash', buyPrice = 40  },
            { label = 'Strawberry',  location = 'strawberry', currencyType = 'cash', buyPrice = 80  },
            { label = 'Saint Denis', location = 'stdenis',    currencyType = 'cash', buyPrice = 40  },
            { label = 'Tumbleweed',  location = 'tumbleweed', currencyType = 'cash', buyPrice = 100 },
            { label = 'Valentine',   location = 'valentine',  currencyType = 'cash', buyPrice = 60  },
            { label = 'Van Horn',    location = 'vanhorn',    currencyType = 'cash', buyPrice = 20  },
        }
```

#### Dependencies
- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [menuapi](https://github.com/outsider31000/menuapi)

#### Installation
- Add `bcc-portals` folder to your resources folder
- Add `ensure bcc-portals` to your `resources.cfg`
- Restart server
