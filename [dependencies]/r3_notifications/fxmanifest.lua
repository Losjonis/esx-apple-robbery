name "r3_notifications"
author "r3ps4J"
contact "discord.gg/bEWmBbg"

fx_version "adamant"
game "gta5"

description "Plugin to manage notifications"

client_script "scripts/cl_*.lua"
server_script "scripts/sv_*.lua"

client_script "config.lua"
server_script "config.lua"

exports {
	"clientSendNotification",
}