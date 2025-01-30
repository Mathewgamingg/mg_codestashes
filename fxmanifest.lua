fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'MG / MathewGaming'
description 'Script for code on stashes in houses etc.'

client_scripts {
    "client/*.lua",
}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua'
}

shared_scripts {
    "configs/config.lua",
    '@ox_lib/init.lua',
    'locales/locale.lua'
}

escrow_ignore {
    'configs/config.lua',
    'locales/locale.lua'
}
