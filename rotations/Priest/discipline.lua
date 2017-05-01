local GUI = {
	-- GUI Header 
	{type = "texture",
	texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\disc.blp",
	width = 512, 
	height = 256, 
	offset = 90, 
	y = 42, 
	center = true},

	--Cooldowns
	{type = 'header', text = 'Cooldowns when toggled on', align = 'center'},
	{type = 'checkbox', text = 'Use Pain Suppression on tank', key = 'c_PSt', width = 55, default = false},
	{type = 'checkbox', text = 'Use Pain Suppression on lowest', key = 'c_PSl', width = 55, default = false},
	{type = 'checkbox', text = 'Use Light\'s Wrath', key = 'LW', width = 55, default = false},
	{type = 'spinner', text = 'LW Atonements', key = 'ato_LW', width = 55, step = 1, max = 20, default = 5},
    {type = 'ruler'},{type = 'spacer'},

	-- GUI Moving
	{type = 'header', text = 'Movement', align = 'center'},
	{type = 'checkbox', text = 'Angelic Feather', key = 'm_AF', width = 55, default = false},
	{type = 'checkbox', text = 'Body and Soul', key = 'm_Body', width = 55, default = false},
	{type = 'ruler'}, {type = 'spacer'},

	--Resurrection
	{type = 'header', text = 'Ressurection', align = 'center'},
	{type = 'checkbox', text = 'Auto Ress out of combat', key = 'rezz', width = 55, default = false},
	{type = 'ruler'},{type = 'spacer'},

	--TRINKETS
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', width = 55, default = false},
	{type = 'checkbox', text = 'Bottom Trinket', key = 'trinket_2', width = 55, default = false},
	{type = 'ruler'},{type = 'spacer'},

	--KEYBINDS
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'text', text = 'Left Shift: Power Word: Barrier|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Power Word: Barrier', key = 'k_PWB', width = 55, default = false},
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
	{type = 'text', text = 'Before Pull.', align = 'center'},
	{type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_PPull', width = 55, default= false},
	{type = 'checkbox', text = 'Power Word: Radiance', key = 'PWR_PPull', width = 55, default= false},
	{type = 'ruler'}, {type = 'spacer'},

	--Solo
	{type = 'header', text = 'Solo mode', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Gift of the Naaru', key = 'full_Gift', width = 55, default = 20},
	{type = 'spinner', text = 'Shadow Mend', key = 'full_mend', width = 55, default = 40},
	{type = 'spinner', text = 'Power Word: Shield', key = 'full_PWS', width = 55, default = 70},
	{type = 'ruler'},{type = 'spacer'},

	--TANK
	{type = 'header', text = 'Tank', align = 'center'},
	{type = 'text', text = 'Tank health values', align = 'center'},
	{type = 'spinner', text = 'Light\'s Wrath', key = 't_LW', width = 55, default = 50},
	{type = 'spinner', text = 'LW Atonements', key = 'tato_LW', width = 55, step = 1, max = 20, default = 5},
	{type = 'spinner', text = 'Shadow Mend', key = 't_mend', width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 't_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},

    --PLAYER
	{type = 'header', text = 'Player', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Light\'s Wrath', key = 'p_LW', width = 55, default = 50},
	{type = 'spinner', text = 'LW Atonements', key = 'pato_LW', width = 55, step = 1, max = 20, default = 5},
	{type = 'spinner', text = 'Power Word: Shield', key = 'p_PWS', width = 55, default = 90},
	{type = 'spinner', text = 'Shadow Mend', key = 'p_mend', width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 'p_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},

	--LOWEST
	{type = 'header', text = 'Lowest', align = 'center'},
	{type = 'text', text = 'Lowest health values', align = 'center'},
	{type = 'spinner', text = 'Light\'s Wrath', key = 'l_LW', width = 55, default = 50},
	{type = 'spinner', text = 'LW Atonements', key = 'lato_LW', width = 55, step = 1, max = 20, default = 5},
	{type = 'spinner', text = 'Power Word: Shield', key = 'l_PWS', width = 55, default = 90},
	{type = 'spinner', text = 'Shadow Mend', key = 'l_mend', width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 'l_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff58FAF4 ----------------------------------------------------------------------|r')
	print('|cff58FAF4 --- |rPriest: |cff58FAF4DISCIPLINE|r')
	print('|cff58FAF4 --- |rRecommended Talents: 1/3 or 1/2 - 2/2 or 2/1 - 3/1 - 4/2 or 4/3 - 5/2 or 5/3 - 6/2 or 6/3 - 7/1 or 7/2')
	print('|cff58FAF4 ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		key = 'xDPS',
		name = 'Solo',
		text = 'ON/OFF Solo rotation',
		icon = 'Interface\\ICONS\\ability_priest_darkarchangel', --toggle(xDPS)
	})

	NeP.Interface:AddToggle({
		key = 'disp',
		name = 'Dispell',
		text = 'ON/OFF Dispel All',
		icon = 'Interface\\ICONS\\spell_holy_dispelmagic', --toggle(disp)
	})

	NeP.Interface:AddToggle({
		key = 'ramp',
		name = 'Spike Damage',
		text = 'ON/OFF Ramping up Atonements for incoming spike damage',
		icon = 'Interface\\ICONS\\ability_mage_massinvisibility', --toggle(ramp)
	})

	NeP.Interface:AddToggle({
		key = 'ato',
		name = 'OOC Atonements',
		text = 'ON/OFF Keeping up Atonements Out of Combat',
		icon = 'Interface\\ICONS\\ability_priest_atonement', --toggle(ato)
	})

	NeP.Interface:AddToggle({
		key = 'ooc_heal',
		name = 'OOC Healing',
		text = 'ON/OFF Out of Combat Healing',
		icon = 'Interface\\ICONS\\spell_priest_plea_yellow', --toggle(ooc_heal) 
	})
end

local Rapture = {
	--Power Word: Shield on CD.
	{'Power Word: Shield', '!tank.buff(Power Word: Shield)', 'tank'},
	{'Power Word: Shield', '!lowest.buff(Power Word: Shield)', 'lowest'},
	{'Power Word: Shield', '!lowest1.buff(Power Word: Shield)', 'lowest1'},
	{'Power Word: Shield', '!lowest2.buff(Power Word: Shield)', 'lowest2'},
	{'Power Word: Shield', '!lowest3.buff(Power Word: Shield)', 'lowest3'},
	{'Power Word: Shield', '!lowest4.buff(Power Word: Shield)', 'lowest4'},
	{'Power Word: Shield', '!lowest5.buff(Power Word: Shield)', 'lowest5'},
	{'Power Word: Shield', '!lowest5.buff(Power Word: Shield)', 'lowest6'},
}

local Emergency = {
	--Mana up!
	{'!Power Infusion', 'player.buff(Rapture) & talent(4,2) & player.mana <= 30', 'player'},
	--Power Infusion if PWS and Rapture and Pain Suppression is on CD.
	{'!Power Infusion', 'spell(Power Word: Shield).cooldown > 0 & spell(Rapture).cooldown > 0 & spell(Pain Suppression).cooldown > 0 & tank.health <= 20', 'player'},
	--PWR if in Barrier.
	{'Power Word: Radiance', 'lowest.buff(Power Word: Barrier) & !lowest.buff(Atonement) & lowest.area(6.5, 90).heal >= 2 & !lastcast(Power Word: Radiance)', 'lowest'},
	--PWR if in Barrier non advanced.
	{'Power Word: Radiance', 'lowest.buff(Power Word: Barrier) & !lowest.buff(Atonement) & lowest.health <= UI(l_plea) & !lastcast(Power Word: Radiance) & !advanced', 'lowest'},
	--Mindbender if mana is below or if 90%.
	{'Mindbender', 'talent(4,3) & player.mana <= 90 & toggle(cooldowns)', 'target'},
	--Pain Suppression if tank health is below or equal to 20% and checked.
	{'!Pain Suppression', 'UI(c_PSt) & tank.health <= 20 & toggle(cooldowns)', 'tank'},
	--Pain Suppression if lowest health is below or equal to 20% and checked.
	{'!Pain Suppression', 'UI(c_PSl) & lowest.health <= 20 & toggle(cooldowns)', 'lowest'},
	--Gift of the Naaru if lowest health is below or if 20%.
	{'Gift of the Naaru', 'lowest.health <= 20 & toggle(cooldowns) ', 'lowest'},
}

local Trinkets = {
	--Top Trinket usage if UI enables it.
	{'#trinket1', 'UI(trinket_1)'},
	--Bottom Trinket usage if UI enables it.
	{'#trinket2', 'UI(trinket_2)'},
}

local Keybinds = {
	-- Power Word: Barrier on left shift when checked in UI.
	{'!Power Word: Barrier', 'keybind(lshift) & UI(k_PWB)', 'mouseover.ground'},
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
	-- Power Word: Barrier on left shift when checked in UI.
	{'!Power Word: Barrier', 'keybind(lshift) & UI(k_PWB) & !advanced', 'cursor.ground'},
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD) & !advanced', 'cursor.ground'},
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

local Rampup = {
--Spreading Atonement before DPS if checked.
	{'Power Word: Radiance', '!lowest1.buff(Atonement)', 'lowest1'},
	{'Power Word: Radiance', '!lowest2.buff(Atonement)', 'lowest2'},
	{'Power Word: Radiance', '!lowest3.buff(Atonement)', 'lowest3'},
	{'Power Word: Radiance', '!lowest4.buff(Atonement)', 'lowest4'},
	{'Power Word: Radiance', '!lowest5.buff(Atonement)', 'lowest5'},
	{'Power Word: Radiance', '!lowest6.buff(Atonement)', 'lowest6'},
	{'Power Word: Radiance', '!lowest7.buff(Atonement)', 'lowest7'},
	{'Power Word: Radiance', '!lowest8.buff(Atonement)', 'lowest8'},
}

local Solo = {
	--Plea to keep on Atonement.
	{'Plea', "{!player.buff(Atonement) & player.health < 90} || {!player.buff(Atonement) & spell(Light's Wrath).cooldown = 0}", 'player'},
	--PWS if player health is below or if UI value.
	{'Power Word: Shield', 'Player.Health <= UI(full_PWS)', 'player'},
	--Schism on cooldown.
	{'Schism', "talent(1,3) & {!moving || player.buff(Norgannon's Foresight)}", 'target'},
	--LW.
    {'Light\'s Wrath', 'player.buff(Atonement) & toggle(cooldowns)'}, 
	--PI on CD if toggled.
	{'Power Infusion', 'talent(5,2) & toggle(cooldowns)', 'target'},
	--Shadowfiend on CD if toggled.
	{'Shadowfiend', 'toggle(cooldowns) & !talent(4,3)', 'target'},
	--Shadow Mend if player health is below or if UI value.
	{'Shadow Mend', "player.health <= UI(full_mend) & {!moving || player.buff(Norgannon's Foresight)}", 'player'},
	--Gift of the Naaru if player health is below or if UI value.
	{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
	--Purge the Wicked if talent and not on target.
	{'Purge the Wicked', 'talent(7,1) & !target.debuff(Purge the Wicked)', 'target'},
	--Shadow Word: Pain if not on target.
	{'Shadow Word: Pain', '!talent(7,1) & !target.debuff(Shadow Word: Pain)', 'target'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'target.debuff(Purge the Wicked) || target.debuff(Shadow Word: Pain)', 'target'},
	--Power Word: Solace on cooldown if talent.
	{'Power Word: Solace', 'talent(4,1)', 'target'},
	--Divine Star if mobs are 3 or more.
	{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
	--Divine Star if moving.
	{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 1 & moving'},
	--Smite on CD.
	{'Smite', nil, 'target'},
}

local Atonement = {
    --Lights Wrath on CD if toggled in UI.
    {"Light's Wrath", '{target.debuff(Schism) & target.debuff(Schism).duration >= 3 & spell(plea).count >= UI(ato_LW) & UI(LW)} || {!talent(1,3) & spell(plea).count >= UI(ato_LW) & UI(LW)}', 'target'}, 
	--Shadowfiend on CD if toggled.
	{'Shadowfiend', 'toggle(cooldowns) & !talent(4,3)', 'target'},
	--Purge the Wicked if talent and not on target.
	{'Purge the Wicked', 'talent(7,1) & !target.debuff(Purge the Wicked)', 'target'},
	--Shadow Word: Pain if not on target.
	{'Shadow Word: Pain', '!talent(7,1) & !target.debuff(Shadow Word: Pain)', 'target'},
	--Schism on cooldown.
	{'Schism', "talent(1,3) & {!moving || player.buff(Norgannon's Foresight)}", 'target'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'target.debuff(Purge The Wicked) || target.debuff(Shadow Word: Pain)', 'target'},
	--Power Word: Solace on cooldown if talent.
	{'Power Word: Solace', 'talent(4,1)', 'target'},
	--Divine Star if mobs are 3 or more.
	{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
	--Smite on CD.
	{'Smite', nil, 'target'},
}

local Tank = {
    --better use of Light's Wrath
    {"Light's Wrath", '{toggle(cooldowns) & tank.buff(Atonement) & target.debuff(Schism) & target.debuff(Schism).duration >= 3 & tank.health <= UI(t_LW) & spell(plea).count >= UI(tato_LW)} || {toggle(cooldowns) & tank.buff(Atonement) & !talent(1,3) & tank.health <= UI(t_LW) & spell(plea).count >= UI(tato_LW)}', 'target'},
	--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
	{'Power Word: Shield', '!tank.buff(atonement) || !tank.buff(Power Word: Shield)', 'tank'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'tank.health <= UI(t_mend) & tank.buff(Atonement)', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "tank.health <= UI(t_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'tank'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'tank.health <= UI(t_plea) & !tank.buff(Atonement) & spell(Plea).count < 5 & !player.mana <= 15', 'tank'},
	
}

local Player = {
    --better use of Light's Wrath
    {"Light's Wrath", '{toggle(cooldowns) & player.buff(Atonement) & target.debuff(Schism) & target.debuff(Schism).duration >= 3 & player.health <= UI(p_LW) & spell(plea).count >= UI(pato_LW)} || {toggle(cooldowns) & player.buff(Atonement) & !talent(1,3) & player.health <= UI(p_LW) & spell(plea).count >= UI(pato_LW)}', 'target'},
	--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
	{'Power Word: Shield', 'player.health <= UI(p_PWS) & !player.buff(Power Word: Shield)', 'player'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'player.health <= UI(p_mend) & player.buff(Atonement)', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "player.health <= UI(p_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'player'},
	--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
	{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
	--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
	{'Divine Star', 'talent(6,2) & player.area(24, 90).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'player.health <= UI(p_plea) & !player.buff(Atonement) & spell(Plea).count < 5 & !player.mana <= 15', 'player'},
}

local Lowest = {
    --better use of Light's Wrath
    {"Light's Wrath", '{toggle(cooldowns) & lowest.buff(Atonement) & target.debuff(Schism) & target.debuff(Schism).duration >= 3 & lowest.health <= UI(l_LW) & spell(plea).count >= UI(lato_LW)} || {toggle(cooldowns) & lowest.buff(Atonement) & !talent(1,3) & lowest.health <= UI(l_LW) & spell(plea).count >= UI(lato_LW)}', 'target'},
	--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
	{'Power Word: Shield', 'lowest.health <= UI(l_PWS) & !lowest.buff(Power Word: Shield)', 'lowest'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'lowest.health <= UI(l_mend) & lowest.buff(Atonement) & !lowest.health <= 30', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "lowest.health <= UI(l_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'lowest'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'lowest.health <= UI(l_plea) & !lowest.buff(Atonement) & spell(Plea).count < 5 &  !player.mana <= 15', 'lowest'},
	--Power Word: Shield on CD if not Atonement on 6 people max.
	{'Power Word: Shield', '!lowest1.buff(Atonement) & spell(Plea).count >= 5', 'lowest1'},
	{'Power Word: Shield', '!lowest2.buff(Atonement) & spell(Plea).count >= 5', 'lowest2'},
	{'Power Word: Shield', '!lowest3.buff(Atonement) & spell(Plea).count >= 5', 'lowest3'},
	{'Power Word: Shield', '!lowest4.buff(Atonement) & spell(Plea).count >= 5', 'lowest4'},
	{'Power Word: Shield', '!lowest5.buff(Atonement) & spell(Plea).count >= 5', 'lowest5'},
	--Plea to aplly Atonement if lowest is above mend value and below plea value in UI and lowest missing atonement.
	{'Plea', 'lowest1.health > UI(l_mend) & lowest1.health <= UI(l_plea) & !lowest1.buff(Atonement) & spell(Plea).count <= 5 & !player.mana <= 15', 'lowest1'},
	{'Plea', 'lowest2.health > UI(l_mend) & lowest2.health <= UI(l_plea) & !lowest2.buff(Atonement) & spell(Plea).count <= 5 & !player.mana <= 15', 'lowest2'},
	{'Plea', 'lowest3.health > UI(l_mend) & lowest3.health <= UI(l_plea) & !lowest3.buff(Atonement) & spell(Plea).count <= 5 & !player.mana <= 15', 'lowest3'},
	{'Plea', 'lowest4.health > UI(l_mend) & lowest4.health <= UI(l_plea) & !lowest4.buff(Atonement) & spell(Plea).count <= 5 & !player.mana <= 15', 'lowest4'},
	{'Plea', 'lowest5.health > UI(l_mend) & lowest5.health <= UI(l_plea) & !lowest5.buff(Atonement) & spell(Plea).count <= 5 & !player.mana <= 15', 'lowest5'},
}

local Moving = {
	--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'/cast [@player] Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player'},
	-- Body and Soul usage if enabled in UI.
	{'Power Word: Shield', 'talent(2,2) & !player.buff(Body and Soul) & player.movingfor >= 1 & UI(m_Body) & !player.channeling(Penance) & !player.buff(Speed of the Pious)', 'player'},
}

local inCombat = {
	{Potions},
	{Emergency},
	{'%dispelall', '{toggle(disp) & spell(Purify).cooldown = 0 & tank.health > UI(t_mend)} || {player.health > UI(l_mend) & !tank.exists & toggle(disp) & spell(Purify).cooldown = 0}'},
	--Fade when you get aggro.
	{'fade', 'aggro & !toggle(xDPS)'},
	--Knock back enemies if enemies are attack you and fade on CD.
	{'Shining Force', 'spell(fade).cooldown > 0 & player.area(10).enemies > 1 & aggro & !toggle(xDPS) & player.health <= 40', 'player'},
	--Knock back enemies as interrupt.
	{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range > 10 & !lowest.health <= UI(l_mend)', 'tank'},
	{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range <= 10 & !lowest.health <= UI(l_mend)', 'player'},
	{'Arcane Torrent', 'player.mana < 97', 'player'},
	{Keybinds},
	{Trinkets},
	{Tank, 'tank.range <= 40 & !toggle(xDPS) & !tank.debuff(Ignite Soul) & tank.health <= 30'},
	{Lowest, '!toggle(xDPS) & lowest.range <= 40 & !lowest.debuff(Ignite Soul) & lowest.health <= 30'},
	{Rapture, 'player.buff(Rapture) & lowest.range <= 40 & !lowest.debuff(Ignite Soul)'},
	{Moving, "moving & !player.buff(Norgannon's Foresight)"},
	{Rampup, 'toggle(ramp) & !lowest.debuff(Ignite Soul)'},
	{Solo, 'toggle(xDPS)'},
	{Tank, 'tank.range <= 40 & !player.buff(Rapture) & !toggle(xDPS) & !tank.debuff(Ignite Soul)'},
	{Player, '!toggle(xDPS) & !player.buff(Rapture) & !player.debuff(Ignite Soul)'},
	{Lowest, '!toggle(xDPS) & !player.buff(Rapture) & lowest.range <= 40 & !lowest.debuff(Ignite Soul)'},
	{Atonement, '!toggle(xDPS) & !lowest.health <= UI(l_mend) & !player.buff(Rapture) & !player.mana <= 20'},
	{"Light's Wrath", '{target.debuff(Schism) & target.debuff(Schism).duration >= 3 & spell(plea).count >= UI(ato_LW) & UI(LW)} || {!talent(1,3) & spell(plea).count >= UI(ato_LW) & UI(LW)}', 'target'},
	--Shadowfiend on CD if toggled.
	{'Shadowfiend', 'toggle(cooldowns) & !talent(4,3)', 'target'},
}

local outCombat = {
	{Keybinds},
	{Moving, 'moving & !toggle(ato) & !inareaid = 1040'},
	{{
		{'Shadow Mend', "lowest.health <= 90 & {!moving || player.buff(Norgannon's Foresight)}", 'lowest'},
	}, 'toggle(ooc_heal)'},
	{{
		{'Power Word: Shield', '!tank.buff(Power Word: Shield) & spell(Plea).count = 5', 'tank'},
		{Moving, 'moving'},
		{'Plea', 'lowest1.health > UI(l_mend) & !lowest1.buff(Atonement) & spell(Plea).count < 5', 'lowest1'},
		{'Plea', 'lowest2.health > UI(l_mend) & !lowest2.buff(Atonement) & spell(Plea).count < 5', 'lowest2'},
		{'Plea', 'lowest3.health > UI(l_mend) & !lowest3.buff(Atonement) & spell(Plea).count < 5', 'lowest3'},
		{'Plea', 'lowest4.health > UI(l_mend) & !lowest4.buff(Atonement) & spell(Plea).count < 5', 'lowest4'},
		{'Plea', 'lowest5.health > UI(l_mend) & !lowest5.buff(Atonement) & spell(Plea).count < 5', 'lowest5'},
	}, 'toggle(ato)'}, 
	{'%ressdead(Resurrection)', 'UI(rezz)'},
	-- Potion of Prolonged Power usage before pull if enabled in UI.
	{'#142117', 'pull_timer <= 3 & UI(s_PPull)'},
	{'Power Word: Shield', 'pull_timer <= gcd', 'tank'},
	{'Power Word: Radiance', '{pull_timer  <= 6 & pull_timer >= 3} & lowest.range <= 40 & UI(PWR_PPull)', 'lowest'},
}

NeP.CR:Add(256, {
	name = '|cff58FAF4 [Yobleed]|r Priest - |cff58FAF4Discipline|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
