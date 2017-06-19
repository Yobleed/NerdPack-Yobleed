local GUI = {
	-- GUI Header 
	{type = "texture",
	texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\holy.blp",
	width = 512, 
	height = 256, 
	offset = 90, 
	y = 42, 
	center = true},

	{type = 'checkbox', text = 'Healing OOC', key = 'ooc_heal', width = 55, default = false},
	{type = 'checkbox', text = 'Mythic+ Healing', key = 'myth_heal', width = 55, default = false},
	
    --KEYBINDS
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'text', text = 'Left Shift: AoE Top Up|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Top Up', key = 'k_HWS', width = 55, default = false},
	{type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', width = 55, default = false},
	{type = 'checkbox', text = 'Pause', key = 'k_P', width = 55, default = false},
	{type = 'ruler'},{type = 'spacer'},
	
	--DPS
	{type = 'header', text = 'Extra DPS', align = 'center'},
	{type = 'text', text = 'Check to enable extra DPS', align = 'center'},
	{type = 'checkbox', text = 'Holy Word: Chastise', key = 'd_HWC', width = 55, default = false},
	{type = 'checkbox', text = 'Holy Fire', key = 'd_HF', width = 55, default = false},
	{type = 'checkbox', text = 'Holy Nova', key = 'd_nova', width = 55, default = false},
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

	--TRINKETS
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', width = 55, default = false},
	{type = 'checkbox', text = 'Bottom Trinket', key = 'trinket_2', width = 55, default = false},
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
	{type = 'ruler'},{type = 'spacer'},

	--LOWEST
	{type = 'header', text = 'Lowest', align = 'center'},
	{type = 'text', text = 'Lowest health values', align = 'center'},
	{type = 'spinner', text = 'Holy Word: Serenity', key = 'l_HWSE', width = 55, default = 60},
	{type = 'spinner', text = 'Flash Heal', key = 'l_FH', width = 55, default = 85},
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
	{'#trinket1', 'UI(trinket_1) & !player.channeling(Divine Hymn) & player.area(15,85).heal >= 4'}, --Preserved Cake
	--Bottom Trinket usage if UI enables it.
	{'#trinket2', 'UI(trinket_2)'},
}

