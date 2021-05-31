resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

author "Shaz"


client_scripts {
    "@vrp/src/RMenu.lua",
    "@vrp/src/menu/RageUI.lua",
    "@vrp/src/menu/Menu.lua",
    "@vrp/src/menu/MenuController.lua",
    "@vrp/src/components/Audio.lua",
    "@vrp/src/components/Rectangle.lua",
    "@vrp/src/components/Screen.lua",
    "@vrp/src/components/Sprite.lua",
    "@vrp/src/components/Text.lua",
    "@vrp/src/components/Visual.lua",
    "@vrp/src/menu/elements/ItemsBadge.lua",
    "@vrp/src/menu/elements/ItemsColour.lua",
    "@vrp/src/menu/elements/PanelColour.lua",
    "@vrp/src/menu/items/UIButton.lua",
    "@vrp/src/menu/items/UICheckBox.lua",
    "@vrp/src/menu/items/UIList.lua",
    "@vrp/src/menu/items/UIProgress.lua",
    "@vrp/src/menu/items/UISlider.lua",
    "@vrp/src/menu/items/UISliderHeritage.lua",
    "@vrp/src/menu/items/UISliderProgress.lua",
    "@vrp/src/menu/panels/UIColourPanel.lua",
    "@vrp/src/menu/panels/UIGridPanel.lua",
    "@vrp/src/menu/panels/UIGridPanelHorizontal.lua",
    "@vrp/src/menu/panels/UIPercentagePanel.lua",
    "@vrp/src/menu/panels/UIStatisticsPanel.lua",
    "@vrp/src/menu/windows/UIHeritage.lua",

	"@vrp/client/Tunnel.lua",
    "@vrp/client/Proxy.lua",
	"config.lua",
	'client/main.lua',
}


server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	'server/main.lua',
}
