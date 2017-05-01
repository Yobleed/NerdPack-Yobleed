local GUI = {
	-- GUI Header 
	{type = "texture",
	texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\holy.blp",
	width = 512, 
	height = 256, 
	offset = 90, 
	y = 42, 
	center = true},

	--Resurrection
	{type = 'header', text = 'Ressurection', align = 'center'},
	{type = 'checkbox', text = 'Auto Ress out of combat', key = 'rezz', default = false},
	{type = 'ruler'},{type = 'spacer'},

	--Cooldowns
	{type = 'header', text = 'Cooldowns when toggled on', align = 'center'},
	{type = 'checkbox', text = 'Use Divine Hymn', key = 'DH', width = 55, default = false},
	{type = 'spinner', text = 'Players below 60%', key = 'DH_spin', width = 55, max = 10, step = 1, default = 7},
	{type = 'checkbox', text = 'Use Guardian Spirit on Tank', key = 'c_GSt', width = 55, default = false},
	{type = 'spinner', text = '', key = 'c_GSspint', width = 55, default = 20},
	{type = 'checkbox', text = 'Use Guardian Spirit on Lowest', key = 'c_GS', width = 55, default = false},
	{type = 'spinner', text = '', key = 'c_GSspin', width = 55, default = 20}, 
	{type = 'checkbox', text = '1 Charge of Light of T\'uure on Tank', key = 'c_lot1', default = false},
	{type = 'checkbox', text = 'Use Light of T\'uure on Tank', key = 'c_LoTt', width = 55, default = false},
	{type = 'spinner', text = '', key = 'c_LoTspint', width = 55, default = 30},
	{type = 'checkbox', text = 'Use Light of T\'uure on Lowest', key = 'c_LoT', width = 55, default = false},
	{type = 'spinner', text = '', key = 'c_LoTspin', width = 55, default = 30},
	{type = 'checkbox', text = 'Use Desperate Prayer', key = 'c_DP', width = 55, default = false},
	{type = 'spinner', text = '', key = 'c_DPspin', width = 55, default = 30},

	{type = 'ruler'},{type = 'spacer'},

	--TRINKETS
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', width = 55, default = false},
	{type = 'checkbox', text = 'Bottom Trinket', key = 'trinket_2', width = 55, default = false},
	{type = 'ruler'},{type = 'spacer'},

	--KEYBINDS
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'text', text = 'Left Shift: AoE Top Up|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Top Up', key = 'k_HWS', width = 55, default = false},
	{type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', width = 55, default = false},
	{type = 'checkbox', text = 'Pause', key = 'k_P', width = 55, default = false},
	{type = 'ruler'},{type = 'spacer'},

	--POTIONS
	{type = 'header', text = 'Potions', align = 'center'},
	{type = 'text', text = 'Check to enable Potions', align = 'center'},
	{type = 'checkbox', text = 'Healthstone', key = 'p_HS', width = 55, default = false},
	{type = 'spinner', text = '', key = 'p_HSspin', width = 55, default = 25},
	{type = 'checkbox', text = 'Ancient Healing Potion', key = 'p_AHP', width = 55, default = false},
	{type = 'spinner', text = '', key = 'p_AHPspin', width = 55, default = 25},
	{type = 'checkbox', text = 'Ancient Mana Potion', key = 'p_AMP', width = 55, default = false},
	{type = 'spinner', text = '', key = 'p_AMPspin', width = 55, default = 20},
	{type = 'ruler'},{type = 'spacer'},

	--Before Pull
	{type = 'header', text = 'Pull Timer', align = 'center'},
	{type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_PPull', width = 55, default= false},
	{type = 'text', text = 'Cast on Tank.', align = 'center'},
	{type = 'checkbox', text = 'Renew ', key = 'pull_Ren', width = 55, default= false},
	{type = 'checkbox', text = 'Prayer of Mending', key = 'pull_PoM', width = 55, default= false},
	{type = 'ruler'}, {type = 'spacer'},

	--DPS
	{type = 'header', text = 'Extra DPS', align = 'center'},
	{type = 'text', text = 'Check to enable extra DPS', align = 'center'},
	{type = 'checkbox', text = 'Holy Word: Chastise', key = 'd_HWC', width = 55, default = false},
	{type = 'checkbox', text = 'Holy Fire', key = 'd_HF', width = 55, default = false},
	{type = 'checkbox', text = 'Holy Nova', key = 'd_nova', width = 55, default = false},
	{type = 'ruler'},{type = 'spacer'},

	--Solo
	{type = 'header', text = 'Solo mode', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Gift of the Naaru', key = 'full_Gift', width = 55, default = 20},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'full_HWSE', width = 55, default = 40},
	{type = 'spinner', text = 'Flash Heal', key = 'full_FH', width = 55, default = 50},
	{type = 'ruler'},{type = 'spacer'},

	--TANK
	{type = 'header', text = 'Tank', align = 'center'},
	{type = 'text', text = 'Tank health values', align = 'center'},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 't_HWSE', width = 55, default = 60},
	{type = 'spinner', text = 'Flash Heal', key = 't_FH', width = 55, default = 85},
	{type = 'spinner', text = 'Renew', key = 't_Ren', width = 55, default = 100},
	{type = 'ruler'},{type = 'spacer'},

	--PLAYER
	{type = 'header', text = 'Player', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Gift of the Naaru', key = 'p_Gift', width = 55, default = 20},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'p_HWSE', width = 55, default = 40},
	{type = 'spinner', text = 'Flash Heal', key = 'p_FH', width = 55, default = 70},
	--{type = 'spinner', text = 'Renew', key = 'p_Ren', default = 0},
	{type = 'ruler'},{type = 'spacer'},

	--LOWEST
	{type = 'header', text = 'Lowest', align = 'center'},
	{type = 'text', text = 'Lowest health values', align = 'center'},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'l_HWSE', width = 55, default = 60},
	{type = 'spinner', text = 'Flash Heal', key = 'l_FH', width = 55, default = 85},
	--{type = 'spinner', text = 'Renew', key = 'l_Ren', default = 0},
	{type = 'spinner', text = 'Heal', key = 'l_H', width = 55, default = 95},
	{type = 'ruler'},{type = 'spacer'},

	--MOVING
	{type = 'header', text = 'Movement', align = 'center'},
	{type = 'checkbox', text = 'Angelic Feather', key = 'm_AF', width = 55, default = false},
	{type = 'checkbox', text = 'Body and Mind', key = 'm_Body', width = 55, default = false},
	{type = 'text', text = 'Lowest health and moving values', align = 'center'},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'm_HWSE', width = 55, default = 50},
	{type = 'spinner', text = 'Flash Heal Surge of Light', key = 'm_FH', width = 55, default = 70},
	{type = 'spinner', text = 'Renew', key = 'm_Ren', width = 55, default = 90},
}

