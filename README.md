# Portals

#### Description
This is a fast-travel script for RedM servers using the [VORP framework](https://github.com/VORPCORE). Travel can be arranged through shops. There are 9 shops configured, more shop locations may be added using the `config.lua` file.

#### Features
- Buy passage to a location from a Portal Shop
- Cash or gold may be used for payments
- Shop hours may be set individually for each shop or disabled to allow the shop to remain open
- Shop blips are colored and changeable per shop location
- Blips can change color reflecting if shop is open, closed or job locked
- Shop access can be limited by job and jobgrade

#### Configuration
Settings can be changed in the `config.lua` file. Here is an example of one shop:
```lua
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
```

#### Dependencies
- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [menuapi](https://github.com/outsider31000/menuapi)

#### Installation
- Ensure that the dependancies are added and started
- Add `oss_portals` folder to your resources folder
- Add `ensure oss_portals` to your `resources.cfg`

#### Credits
- rsg_fasttravel

#### GitHub
- https://github.com/JusCampin/oss_portals