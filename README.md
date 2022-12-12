# Fast Travel

#### Description
This is a basic Fast Travel script for RedM servers using the [VORP framework](https://github.com/VORPCORE). Travel can be arranged through shops. There are 9 shops configured, more shop locations may be added using the `config.lua` file.

#### Features
- Buy passage to a location from a Travel Shop
- Cash or gold may be used for payments
- Shop hours may be set individually for each shop or disabled to allow the shop to remain open
- Shop blips are colored and changeable per shop location
- Blips can change color reflecting if shop is open or closed
- Shop access can be limited by job and jobgrade

#### Configuration
Settings can be changed in the `config.lua` file. Here is an example of one shop:
```lua
    annesburg = {
        shopName = "Annesburg Travel", -- Name of Shop on Menu
        location = "annesburg",
        promptName = "Annesburg Travel", -- Text Below the Prompt Button
        blipAllowed = true, -- Turns Blips On / Off
        blipName = "Annesburg Travel", -- Name of the Blip on the Map
        blipSprite = 784218150,
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
```

#### Dependencies
- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [menuapi](https://github.com/outsider31000/menuapi)

#### Installation
- Ensure that the dependancies are added and started
- Add `oss_fasttravel` folder to your resources folder
- Add `ensure oss_fasttravel` to your `resources.cfg`
- Restart your server and get traveling

#### Credits
- vorp_stores

#### GitHub
- https://github.com/JusCampin/oss_boats