local exeOnLoad = function()
	print('|cffFACC2E Holy Priest Rotation loaded|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

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
	{'#trinket1', 'UI(trinket_1) & !player.channeling(Divine Hymn) & player.area(20,80).heal >= 5'},
	--Bottom Trinket usage if UI enables it.
	{'#trinket2', 'UI(trinket_2)'},
}

local Keybinds = {
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD) & !advanced', 'cursor.ground'},
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
	--Holy Word: Sanctify on Mouseover target left shift when checked in UI.
	{'!Holy Word: Sanctify', 'lowestpredicted.health <= 100 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestpredicted.debuff(Ignite Soul) & !player.buff(Divinity) & keybind(lshift) & UI(k_HWS) & !advanced', 'cursor.ground'}, 
	{'!Holy Word: Sanctify', 'lowestpredicted.area(10, 85).heal >= 4 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestpredicted.debuff(Ignite Soul) & !player.buff(Divinity) & keybind(lshift) & UI(k_HWS)','lowestpredicted.ground'},
	{'Holy Word: Serenity',  'lowestpredicted.health <= 100 & keybind(lshift) & UI(k_HWS) & !player.buff(Divinity) & !advanced' , 'lowestpredicted'},
	{'Holy Word: Serenity',  'lowestpredicted.area(40, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & !player.buff(Divinity)' , 'lowestpredicted'},
	{'Prayer of Healing', 'lowestpredicted.area(40, 85).heal >= 4 & keybind(lshift) & UI(k_HWS)' , 'lowestpredicted'},
	{'Prayer of Healing', 'lowestpredicted.health <= 100 & keybind(lshift) & UI(k_HWS) & !advanced' , 'lowestpredicted'},
	-- Pause on left alt when checked in UI.
	{'%pause', 'keybind(lalt)& UI(k_P)'},
}

