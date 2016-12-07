

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

	

	
     --Dispel
	{type = 'header', text = 'Dispel All when toggled on', align = 'center'},
	{type = 'text', text = 'Dont use it. Still Bugged', align = 'center'},
	{type = 'checkbox', text = 'Dispel All', key = 'Dispel', default = false},
	{type = 'ruler'},{type = 'spacer'},

	--Cooldowns
	{type = 'header', text = 'Cooldowns when toggled on', align = 'center'},
	{type = 'checkspin', text = 'Use Guardian Spirit', key = 'c_GS', default_check = false, default_spin = 25},
	{type = 'ruler'},{type = 'spacer'},

    --TRINKETS
    {type = 'header', text = 'Trinkets', align = 'center'},
    {type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', default = false},
    {type = 'checkbox', text = 'Bottom Trinket', key = 'Trinket_2', default = false},
    {type = 'ruler'},{type = 'spacer'},

	--KEYBINDS
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'text', text = 'Left Shift: Holy Word: Sanctify|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Holy Word: Sanctify', key = 'k_HWS', default = false},
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

	--DPS
	{type = 'header', text = 'Extra DPS', align = 'center'},
	{type = 'text', text = 'Check to enable extra DPS', align = 'center'},
	{type = 'checkbox', text = 'Holy Word: Chastise', key = 'd_HWC', default = false},
	{type = 'checkbox', text = 'Holy Fire', key = 'd_HF', default = false},
	{type = 'ruler'},{type = 'spacer'},

	--Full DPS
	{type = 'header', text = 'Full DPS', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Gift of the Naaru', key = 'full_Gift', default = 20},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'full_HWSE', default = 40},
	{type = 'spinner', text = 'Flash Heal', key = 'full_FH', default = 50},
	{type = 'ruler'},{type = 'spacer'},

	--TANK
	{type = 'header', text = 'Tank', align = 'center'},
	{type = 'text', text = 'Tank health values', align = 'center'},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 't_HWSE', default = 60},
	{type = 'spinner', text = 'Flash Heal', key = 't_FH', default = 85},
	{type = 'spinner', text = 'Prayer of Mending', key = 't_PoM', default = 100},
	{type = 'spinner', text = 'Renew', key = 't_Ren', default = 100},
	{type = 'ruler'},{type = 'spacer'},

	--PLAYER
	{type = 'header', text = 'Player', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Gift of the Naaru', key = 'p_Gift', default = 20},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'p_HWSE', default = 40},
	{type = 'spinner', text = 'Flash Heal', key = 'p_FH', default = 85},
	{type = 'spinner', text = 'Prayer of Mending', key = 'p_PoM', default = 100},
	{type = 'spinner', text = 'Renew', key = 'p_Ren', default = 0},
	{type = 'ruler'},{type = 'spacer'},

	--LOWEST
	{type = 'header', text = 'Lowest', align = 'center'},
	{type = 'text', text = 'Lowest health values', align = 'center'},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'l_HWSE', default = 50},
	{type = 'spinner', text = 'Flash Heal', key = 'l_FH', default = 85},
	{type = 'spinner', text = 'Prayer of Mending', key = 'l_PoM', default = 100},
	{type = 'spinner', text = 'Renew', key = 'l_Ren', default = 0},
	{type = 'spinner', text = 'Heal', key = 'l_H', default = 95},
	{type = 'ruler'},{type = 'spacer'},

	--MOVING
	{type = 'header', text = 'Movement', align = 'center'},
	{type = 'checkbox', text = 'Angelic Feather', key = 'm_AF', default = false},
	{type = 'checkbox', text = 'Body and Mind', key = 'm_Body', default = false},
	{type = 'text', text = 'Lowest health and moving values', align = 'center'},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'm_HWSE', default = 60},
	{type = 'spinner', text = 'Flash Heal Surge of Light', key = 'm_FH', default = 70},
	{type = 'spinner', text = 'Renew', key = 'm_Ren', default = 95},
}

