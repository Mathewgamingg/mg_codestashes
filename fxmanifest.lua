fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'MG / MathewGaming'
description 'Script for code on stashes in houses etc.'

client_scripts {
    "client/client.lua",
}

server_scripts {
    'server/server.lua',
    '@oxmysql/lib/MySQL.lua'
}

shared_scripts {
    "config.lua",
    '@ox_lib/init.lua',
}

escrow_ignore {
    'config.lua'
}