local Potions = {
	--Health Stone below 20% health. Active when NOT channeling Divine Hymn.
	{'#Healthstone', 'UI(p_HS) & player.health <= UI(p_HSspin) & !player.channeling(Divine Hymn)'},
	--Ancient Healing Potion below 20% health. Active when NOT channeling Divine Hymn.
	{'#Ancient Healing Potion', 'UI(p_AHP) & player.health <= UI(p_AHPspin) & !player.channeling(Divine Hymn)'},
	--Ancient Mana Potion below 20% mana. Active when NOT channeling Divine Hymn.
	{'#Ancient Mana Potion', 'UI(p_AMP) & player.mana <= UI(p_AMPspin) & !player.channeling(Divine Hymn)'},
}


local DPS = {
    --Holy Nova if 4 or more enemies within 10yds.
	{'!Holy Nova', 'player.area(10).enemies >= 4 & UI(d_nova)', 'player'},
	--Holy Word: Chastise on cooldown if not healing when checked in UI.
	{'Holy Word: Chastise', ' {UI(d_HWC) & !equipped(132445) & target.range <= 30} || {UI(d_HWC) & equipped(132445) & player.buff(Al\'maiesh, the Cord of Hope).count = 5 & target.range <= 30}' , 'target'}, 
	--Holy Fire on cooldown if not healing when checked in UI.
	{'Holy Fire', 'UI(d_HF)' , 'target'},
	--Smite on cooldown if not healing.
	{'Smite', nil, 'target'},
}

