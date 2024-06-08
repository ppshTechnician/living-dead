fx_version 'cerulean'
game 'gta5'

description 'Living Dead Survival'

shared_script 'config.lua'

server_scripts {
    '@mysql-async/lib/MySQL.lua', 
    'locales/en.lua',
    'server/functions.lua',
    'server/events.lua',
    'server/main.lua'
}

client_scripts {
    'locales/en.lua',
    'client/functions.lua',
    'client/events.lua',
    'client/main.lua'
}

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'css/styles.css',
    'js/scripts.js'
}