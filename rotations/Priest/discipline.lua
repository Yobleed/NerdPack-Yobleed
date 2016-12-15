

local GUI = {  
        --[[ Header Texture ]]
		{ 
			type = "texture",
			texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\holy.blp",
			width = 512, 
			height = 256, 
			offset = 90, 
			y = 42, 
			center = true 
		},

    --Resurrection
	{type = 'header', text = 'Ressurection', align = 'center'},
	{type = 'checkbox', text = 'Auto Ress out of combat', key = 'rezz', default = false},
	{type = 'ruler'},{type = 'spacer'},

    --TRINKETS
    {type = 'header', text = 'Trinkets', align = 'center'},
    {type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', default = false},
    {type = 'checkbox', text = 'Bottom Trinket', key = 'Trinket_2', default = false},
    {type = 'ruler'},{type = 'spacer'},

	--KEYBINDS
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'text', text = 'Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', default = false},
	{type = 'checkbox', text = 'Pause', key = 'k_P', default = false},
	{type = 'ruler'},{type = 'spacer'},

	--POTIONS
	{type = 'header', text = 'Potions', align = 'center'},
	{type = 'text', text = 'Check to enable Potions', align = 'center'},
	{type = 'checkspin', text = 'Healthstone', key = 'p_HS', default_check = false, default_spin = 25},
	{type = 'checkspin', text = 'Ancient Healing Potion', key = 'p_AHP', default_check = false, default_spin = 25},
	{type = 'checkspin', text = 'Ancient Mana Potion', key = 'p_AMP', default_check = false, default_spin = 20},
	{type = 'ruler'},{type = 'spacer'},

	--Full DPS
	{type = 'header', text = 'Full DPS', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Gift of the Naaru', key = 'full_Gift', default = 20},
	{type = 'spinner', text = 'Shadow Mend', key = 'full_mend', default = 40},
	{type = 'spinner', text = 'Power Word: Shield', key = 'full_PWS', default = 60},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Moving
	{type = 'header', text = 'Movement', align = 'center'},
	{type = 'checkbox', text = 'Angelic Feather', key = 'm_AF', default = false},
	{type = 'checkbox', text = 'Body and Soul', key = 'm_Body', default = false},
	{type = 'ruler'}, {type = 'spacer'},

}

local exeOnLoad = function()
	
    
	print('|cffFACC2E Discipline Priest Rotation loaded|r')
	print('|cffFACC2E For Settings Right-Click the MasterToggle and go to Combat Routines Settings |r')
	print('|cffFACC2E Have a nice day!|r')

		NeP.Interface:AddToggle({
		key = 'xDPS',
		name = 'Full DPS!',
		text = 'ON/OFF using Full DPS in rotation',
		icon = 'Interface\\ICONS\\spell_holy_holysmite', --toggle(xDPS)
	})

	NeP.Interface:AddToggle({
		key = 'disp',
		name = 'Dispell',
		text = 'ON/OFF Dispel All',
		icon = 'Interface\\ICONS\\spell_holy_dispelmagic', --toggle(disp)
	})


end


local Trinkets = {
	--Top Trinket usage if UI enables it.
	{'#trinket1', 'UI(trinket_1)'},
	--Bottom Trinket usage if UI enables it.
	{'#trinket2', 'UI(trinket_2)'}
}

local Keybinds = {
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'cursor.ground' },
	-- Pause on left alt when checked in UI.
	{'%pause', 'keybind(lalt)& UI(k_P)'}
} 

local Potions = {
	--Health Stone below 20% health. Active when NOT channeling Divine Hymn.
	{'#Healthstone', 'UI(p_HS_check) & player.health <= UI(p_HS_spin) & !player.channeling(Divine Hymn)'},
	--Ancient Healing Potion below 20% health. Active when NOT channeling Divine Hymn.
	{'#Ancient Healing Potion', 'UI(p_AHP_check) & player.health <= UI(p_AHP_spin) & !player.channeling(Divine Hymn)'},
	--Ancient Mana Potion below 20% mana. Active when NOT channeling Divine Hymn.
	{'#Ancient Mana Potion', 'UI(p_AMP_check) & player.mana <= UI(p_AMP_spin) & !player.channeling(Divine Hymn)'}
}

local FullDPS = {
    --PI on CD if toggled.
	{'Power Infusion', 'talent(Power Infusion) & toggle(cooldowns)', 'target'},
    --PWS if player health is below or if UI value.
	{'Power Word: Shield', 'player.health <= UI(full_PWS)', 'player'},
    --Shadow Mend if player health is below or if UI value.
	{'Shadow Mend', 'player.health <= UI(full_mend)', 'player'},
    --Gift of the Naaru if player health is below or if UI value.
	{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
    --Purge the Wicked if talent and not on target.
	{'Purge the Wicked', 'talent(Purge the Wicked) & !target.debuff(Purge the Wicked)', 'target'},
	--Schism on cooldown.
	{'Schism', 'talent(Schism)', 'target'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'target.debuff(Purge the Wicked) || target.debuff(Shadow Word: Pain)', 'target'},
    --Power Word: Solace on cooldown if talent.
	{'Power Word: Solace', 'talent(Power Word: Solace)', 'target'},
	--Divine Star if moving.
	{'Divine Star', 'talent(Divine Star) & player.area(24).enemies.infront >= 1 & moving'},
	--Smite on CD.
	{'Smite', nil, 'target'},
	
}

local Moving = {
	--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player.ground'},
	-- Body and Soul usage if enabled in UI.
	{'!Power Word: Shield', 'talent(Body and Soul) & player.movingfor >= 1 & UI(m_Body)', 'player'},

}

                                          

local inCombat = {
    {Potions},
    {'%dispelall', 'toggle(disp) & spell(Purify).cooldown = 0'},
	--Fade when you get aggro.
	{'fade', 'aggro'},
    {Trinkets},
	{Keybinds},
	{Moving, 'moving'},
	--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
	{'Halo','talent(Halo) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
	--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
    {'Divine Star', 'talent(Divine Star) & player.area(24, 95).heal.infront >= 3 & toggle(AOE)'},
    {FullDPS, 'toggle(xDPS)'},

	--{{
	--    {Lowest, 'lowest.health < 100 & !toggle(xDPS)'},
	--	{Tank, 'tank.health < 100 & !toggle(xDPS)'},
	--	{Player, 'health < 100 & !toggle(xDPS)'},
	--	{FullDPS, 'toggle(xDPS) & target.range <= 40'},
	--	{DPS, 'lowest.health > 90 & !toggle(xDPS)'},
	--}, '!moving & !player.channeling(Divine Hymn) & !player.channeling(Prayer of Healing)'},

	

}

local outCombat = {
	{Keybinds},
	{Moving, 'moving'},
	{'%ressdead(Resurrection)', 'UI(rezz)'},
}


NeP.CR:Add(256, {
    name = '|cff58FAF4 [Yobleed]|r Priest - |cff58FAF4Discipline|r',
      ic = inCombat,
     ooc = outCombat,
     gui = GUI,
    load = exeOnLoad
})