local FullDPS = {
	--Gift of the Naaru if player health is below or if UI value.
	{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
	--Holy Word: Serenity if player health is below or if UI value.
	{'!Holy Word: Serenity', 'player.health <= UI(full_HWSE)', 'player'},
	--Flash Heal if player health is below or if UI value.
	{'Flash Heal', 'player.health <= UI(full_FH)', 'player'},
	--Holy Word: Chastise on cooldown if not healing when checked in UI.
	{'Holy Word: Chastise', ' {!equipped(132445) & target.range <= 30} || {equipped(132445) & player.buff(Al\'maiesh, the Cord of Hope).count = 5 & target.range <= 30}' , 'target'},
	--Holy Nova if 4 or more enemies within 10yds.
	{'!Holy Nova', 'player.area(10).enemies >= 4 & toggle(AOE)', 'player'},
	--Holy Fire on cooldown if not healing when checked in UI.
	{'Holy Fire', '!moving', 'target'},
	--Smite on cooldown if not healing.
	{'Smite', nil, 'target'},
}


local Tankpred = {
	--Holy Word: Serenity if tank health is below or if UI value.
	{'!Holy Word: Serenity', 'tank.health.predicted <= UI(t_HWSE) & !player.buff(Divinity)', 'tank'},
	--Prayer of Mending if tank missing Prayer of Mending.
	{'Prayer of Mending', '!tank.buff(Prayer of Mending).count = 10 & !lowest.health <= 40', 'tank'},
	--Flash heal if tank health is below or if UI value.
	{'Flash Heal', 'tank.health.predicted <= UI(t_FH)', 'tank'},
	--Renew if tank missing Renew and when tank health is below or if UI value.
	{'Renew', '!tank.buff(Renew) & tank1.health.predicted <= UI(t_Ren)', 'tank1'},
	{'Renew', '!tank.buff(Renew) & tank2.health.predicted <= UI(t_Ren)', 'tank2'},
}

local Tank = {
	--Holy Word: Serenity if tank health is below or if UI value.
	{'!Holy Word: Serenity', 'tank.health <= UI(t_HWSE) & !player.buff(Divinity)', 'tank'},
	--Prayer of Mending if tank missing Prayer of Mending.
	{'Prayer of Mending', '!tank.buff(Prayer of Mending).count = 10 & !lowest.health <= 40', 'tank'},
	--Flash heal if tank health is below or if UI value.
	{'Flash Heal', 'tank.health <= UI(t_FH)', 'tank'},
	--Renew if tank missing Renew and when tank health is below or if UI value.
	{'Renew', '!tank.buff(Renew) & tank.health <= UI(t_Ren)', 'tank'},
}

local Playerpred = {
    --Holy Word: Serenity if player health is below or if UI value.
	{'!Holy Word: Serenity', 'player.health.predicted <= UI(p_HWSE) & !player.buff(Divinity)', 'player'},
    --Prayer of Mending if player missing Prayer of Mending.
	{'Prayer of Mending', '!player.buff(Prayer of Mending).count = 10 & !lowest.health <= 40', 'player'},
	--Gift of the Naaru if player health is below or if UI value.
	{'!Gift of the Naaru', 'player.health.predicted <= UI(p_Gift)', 'player'},
	--Flash Heal if player health is below or if UI value.
	{'Flash Heal', 'player.health.predicted <= UI(p_FH)', 'player'},
}

local Player = {
    --Holy Word: Serenity if player health is below or if UI value.
	{'!Holy Word: Serenity', 'player.health <= UI(p_HWSE) & !player.buff(Divinity)', 'player'},
    --Prayer of Mending if player missing Prayer of Mending.
	{'Prayer of Mending', '!player.buff(Prayer of Mending).count = 10', 'player'},
	--Gift of the Naaru if player health is below or if UI value.
	{'!Gift of the Naaru', 'player.health <= UI(p_Gift)', 'player'},
	--Flash Heal if player health is below or if UI value.
	{'Flash Heal', 'player.health <= UI(p_FH)', 'player'},
}

local Lowestpred = {
    --Holy Word: Serenity if lowest health is below or if UI value.
	{'!Holy Word: Serenity', 'lowestpredicted.health <= UI(l_HWSE) & !player.buff(Divinity)', 'lowestpredicted'},
    --Prayer of Mending if lowest health missing Prayer of Mending.
	{'Prayer of Mending', '!lowest.buff(Prayer of Mending).count = 10 & !lowest.health <= 40', 'lowest'},
	--Flash Heal charge Dump if Surge of Light duration is less or equal to 3 seconds.
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowestpredicted.health < 100', 'lowestpredicted'},
	--Gift of the Naaru if lowest health is below or if 20% and has Guardian Spirit.
	{'!Gift of the Naaru', 'lowestpredicted.health <= 20 & lowestpredicted.buff(Guardian Spirit)', 'lowestpredicted'},
	--Flash Heal if lowest health is below or if UI value.
	{'Flash Heal', 'lowestpredicted.health <= UI(l_FH)', 'lowestpredicted'},
	--Heal if Lowest Healt is below or if UI value.
	{'Heal', 'lowestpredicted.health <= UI(l_H) & !lowestpredicted.debuff(Fragile Echo)', 'lowestpredicted'},
}

local Lowest = {
    --Holy Word: Serenity if lowest health is below or if UI value. 
	{'!Holy Word: Serenity', 'lowest.health <= UI(l_HWSE) & !player.buff(Divinity)', 'lowest'},
    --Prayer of Mending if lowest health missing Prayer of Mending.
	{'Prayer of Mending', '!lowest.buff(Prayer of Mending).count = 10 & !lowest.health <= 40', 'lowest'},
	--Flash Heal charge Dump if Surge of Light duration is less or equal to 3 seconds.
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	--Gift of the Naaru if lowest health is below or if 20% and has Guardian Spirit.
	{'!Gift of the Naaru', 'lowest.health <= 20 & lowest.buff(Guardian Spirit)', 'lowest'},
	--Flash Heal if lowest health is below or if UI value.
	{'Flash Heal', 'lowest.health <= UI(l_FH)', 'lowest'},
	--Heal if Lowest Healt is below or if UI value.
	{'Heal', 'lowest.health <= UI(l_H) & !lowest.debuff(Fragile Echo)', 'lowest'},
}

local Moving = {
	--Gift of the Naaru if lowest health is below or if 20% and has Guardian Spirit.
	{'!Gift of the Naaru', 'lowest.health <= 20 & lowest.buff(Guardian Spirit)', 'lowest'},
	--Holy Word: Serenity if lowest health is below or if UI value.
	{'!Holy Word: Serenity', 'lowest.health <= UI(m_HWSE) & !player.buff(Divinity)', 'lowest'},
	--Renew if lowest health is missing Renew and Lowest health is below or if UI value.
	{'Renew', '!lowest.buff(Renew) & lowest.health <= UI(m_Ren) & !toggle(xDPS)', 'lowest'},
	--Flash Heal charge Dump if Surge of Light duration is less or equal to 3 seconds and moving
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	--Flash Heal when Surge of Light is active, Lowest Health is below or if UI value.
	{'Flash Heal', 'player.buff(Surge of Light) & lowest.health <= UI(m_FH)', 'lowest'},
	--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'/cast [@player] Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player'},
	--Body and Mind if player is moving for 2 seconds or longer and Missing Body and Mind and if UI enables it.
	{'!Body and Mind', 'player.movingfor >= 2 & !player.buff(Body And Mind) & UI(m_Body)', 'player'},
	--Holy Nova if player and 4 or more others at 10yds are below or if 90% health.
	{'Holy Nova', 'player.area(10, 99).heal >= 4 & !player.area(10, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS) & !lowest.health <= UI(l_FH) & !player.channeling(Divine Hymn)', 'player'},
	-- Full DPS when activated.
	{FullDPS, 'toggle(xDPS) & target.range <= 40'},
}

