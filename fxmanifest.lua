fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'
author 'BCC @Apollyon'

shared_scripts {
    'config/*.lua',
    'locale.lua',
    'languages/*.lua'
}

client_scripts {
    'client/main.lua',
    'client/menu.lua'
}

server_scripts {
    'server/versioncheck.lua',
    'server/main.lua'
}

version '1.3.0'