local Keybinds = {
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD) & !advanced', 'cursor.ground'},
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
	{'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 6 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
	{'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 5 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
	{'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 4 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
	{'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 3 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
	{'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 2 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
	{'!Holy Word: Sanctify', '!player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced', 'tank.ground'},
	{'!Holy Word: Sanctify', '!player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS)', 'cursor.ground'},
	{'Prayer of Healing', 'player.area(10,85).heal >= 4 & keybind(lshift) & UI(k_HWS) & !advanced & player.buff(Power of the Naaru)' , 'lowestp'},
	{'Prayer of Healing', 'player.area(20,85).heal >= 4 & keybind(lshift) & UI(k_HWS) & !advanced & player.buff(Power of the Naaru)' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(10, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(20, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(30, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(40, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(20, 99).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(30, 99).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(40, 99).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
	{'Prayer of Healing', 'lowestp.health <= 100 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru)' , 'lowestp'},
	{'%pause', 'keybind(lalt)& UI(k_P)'},
}

local Potions = {
	{'#Healthstone', 'UI(p_HS) & player.health <= UI(p_HSspin) & !player.channeling(Divine Hymn)'},
	{'#Ancient Healing Potion', 'UI(p_AHP) & player.health <= UI(p_AHPspin) & !player.channeling(Divine Hymn)'},
	{'#Ancient Mana Potion', 'UI(p_AMP) & player.mana <= UI(p_AMPspin) & !player.channeling(Divine Hymn)'},
}


local DPS = {
	{'Holy Word: Chastise', ' {UI(d_HWC) & !equipped(132445) & target.range <= 30 & target.infront} || {UI(d_HWC) & equipped(132445) & player.buff(Al\'maiesh, the Cord of Hope).count = 5 & target.range <= 30 & target.infront}' , 'target'}, 
	{'Holy Fire', 'UI(d_HF) & target.infront' , 'target'},
	{'Holy Nova', 'player.area(10).enemies >= 2 & UI(d_nova)', 'player'},
	{'Holy Nova', 'player.moving & UI(d_nova) & target.range <= 10'},
	{'Smite', 'target.infront', 'target'},
}

local FullDPS = {
	{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
	{'!Holy Word: Serenity', 'player.health <= UI(full_HWSE)', 'player'},
	{'Flash Heal', 'player.health <= UI(full_FH)', 'player'},
	{'Holy Word: Chastise', ' {!equipped(132445) & target.range <= 30} || {equipped(132445) & player.buff(Al\'maiesh, the Cord of Hope).count = 5 & target.range <= 30}' , 'target'},
	{'Holy Nova', 'player.area(10).enemies >= 4 & toggle(AOE)', 'player'},
	{'Holy Fire', '!moving', 'target'},
	{'Smite', nil, 'target'},
}


local Tankpred = {
	{'!Holy Word: Serenity', 'tank1.health.predicted <= UI(t_HWSE) & !player.buff(Divinity)', 'tank1'},
	{'!Holy Word: Serenity', 'tank2.health.predicted <= UI(t_HWSE) & !player.buff(Divinity)', 'tank2'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending) & !lowest.health <= 40', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending) & !lowest.health <= 40', 'tank2'},
	{'Prayer of Mending', 'tank1.buff(Prayer of Mending).duration < tank2.buff(Prayer of Mending).duration & !lowest.health <= 40', 'tank1'},
	{'Prayer of Mending', 'tank2.buff(Prayer of Mending).duration < tank1.buff(Prayer of Mending).duration & !lowest.health <= 40', 'tank2'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending).count > 5 & !lowest.health <= 40', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending).count > 5 & !lowest.health <= 40', 'tank2'},
	{'Flash Heal', 'tank1.health.predicted <= UI(t_FH)', 'tank1'},
	{'Flash Heal', 'tank2.health.predicted <= UI(t_FH)', 'tank2'},
	{'Renew', '!tank1.buff(Renew) & tank1.health.predicted <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank1'},
	{'Renew', '!tank2.buff(Renew) & tank2.health.predicted <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank2'},
}

local Tank = {
	{'!Holy Word: Serenity', 'tank1.health <= UI(t_HWSE) & !player.buff(Divinity)', 'tank1'},
	{'!Holy Word: Serenity', 'tank2.health <= UI(t_HWSE) & !player.buff(Divinity)', 'tank2'},
	{'Flash Heal', 'tank1.health <= UI(t_FH)', 'tank1'},
	{'Flash Heal', 'tank2.health <= UI(t_FH)', 'tank2'},
	{'Renew', '!tank1.buff(Renew) & tank.health <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank1'},
	{'Renew', '!tank2.buff(Renew) & tank.health <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank2'},
}   

local Playerpred = {
	{'!Holy Word: Serenity', 'player.health.predicted <= UI(p_HWSE) & !player.buff(Divinity) & !player.spell(Desperate Prayer).cooldown = 0', 'player'},
	{'!Gift of the Naaru', 'player.health.predicted <= UI(p_Gift)', 'player'},
	{'Flash Heal', 'player.health.predicted <= UI(p_FH)', 'player'},
}

local Player = {
	{'!Holy Word: Serenity', 'player.health <= UI(p_HWSE) & !player.buff(Divinity) & !player.spell(Desperate Prayer).cooldown = 0', 'player'},
	{'!Gift of the Naaru', 'player.health <= UI(p_Gift)', 'player'},
	{'Flash Heal', 'player.health <= UI(p_FH)', 'player'},
}

local Lowestpred = { --((LATEST NeP Update uses lowestp(unit) or lowestp instead of Lowestpredicted))
	{'!Holy Word: Serenity', 'lowestp.health <= UI(l_HWSE) & !player.buff(Divinity)', 'lowestp'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending) & tank1.health < tank2.health & !lowest.health <= 40', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending) & !lowest.health <= 40 & tank2.health < tank1.health', 'tank2'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending).count > 5 & !lowest.health <= 40 & tank1.health < tank2.health', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending).count > 5 & !lowest.health <= 40 & tank2.health < tank1.health', 'tank2'},

	{'Prayer of Mending', '!lowestp.buff(Prayer of Mending) & !lowest.health <= 40', 'lowestp'},
	{'Prayer of Mending', '!lowestp.buff(Prayer of Mending).count > 5 & !lowest.health <= 40', 'lowestp'},
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowestp.health < 100', 'lowestp'},
	{'!Gift of the Naaru', 'lowestp.health <= 20 & lowestp.buff(Guardian Spirit)', 'lowestp'},
	{'Flash Heal', 'lowestp.health <= UI(l_FH)', 'lowestp'},
	{'Heal', 'lowestp.health <= UI(l_H) & !lowestp.debuff(Fragile Echo)', 'lowestp'},
}

local Lowest = {
	{'!Holy Word: Serenity', 'lowest.health <= UI(l_HWSE) & !player.buff(Divinity)', 'lowest'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending) & !lowest.health <= 40', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending) & !lowest.health <= 40', 'tank2'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending).count > 5 & !lowest.health <= 40', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending).count > 5 & !lowest.health <= 40', 'tank2'},
	{'Prayer of Mending', '!lowestp.buff(Prayer of Mending) & !lowest.health <= 40', 'lowestp'},
	{'Prayer of Mending', '!lowestp.buff(Prayer of Mending).count > 5 & !lowest.health <= 40', 'lowestp'},
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	{'!Gift of the Naaru', 'lowest.health <= 20 & lowest.buff(Guardian Spirit)', 'lowest'},
	{'Flash Heal', 'lowest.health <= UI(l_FH)', 'lowest'},
	{'Heal', 'lowest.health <= UI(l_H) & !lowest.debuff(Fragile Echo)', 'lowest'},
}

local Moving = {
	{'!Gift of the Naaru', 'lowest.health <= 20 & lowest.buff(Guardian Spirit)', 'lowest'},
	{'!Holy Word: Serenity', 'lowest.health <= UI(m_HWSE) & !player.buff(Divinity)', 'lowest'},
	{'Renew', '!lowest.buff(Renew) & lowest.health <= UI(m_Ren) & !toggle(xDPS) & !player.buff(Spirit of Redemption)', 'lowest'},
	{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	{'Flash Heal', 'player.buff(Surge of Light) & lowest.health <= UI(m_FH)', 'lowest'},
	{'/cast [@player] Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player'},
	{'!Body and Mind', 'player.movingfor >= 2 & !player.buff(Body And Mind) & UI(m_Body)', 'player'},
	{FullDPS, 'toggle(xDPS) & target.range <= 40'},
}

local PoMooc = {
    {'Prayer of Mending', '!tank.buff(Prayer of Mending) & pull_timer <= 20', 'tank'},
	{'Prayer of Mending', '!tank1.buff(Prayer of Mending) & tank2.buff(Prayer of Mending) & UI(pull_PoM) & partycheck = 3', 'tank1'},
	{'Prayer of Mending', '!tank2.buff(Prayer of Mending) & tank1.buff(Prayer of Mending) & UI(pull_PoM) & partycheck = 3', 'tank2'},
	{'Prayer of Mending', 'tank1.buff(Prayer of Mending).duration < tank2.buff(Prayer of Mending).duration & UI(pull_PoM) & partycheck = 3', 'tank1'},
	{'Prayer of Mending', 'tank2.buff(Prayer of Mending).duration < tank1.buff(Prayer of Mending).duration & UI(pull_PoM) & partycheck = 3', 'tank2'},
	{'Prayer of Mending', 'tank1.buff(Prayer of Mending).duration > player.buff(Prayer of Mending).duration & UI(pull_PoM)', 'player'},
	{'Prayer of Mending', 'tank2.buff(Prayer of Mending).duration > player.buff(Prayer of Mending).duration & UI(pull_PoM)', 'player'},
	{'Prayer of Mending', 'player.buff(Prayer of Mending).duration > tank1.buff(Prayer of Mending).duration & UI(pull_PoM)', 'tank1'},
	{'Prayer of Mending', 'player.buff(Prayer of Mending).duration > tank2.buff(Prayer of Mending).duration & UI(pull_PoM)', 'tank2'},
}

local GrievousWound = {
    {'Prayer of Mending', 'tank.buff(Prayer of Mending).count <= 5 & lowest.health > 95', 'tank'},
    {'renew', 'lowest.health < 100 & lowest.health > 90 & !lowest.buff(renew)', 'lowest'},
	{'!Holy Word: Serenity', 'lowest.health <= UI(l_HWSE)', 'lowest'},
	{'!Gift of the Naaru', 'lowest.health <= 40', 'lowest'},
	{'Flash Heal', 'lowest.health <= 90', 'lowest'},
	{'Heal', 'lowest.health <= 95', 'lowest'},
	{'renew', 'lowest.health < 100 & !lowest.buff(renew)', 'lowest'},
	
}

local inCombat = {
	{{ {Potions},
	{Trinkets, '!player.channeling(Divine Hymn)'},
	{Keybinds, '!player.channeling(Divine Hymn)'},
	{'%dispelall', 'toggle(disp) & !player.channeling(Divine Hymn) & spell(Purify).cooldown = 0'},
	{'Desperate Prayer', 'UI(c_DP) & player.health <= UI(c_DPspin) & !player.buff(Guardian Spirit) & !player.channeling(Divine Hymn) ', 'player'},
	{'!Divine Hymn', 'player.buff(Divinity) & !player.spell(Prayer of Mending).cooldown = 0 & !player.channeling(Divine Hymn) & player.area(40,60).heal >= UI(DH_spin) & UI(DH)'},
	{'!Holy Word: Chastise', 'toggle(interrupts) & target.interruptAt(70) & target.range <= 30 & !player.channeling(Divine Hymn)', 'target'},
	{'fade', 'player.aggro & !player.channeling(Divine Hymn)'},
	{'!Guardian Spirit', 'UI(c_GSt) & {tank1.health <= UI(c_GSspint) || player.health <= UI(c_GSspint)} & !player.channeling(Divine Hymn)', 'tank1'},
	{'!Guardian Spirit', 'UI(c_GSt) & {tank2.health <= UI(c_GSspint) || player.health <= UI(c_GSspint)} & !player.channeling(Divine Hymn)', 'tank2'},
	{'!Guardian Spirit', 'UI(c_GS) & lowest.health <= UI(c_GSspin)  & !player.channeling(Divine Hymn)', 'lowest'},
	{'Arcane Torrent', 'player.mana < 97 & !player.channeling(Divine Hymn) ', 'player'},
	{'!Holy Word: Sanctify', 'tank.area(10, 85).heal >= 6 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','tank.ground'},
	{'!Holy Word: Sanctify', 'lowest.area(10, 85).heal >= 6 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowest.ground'},
	{'!Holy Word: Sanctify', 'lowest.area(10, 85).heal >= 5 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowest.ground'},
	{'!Holy Word: Sanctify', 'lowest.area(10, 85).heal >= 4 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowest.ground'},
	{'!Holy Word: Sanctify', 'lowest.area(10, 85).heal >= 3 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity) & partycheck = 2','lowest.ground'},
	{'Prayer of Healing', 'lowestp.area(10, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(15, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(20, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(25, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(30, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(10, 85).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown = 0 & partycheck=3', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(15, 85).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown = 0 & partycheck=3', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(20, 85).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown = 0 & partycheck=3', 'lowestp'},
	{'Prayer of Healing', 'lowest.area(40, 85).heal >= 4 & toggle(AOE) & !tank.health <= 40 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowest.debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown = 0 & !partycheck=3', 'lowest'},
	{'Light of T\'uure', 'UI(c_lot1) & player.spell(Light of T\'uure).charges = 2 & !lowest.health <= 40 & !tank.buff(Light of T\'uure) & !player.channeling(Divine Hymn) & !tank.buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift)', 'tank'},
	{'Light of T\'uure', 'UI(c_LoTt) & tank1.health <= UI(c_LoTspint) & !player.channeling(Divine Hymn) & !tank1.buff(Light of T\'uure) & !tank1.buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift)', 'tank1'},
	{'Light of T\'uure', 'UI(c_LoTt) & tank2.health <= UI(c_LoTspint) & !player.channeling(Divine Hymn) & !tank2.buff(Light of T\'uure) & !tank2.buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift)', 'tank2'},
	{'Light of T\'uure', 'UI(c_LoT) & lowest.health <= UI(c_LoTspin) & !player.channeling(Divine Hymn) & !lowest.buff(Light of T\'uure) & !lowest.buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift)', 'lowest'},
	{Moving, 'moving & !player.channeling(Prayer of Healing) & !player.channeling(Divine Hymn)'},},'!player.channeling(Divine Hymn)'}, 
	{{
	    {Playerpred, 'player.health < 100 & !toggle(xDPS) & !player.debuff(Ignite Soul) & !player.buff(Spirit of Redemption) & !tank.health.predicted <= 40'},
		{Lowestpred, 'lowestp.health < 100 & !toggle(xDPS) & !lowestp.debuff(Ignite Soul)'},
		{Tankpred, 'tank.health < 100 & !toggle(xDPS) & !tank.debuff(Ignite Soul)'},
		{FullDPS, 'toggle(xDPS) & target.range <= 40 & target.infront'},
	}, '!moving & !player.channeling(Divine Hymn) & !player.channeling(Prayer of Healing) & partycheck=3'},
	{{   
	    {GrievousWound, 'ldebuff(Grievous Wound) || {UI(myth_heal) & !player.channeling(Divine Hymn)}'}, --Mythic +
	    {Player, 'player.health < 100 & !toggle(xDPS) & !player.debuff(Ignite Soul) & !player.buff(Spirit of Redemption) & !tank.health <= 40'},
		{Lowest, 'lowest.health < 100 & !toggle(xDPS) & !lowest.debuff(Ignite Soul)'},
		{Tank, 'tank.health < 100 & !toggle(xDPS) & !tank.debuff(Ignite Soul)'},
		{FullDPS, 'toggle(xDPS) & target.range <= 40 & target.infront'},
	}, '!moving & !player.channeling(Divine Hymn) & !player.channeling(Prayer of Healing) & !partycheck=3'},
	{'Flash Heal', 'lowestp.health < 100 & player.buff(SpiritofRedemption)', 'lowestp'},
	{DPS, '!toggle(xDPS)'},
	{'smite', 'target.infront', 'target'}, 
} 

local outCombat = {
	{Keybinds, '!player.channeling(Divine Hymn)'},
	{'#Potion of Prolonged Power', 'pull_timer <= 3 & UI(s_PPull)'}, --Potion of Prolonged Power
	{'Renew', '!tank.buff(Renew) & pull_timer <= gcd & UI(pull_Ren) & !player.buff(Spirit of Redemption)', 'tank'},
	{PoMooc}, 
	{{{PoMooc},}, 'pull_timer <= 20'},
	{'!Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & lowest.health < 100', 'lowest'},
	{'Renew', '!lowest.buff(Renew) & lowest.health < 100 & !player.buff(Spirit of Redemption) & moving', 'lowest'},
	{'!Holy Word: Sanctify', 'tank.area(10, 85).heal >= 6 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','tank.ground'},
	{'!Holy Word: Sanctify', 'lowestp.area(10, 85).heal >= 6 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowestp.ground'},
	{'!Holy Word: Sanctify', 'lowestp.area(10, 85).heal >= 4 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowestp.ground'},
	{'Prayer of Healing', 'lowestp.area(10, 90).heal >= 4 & toggle(AOE) & !tank.health <= 40 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(20, 90).heal >= 4 & toggle(AOE) & !tank.health <= 40 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(30, 90).heal >= 4 & toggle(AOE) & !tank.health <= 40 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(40, 90).heal >= 4 & toggle(AOE) & !tank.health <= 40 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & partycheck=3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
	{'Prayer of Healing', 'lowestp.area(20, 85).heal >= 4 & toggle(AOE) & !tank.health <= 40 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown = 0 & partycheck=3', 'lowestp'},
	{GrievousWound, '{lowest.health <= 95 & UI(ooc_heal)} || {UI(myth_heal) & !player.channeling(Divine Hymn)}'},
	{'/cast [@player] Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF) & !inareaid = 1040', 'player'},
	{'Body and Mind', 'player.movingfor >= 2 & !player.buff(Body And Mind) & UI(m_Body) & !inareaid = 1040', 'player'},
}

NeP.CR:Add(257, {
	name = '|cffFACC2E [Yobleed]|r Priest - |cffFACC2EHoly|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
