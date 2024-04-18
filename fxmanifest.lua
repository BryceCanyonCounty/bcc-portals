fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'
author 'BCC @Apollyon'

shared_scripts {
    'config/main.lua',
    'locale.lua',
    'languages/*.lua'
}

client_scripts {
    'client/main.lua',
    'client/helpers.lua'
}

server_scripts {
    'server/versioncheck.lua',
    'server/main.lua'
}

version '1.3.0'