local inCombat = {
	{Potions},
	{Trinkets, '!player.channeling(Divine Hymn)'},
	{Keybinds, '!player.channeling(Divine Hymn)'},
	{'%dispelall', 'toggle(disp) & !player.channeling(Divine Hymn) & spell(Purify).cooldown = 0'},
	{'Desperate Prayer', 'UI(c_DP) & player.health <= UI(c_DPspin) & !player.buff(Guardian Spirit)', 'player'},
	{'!Divine Hymn', 'player.buff(Divinity) & !player.spell(Prayer of Mending).cooldown = 0 & !player.channeling(Divine Hymn) & player.area(40,60).heal >= UI(DH_spin) & UI(DH)'},
	--Fade when you get aggro.
	{'fade', 'aggro & !player.channeling(Divine Hymn)'},
	 --Guardian Spirit if lowest health is below or if UI value and checked.
	{'!Guardian Spirit', 'UI(c_GSt) & {tank1.health <= UI(c_GSspint) || player.health <= UI(c_GSspint)} & !player.channeling(Divine Hymn)', 'tank1'},
	{'!Guardian Spirit', 'UI(c_GSt) & {tank2.health <= UI(c_GSspint) || player.health <= UI(c_GSspint)} & !player.channeling(Divine Hymn)', 'tank2'},
	{'!Guardian Spirit', 'UI(c_GS) & lowest.health <= UI(c_GSspin)  & !player.channeling(Divine Hymn)', 'lowest'},
	--Light of T'uure if lowest health is below or if UI value and checked.
	{'Light of T\'uure', 'UI(c_lot1) & player.spell(Light of T\'uure).charges = 2 & !lowest.health <= 40 & !tank.buff(Light of T\'uure) & !player.channeling(Divine Hymn)', 'tank'},
	{'!Light of T\'uure', 'UI(c_LoTt) & tank1.health <= UI(c_LoTspint) & !player.channeling(Divine Hymn) & !tank1.buff(Light of T\'uure) & !tank1.buff(Guardian Spirit)', 'tank1'},
	{'!Light of T\'uure', 'UI(c_LoTt) & tank2.health <= UI(c_LoTspint) & !player.channeling(Divine Hymn) & !tank2.buff(Light of T\'uure) & !tank2.buff(Guardian Spirit)', 'tank2'},
	{'!Light of T\'uure', 'UI(c_LoT) & lowest.health <= UI(c_LoTspin) & !player.channeling(Divine Hymn) & !lowest.buff(Light of T\'uure) & !lowest.buff(Guardian Spirit)', 'lowest'},
	{'Arcane Torrent', 'player.mana < 97', 'player'},
	{'!Holy Word: Chastise', 'toggle(interrupts) & target.interruptAt(70) & target.range <= 30 & !lowest.health <= 40', 'target'},
	--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
	{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS) & !player.channeling(Divine Hymn)'},
	--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
	{'Divine Star', 'talent(6,2) & player.area(24, 95).heal.infront >= 3 & toggle(AOE)'},
	--Holy Word: Sanctify if lowest and 3 or more others at 40yds are below or if 80% health and if unlocked with advanced.
	{'!Holy Word: Sanctify', 'lowestpredicted.area(10, 85).heal >= 4 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestpredicted.debuff(Ignite Soul) & !player.buff(Divinity)','lowestpredicted.ground'},
	--Circle of healing if lowest and 4 or more others at 30yds are below or if 85% health.
	{'Circle of Healing', 'lowest.area(30, 85).heal >= 4 & toggle(AOE) & talent(7,3) & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowest.debuff(Ignite Soul)', 'lowest'},
	--Prayer of Healing if lowest and 4 or more others at 20yds are below or if 65% health
	{'Holy Word: Serenity',  'lowestpredicted.area(20, 85).heal >= 4 & toggle(AOE) & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestpredicted.debuff(Ignite Soul) & !player.buff(Divinity) & player.buff(Power of the Naaru)' , 'lowestpredicted'},
	--Prayer of Healing if lowest and 4 or more others are below or if 65% health
	{'Prayer of Healing', 'lowestpredicted.area(40, 85).heal >= 4 & toggle(AOE) & !tank.health <= 40 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestpredicted.debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown = 0', 'lowestpredicted'},
	{Moving, 'moving & !player.channeling(Prayer of Healing) & !player.channeling(Divine Hymn)'},
	{{
		{Lowestpred, 'lowestpredicted.health < 100 & !toggle(xDPS) & !lowestpredicted.debuff(Ignite Soul)'},
		{Tankpred, 'tank.health < 100 & !toggle(xDPS) & !tank.debuff(Ignite Soul)'},
		{Playerpred, 'player.health < 100 & !toggle(xDPS) & !player.debuff(Ignite Soul)'},
		{FullDPS, 'toggle(xDPS) & target.range <= 40'},
		{DPS, 'lowest.health > 90 & !toggle(xDPS)'},
	}, '!moving & !player.channeling(Divine Hymn) & !player.channeling(Prayer of Healing) & partycheck=3'},
	{{
		{Lowest, 'lowest.health < 100 & !toggle(xDPS) & !lowest.debuff(Ignite Soul)'},
		{Tank, 'tank.health < 100 & !toggle(xDPS) & !tank.debuff(Ignite Soul)'},
		{Player, 'player.health < 100 & !toggle(xDPS) & !player.debuff(Ignite Soul)'},
		{FullDPS, 'toggle(xDPS) & target.range <= 40'},
		{DPS, 'lowest.health > 90 & !toggle(xDPS)'},
	}, '!moving & !player.channeling(Divine Hymn) & !player.channeling(Prayer of Healing) & !partycheck=3'},
	{'smite', 'target.infront', 'target'},
}