local exeOnLoad = function()
	
    
	print('|cffFACC2E Holy Priest Rotation loaded|r')
	print('|cffFACC2E For Settings Right-Click the MasterToggle and go to Combat Routines Settings |r')
	print('|cffFACC2E Have a nice day!|r')

		NeP.Interface:AddToggle({
		key = 'xDPS',
		name = 'Full DPS!',
		text = 'ON/OFF using Full DPS in rotation',
		icon = 'Interface\\ICONS\\spell_holy_holysmite', --toggle(xDPS)
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
	--Holy Word: Sanctify on Mouseover target left shift when checked in UI.
	{'!Holy Word: Sanctify', 'keybind(lshift) & UI(k_HWS)', 'cursor.ground'},
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

local SpiritOfRedemption = {
	--Holy Word: Serenity when lowest health is below 50%.
	{'!Holy Word: Serenity', 'lowest.health < 50', 'lowest'},
	--Flash Heal when lowest health is below 100%.
	{'Flash Heal', 'lowest.health < 100' , 'lowest'}
}

local SymbolOfHope = {
	--Holy Word: Serenity when lowest health is below 50%.
	{'!Holy Word: Serenity', 'lowest.health < 50', 'lowest'},
	--Flash Heal when lowest health is below 100%.
	{'Flash Heal', 'lowest.health < 100' , 'lowest'},
	--Renew if lowest health is missing Renew and Lowest health is below or if UI value.
	{'Renew', '!lowest.buff(Renew) & lowest.health <= UI(m_Ren) & !toggle(xDPS) & moving', 'lowest'}

}

local DPS = {
	--Holy Word: Chastise on cooldown if not healing when checked in UI.
	{'Holy Word: Chastise', 'UI(d_HWC)' , 'target'},
	--Holy Fire on cooldown if not healing when checked in UI.
	{'Holy Fire', 'UI(d_HF)' , 'target'},
	--Smite on cooldown if not healing.
	{'Smite', nil, 'target'}
}

local FullDPS = {
    --Gift of the Naaru if player health is below or if UI value.
	{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
	--Holy Word: Serenity if player health is below or if UI value.
	{'!Holy Word: Serenity', 'player.health <= UI(full_HWSE)', 'player'},
	--Flash Heal if player health is below or if UI value.
	{'Flash Heal', 'player.health <= UI(full_FH)', 'player'},
    --Holy Word: Chastise on cooldown if not healing when checked in UI.
	{'Holy Word: Chastise', 'target.range <= 30', 'target'},
	--Holy Fire on cooldown if not healing when checked in UI.
	{'Holy Fire', nil, 'target'},
	--Holy Nova if 4 or more enemies within 10yds.
	{'!Holy Nova', 'player.area(10).enemies >= 4 & toggle(AOE)', 'player'},
    --Smite on cooldown if not healing.
	{'Smite', '!moving', 'target'},
	


}

local Tank = {
	--Holy Word: Serenity if tank health is below or if UI value.
	{'!Holy Word: Serenity', 'tank.health <= UI(t_HWSE)', 'tank'},
	--Flash heal if tank health is below or if UI value.
	{'Flash Heal', 'tank.health <= UI(t_FH)', 'tank'},
	--Prayer of Mending if tank missing Prayer of Mending and when tank health is below or if UI value.
	{'Prayer of Mending', '!tank.buff(Prayer of Mending) & tank.health <= UI(t_PoM)', 'tank'},
	--Renew if tank missing Renew and when tank health is below or if UI value.
	{'Renew', '!tank.buff(Renew) & tank.health <= UI(t_Ren)', 'tank'}

}

local Player = {
	--Gift of the Naaru if player health is below or if UI value.
	{'Gift of the Naaru', 'player.health <= UI(p_Gift)', 'player'},
	--Holy Word: Serenity if player health is below or if UI value.
	{'!Holy Word: Serenity', 'player.health <= UI(p_HWSE)', 'player'},
	--Flash Heal if player health is below or if UI value.
	{'Flash Heal', 'player.health <= UI(p_FH)', 'player'},
	--Prayer of Mending if player missing Prayer of Mending and player health is below or if UI value.
	{'Prayer of Mending', '!player.buff(Prayer of Mending) & player.health <= UI(p_PoM)', 'player'},
	--Renew if player missing Renew and player health is below or if UI value.
	{'Renew', '!player.buff(Renew) & player.health <= UI(p_Ren)', 'player'},

}

local Lowest = {
	--Flash Heal charge Dump if Surge of Light duration is less or equal to 3 seconds.
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	--Gift of the Naaru if lowest health is below or if 20% and has Guardian Spirit.
	{'Gift of the Naaru', 'lowest.health <= 20 & lowest.buff(Guardian Spirit)', 'lowest'},
	--Holy Word: Serenity if lowest health is below or if UI value.
	{'!Holy Word: Serenity', 'lowest.health <= UI(l_HWSE)', 'lowest'},
	--Flash Heal if lowest health is below or if UI value.
	{'Flash Heal', 'lowest.health <= UI(l_FH)', 'lowest'},
	--Prayer of Healing if lowest and 4 or more others are below or if 65% health
	{'Prayer of Healing', 'lowest.area(20, 65).heal >= 4' , 'lowest'},
	--Prayer of Mending if lowest health missing Prayer of Mending and is below or if UI value.
	{'Prayer of Mending', '!lowest.buff(Prayer of Mending) & lowest.health <= UI(l_PoM)', 'lowest'},
	--Renew if lowest health is missing Renew and is below or if UI value.
	{'Renew', '!lowest.buff(Renew) & lowest.health <= UI(l_Ren)', 'lowest'},
	--Heal if Lowest Healt is below or if UI value.
	{'Heal', 'lowest.health <= UI(l_H) & !lowest.health <= UI(l_FH)', 'lowest'}
}

local Moving = {
	--Gift of the Naaru if lowest health is below or if 20% and has Guardian Spirit.
	{'Gift of the Naaru', 'lowest.health <= 20 & lowest.buff(Guardian Spirit)', 'lowest'},
	--Holy Word: Serenity if lowest health  is below or if UI value.
	{'!Holy Word: Serenity', 'lowest.health <= UI(m_HWSE) ', 'lowest'},
	--Renew if lowest health is missing Renew and Lowest health is below or if UI value.
	{'Renew', '!lowest.buff(Renew) & lowest.health <= UI(m_Ren) & !toggle(xDPS)', 'lowest'},
	--Flash Heal charge Dump if Surge of Light duration is less or equal to 3 seconds and moving
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	--Flash Heal when Surge of Light is active, Lowest Health  is below or if UI value.
	{'Flash Heal', 'player.buff(Surge of Light) & lowest.health <= UI(m_FH)', 'lowest'},
	--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'!Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player.ground'},
	--Body and Mind if player is moving for 2 seconds or longer and Missing Body and Mind and if UI enables it.
	{'!Body and Mind', 'player.movingfor >= 2 & !player.buff(Body And Mind) & UI(m_Body)', 'player'},
	-- Full DPS when activated.
	{FullDPS, 'toggle(xDPS) & target.range <= 40'},

}                                                                               

local inCombat = {
    {'!Purify', 'CanDispell(Purify).health <= 100 & !player.channeling(Divine Hymn) & UI(Dispel)', 'CanDispell(Purify)'},
    {Potions},
	--Fade when you get aggro.
	{'fade', 'aggro & !player.channeling(Divine Hymn)'},
	 --Guardian Spirit if lowest health is below or if UI value and checked.
	{'!Guardian Spirit', 'UI(c_GS_check) & lowest.health <= UI(c_GS_spin) & toggle(cooldowns) & !player.channeling(Divine Hymn)', 'lowest'},
    {Trinkets, '!player.channeling(Divine Hymn)'},
	{Keybinds},
	--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
	{'Halo','talent(Halo) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS) & !player.channeling(Divine Hymn)'},
	--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
    {'Divine Star', 'talent(Divine Star) & player.area(24, 95).heal.infront >= 3 & toggle(AOE)'},
	--Holy Word: Sanctify if lowest and 3 or more others at 40yds are below or if 80% health and if unlocked with advanced.
	{'!Holy Word: Sanctify', 'lowest.area(10, 75).heal >= 5 & !player.channeling(Divine Hymn)','lowest.ground'},
	--Circle of healing if lowest and 4 or more others at 30yds are below or if 85% health.
	{'Circle of Healing', 'lowest.area(30, 85).heal >= 4 & toggle(AOE) & talent(Circle of Healing) & !toggle(xDPS) & !player.channeling(Divine Hymn)', 'lowest'},
	--Prayer of Healing if lowest and 4 or more others at 20yds are below or if 65% health
	{'!Prayer of Healing', 'lowest.area(20, 85).heal >= 4 & toggle(AOE) & !toggle(xDPS) & !lowest.health <= 40 & !player.channeling(Divine Hymn)', 'lowest'},
	{SymbolOfHope, 'player.buff(Symbol of Hope) & !player.channeling(Prayer of Healing) & !player.channeling(Divine Hymn)'},
	{SpiritOfRedemption, 'player.buff(Spirit of Redemption) & !player.channeling(Prayer of Healing) & !player.channeling(Divine Hymn)'},
	--Holy Nova if player and 4 or more others at 10yds are below or if 90% health.
	{'Holy Nova', 'player.area(10, 99).heal >= 4 & !player.area(10, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS) & !lowest.health <= UI(l_FH) & !player.channeling(Divine Hymn)', 'player'},
	{Moving, 'moving & !player.channeling(Prayer of Healing) & !player.channeling(Divine Hymn)'},
	{{
		{Tank, 'tank.health < 100 & !toggle(xDPS)'},
		{Player, 'health < 100 & !toggle(xDPS)'},
		{Lowest, 'lowest.health < 100 & !toggle(xDPS)'},
		{FullDPS, 'toggle(xDPS) & target.range <= 40'},
		{DPS, 'lowest.health > 90 & !toggle(xDPS)'},
	}, '!moving & !player.channeling(Divine Hymn) & !player.channeling(Prayer of Healing)'},

	

}

local outCombat = {
    {'!Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
    {'Renew', '!lowest.buff(Renew) & lowest.health < 100', 'lowest'},
	{Keybinds},
    --Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player.ground'},
	--Body and Mind if player is moving for 2 seconds or longer and Missing Body and Mind and if UI enables it.
	{'Body and Mind', 'player.movingfor >= 2 & !player.buff(Body And Mind) & UI(m_Body)', 'player'},
	{"%ressdead(Resurrection)", (function() return F('auto_res') end) },
}


NeP.CR:Add(257, {
    name = '|cffFACC2E [Yobleed]|r Priest - |cffFACC2EHoly|r',
      ic = inCombat,
     ooc = outCombat,
     gui = GUI,
    load = exeOnLoad
})
