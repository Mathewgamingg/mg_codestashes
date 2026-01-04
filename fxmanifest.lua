fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'MD Development / MathewGaming'
description 'Script for code on stashes in houses etc.'

client_scripts {
    "client/*.lua",
}

server_scripts {
    'server/server_config.lua',
    'server/server.lua',
    '@oxmysql/lib/MySQL.lua'
}

shared_scripts {
    "configs/*.lua",
    '@ox_lib/init.lua',
    'locales/*.lua'
}