local outCombat = {
	{Keybinds, '!player.channeling(Divine Hymn)'},
	-- Potion of Prolonged Power usage before pull if enabled in UI.
	{'#142117', 'pull_timer <= 3 & UI(s_PPull)'},
	{'Renew', '!tank.buff(Renew) & pull_timer <= gcd & UI(pull_Ren)', 'tank'},
	{'Prayer of Mending', 'tank1.buff(Prayer of Mending).count = 5 & !tank2.buff(Prayer of Mending).count = 5 & UI(pull_PoM)', 'tank2'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending).count = 5 & tank2.buff(Prayer of Mending).count = 5  & UI(pull_PoM)', 'tank1'},
	{'Prayer of Mending', 'tank1.buff(Prayer of Mending).count = 5 & !tank1.buff(Prayer of Mending).count = 10 & UI(pull_PoM)', 'tank1'},
    {'Prayer of Mending', 'tank2.buff(Prayer of Mending).count = 5 & !tank2.buff(Prayer of Mending).count = 10 & UI(pull_PoM)', 'tank2'},
    {'Prayer of Mending', 'tank1.buff(Prayer of Mending).count = 10 & tank1.buff(Prayer of Mending).duration <= 5 & UI(pull_PoM)', 'tank1'},
    {'Prayer of Mending', 'tank2.buff(Prayer of Mending).count = 10 & tank2.buff(Prayer of Mending).duration <= 5 & UI(pull_PoM)', 'tank2'},

	{'Prayer of Mending', '!tank1.buff(Prayer of Mending).count = 5 & pull_timer <= 20 & UI(pull_PoM)', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending).count = 5 & pull_timer <= 20 & UI(pull_PoM)', 'tank2'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending).count = 10 & pull_timer <= 20 & UI(pull_PoM)', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending).count = 10 & pull_timer <= 20 & UI(pull_PoM)', 'tank2'},
	{'!Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	{'Renew', '!lowest.buff(Renew) & lowest.health < 100', 'lowest'},
	--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'/cast [@player] Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF) & !inareaid = 1040', 'player'},
	--Body and Mind if player is moving for 2 seconds or longer and Missing Body and Mind and if UI enables it.
	{'Body and Mind', 'player.movingfor >= 2 & !player.buff(Body And Mind) & UI(m_Body) & !inareaid = 1040', 'player'},
	{'%ressdead(Resurrection)', 'UI(rezz)'},
}

NeP.CR:Add(257, {
	name = '|cffFACC2E [Yobleed]|r Priest - |cffFACC2EHoly|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
