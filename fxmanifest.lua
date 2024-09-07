fx_version 'cerulean'
games { 'gta5' }

author 'Mazus' 
description 'MaraMusic' 
version '1.2.0'

ui_page 'html/index.html'

client_scripts {
	'@vrp/lib/utils.lua',
  'config.lua',
  'client/main.lua',
}

files {
	'html/index.html',
	'html/script.js',
	'html/*.svg',
	'html/radio.png',
	'html/main.css',
}

server_scripts {
	'@vrp/lib/utils.lua',
  'config.lua',
  'server/main.lua',
}                                          