--count.friendly.buffs(Plea)
-- Counts how many units have the buff
-- USAGE: count(BUFF).buffs > = #
local GUI = {
	-- GUI Header 
	{type = "texture",
	texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\disc.blp",
	width = 512, 
	height = 256, 
	offset = 90, 
	y = 42, 
	center = true},
    --GENERAL
    {type = 'header', text = 'General', align = 'center'},
	{type = 'checkbox', text = 'Out of Combat Healing', key = 'ooc_heal', width = 55, default = true},
	{type = 'checkbox', text = 'Mythic+ Healing', key = 'myth_heal', width = 55, default = false},
    {type = 'checkbox', text = 'Out of Combat Atonements', key = 'ato', width = 55, default = false},
    --Healing Options
    {type = 'text', text = 'Healing Options', align = 'center'},
	{type = 'checkbox', text = 'Auto Power Word: Radiance', key = 'PWR', width = 55, default = false},
    {type = 'checkbox', text = 'Auto Evangelism', key = 'Evang', width = 55, default = false},
    {type = 'spinner', text = 'players <= 70 health', key = 'Evang_spin', width = 55, max = 40, step = 1, default = 5},
    {type = 'spinner', text = 'Atonements', key = 'Evang2_spin', width = 55, max = 40, step = 1, default = 5},
    {type = 'checkbox', text = 'Auto Shadowfiend', key = 'SF', width = 55, default = false},
    {type = 'checkbox', text = 'Auto Light\'s Wrath', key = 'LW', width = 55, default = false},
    {type = 'spinner', text = 'players <= 70 health', key = 'LW_spin', width = 55, max = 40, step = 1, default = 5},
    {type = 'spinner', text = 'Atonements', key = 'LW2_spin', width = 55, max = 40, step = 1, default = 5},
    {type = 'checkbox', text = 'Mindbender', key = 'MB', width = 55, default = false},
    {type = 'spinner', text = 'Mana', key = 'MB_spin', width = 55, default = 90},
    {type = 'ruler'},{type = 'spacer'},

	--Cooldowns
	{type = 'header', text = 'Cooldowns when toggled on', align = 'center'},
	{type = 'checkbox', text = 'Use Pain Suppression on tank', key = 'c_PSt', width = 55, default = false},
	{type = 'checkbox', text = 'Use Pain Suppression on lowest', key = 'c_PSl', width = 55, default = false},
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
	{type = 'checkbox', text = 'Power Word: Barrier/ PWR', key = 'k_PWB', width = 55, default = false},
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
	{type = 'spinner', text = 'Shadow Mend', key = 't_mend', width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 't_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},

    --PLAYER
	{type = 'header', text = 'Player', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Power Word: Shield', key = 'p_PWS', width = 55, default = 90},
	{type = 'spinner', text = 'Shadow Mend', key = 'p_mend', width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 'p_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},

	--LOWEST
	{type = 'header', text = 'Lowest', align = 'center'},
	{type = 'text', text = 'Lowest health values', align = 'center'},
	{type = 'spinner', text = 'Power Word: Shield', key = 'l_PWS', width = 55, default = 90},
	{type = 'spinner', text = 'Shadow Mend', key = 'l_mend', width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 'l_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff58FAF4 Priest:|r|cff58FAF4DISCIPLINE|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		key = 'ramp',
		name = 'Spike Damage',
		text = 'ON/OFF Ramping up Atonements for incoming spike damage',
		icon = 'Interface\\ICONS\\ability_mage_massinvisibility', --toggle(ramp)
	})

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


end

local Rapture = {
    {'Penance', 'player.buff(Penitent)','target'},
	--Power Word: Shield.
	{'Power Word: Shield', '!buff(Power Word: Shield) & !buff(Atonement)', 'lowest1'},
	{'Power Word: Shield', '!buff(Power Word: Shield) & !buff(Atonement)', 'lowest2'},
	{'Power Word: Shield', '!buff(Power Word: Shield) & !buff(Atonement)', 'lowest3'},
	{'Power Word: Shield', '!buff(Power Word: Shield) & !buff(Atonement)', 'lowest4'},
	{'Power Word: Shield', '!buff(Power Word: Shield) & !buff(Atonement)', 'lowest5'},
	{'Power Word: Shield', '!buff(Power Word: Shield) & !buff(Atonement)', 'lowest6'},
}

local PWR = {
    {'Power Word: Radiance', 'tank.area(30,65).heal >= 3 & !tank.buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & advanced', 'tank'},
    {'Power Word: Radiance', 'lowest.area(30,65).heal >= 3 & !lowest.buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & advanced', 'lowest'},
    {'Power Word: Radiance', 'player.area(40,65).heal >= 3 & lowest.health <= 65 & !tank.buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & !advanced', 'tank'},
    {'Power Word: Radiance', 'player.area(40,65).heal >= 3 & lowest.health <= 65 & !lowest.buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & !advanced', 'lowest'},
    {'Power Word: Radiance', 'tank.area(30,85).heal >= 3 & !tank.buff(Atonement) & player.spell(Power Word: Radiance).charges = 2 & advanced', 'tank'},
    {'Power Word: Radiance', 'lowest.area(30,85).heal >= 3 & !lowest.buff(Atonement) & player.spell(Power Word: Radiance).charges = 2 & advanced', 'lowest'},
    {'Power Word: Radiance', 'player.area(40,85).heal >= 3 & lowest.health <= 85 & !tank.buff(Atonement & player.spell(Power Word: Radiance).charges = 2) & !advanced', 'tank'},
    {'Power Word: Radiance', 'player.area(40,85).heal >= 3 & lowest.health <= 85 & !lowest.buff(Atonement) & player.spell(Power Word: Radiance).charges = 2& !advanced', 'lowest'},

}

local Cooldowns = {
    {'#Perfectly Preserved Cake', 'equipped(Perfectly Preserved Cake) & player.area(15,85).heal >= 4'},
    {'!#Archive of Faith', 'equipped(Archive of Faith) & lowest.health <= 60 & !player.moving & equipped(Archive of Faith) & {player.spell(Holy Word: Serenity).cooldown > gcd || player.mana <= 5}', 'lowest'}, 
    --Automatic Shadowfiend.
	{'!Shadowfiend', "UI(SF) & player.spell(Light's Wrath).cooldown >= 85 & !talent(4,3)",'target'},
	--Mana up!
	{'!Power Infusion', 'player.buff(Rapture) & talent(4,2) & player.mana <= 30', 'player'},
	--Power Infusion if PWS and Rapture and Pain Suppression is on CD.
	{'!Power Infusion', 'spell(Power Word: Shield).cooldown > 0 & spell(Rapture).cooldown > 0 & spell(Pain Suppression).cooldown > 0 & tank.health <= 20', 'player'},
	--Mindbender if mana is below or if 90%.
	{'Mindbender', 'talent(4,3) & player.mana <= UI(MB_spin) & UI(MB)', 'target'},
	--Pain Suppression if tank health is below or equal to 20% and checked.
	{'!Pain Suppression', 'UI(c_PSt) & tank.health <= 20', 'tank'},
	--Pain Suppression if lowest health is below or equal to 20% and checked.
	{'!Pain Suppression', 'UI(c_PSl) & lowest.health <= 20', 'lowest'},
	--Gift of the Naaru if lowest health is below or if 20%.
	{'Gift of the Naaru', 'lowest.health <= 20', 'lowest'},
	--Automatic usage of Evangelism.
	{'!Evangelism', 'talent(7,3) & UI(Evang) & player.area(40,70).heal >= UI(Evang_spin) & count(Atonement).friendly.buffs >= UI(Evang2_spin) & lowest.buff(Atonement)','player'},
	--Automatic Light's Wrath.
	{'!Light\'s Wrath', '{!talent(7,3) & UI(LW) & player.area(40,70).heal >= UI(LW_spin) & count(Atonement).friendly.buffs >= UI(LW2_spin) & lowest.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime} || {talent(7,3) & player.lastcast(Evangelism) & UI(LW) & player.area(40,70).heal >= UI(LW_spin) & count(Atonement).friendly.buffs >= UI(LW2_spin) & lowest.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime}','target'},
}  


local Trinkets = {
	--Top Trinket usage if UI enables it.
	{'#trinket1', 'UI(trinket_1)'},
	--Bottom Trinket usage if UI enables it.
	{'#trinket2', 'UI(trinket_2)'},
}

local Keybinds = {
	-- Power Word: Barrier on left shift when checked in UI.
	{'!Power Word: Barrier', 'keybind(lshift) & UI(k_PWB)', 'cursor.ground'},
	{'Power Word: Radiance', 'keybind(lshift) & UI(k_PWB) & !lowest.buff(Atonement) & !player.spell(Power Word: Barrier).cooldown = 0', 'lowest'},
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
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
	{'Power Word: Radiance', '!buff(Atonement)', 'friendly'},

}


local Solo = {
	--Plea to keep on Atonement.
	{'Plea', "{!player.buff(Atonement) & player.health < 90} || {!player.buff(Atonement) & spell(Light's Wrath).cooldown = 0}", 'player'},
	--PWS if player health is below or if UI value.
	{'Power Word: Shield', 'Player.Health <= UI(full_PWS)', 'player'},
	--Schism on cooldown.
	{'Schism', "talent(1,3) & {!moving || player.buff(Norgannon's Foresight)}", 'target'},
	--LW.
    {'Light\'s Wrath', 'player.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime'}, 
	--PI on CD if toggled.
	{'Power Infusion', 'talent(7,1)', 'target'},
	--Shadowfiend on CD if toggled.
	{'Shadowfiend', '!talent(4,3)', 'target'},
	--Shadow Mend if player health is below or if UI value.
	{'Shadow Mend', "player.health <= UI(full_mend) & {!moving || player.buff(Norgannon's Foresight)}", 'player'},
	--Gift of the Naaru if player health is below or if UI value.
	{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
	--Purge the Wicked if talent and not on target.
	{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked) & !player.spell(Penance).cooldown = 0 & range <= 40 & combat', 'enemies'},
	{'Purge the Wicked', 'talent(6,1) & !target.debuff(Purge the Wicked)', 'target'},
	--Shadow Word: Pain if not on target.
	{'Shadow Word: Pain', '!talent(6,1) & !target.debuff(Shadow Word: Pain)', 'target'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', '{target.debuff(Purge the Wicked) || target.debuff(Shadow Word: Pain)} & infront', 'target'},
	--Power Word: Solace on cooldown if talent.
	{'Power Word: Solace', 'talent(4,1)', 'target'},
	--Divine Star if mobs are 3 or more.
	{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
	--Divine Star if moving.
	{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 1 & moving'},
	--Smite on CD.
	{'Smite', 'infront', 'target'},
}
local Atonement = {
	--Purge the Wicked if talent and not on target.
	{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked) & !player.spell(Penance).cooldown = 0 & range <= 40 & combat & !player.spell(Penance).cooldown < gcd', 'enemies'},
	{'Purge the Wicked', ' talent(6,1) & !target.debuff(Purge the Wicked)', 'target'},
	--Shadow Word: Pain if not on target.
	{'Shadow Word: Pain', '!talent(6,1) & !target.debuff(Shadow Word: Pain)', 'target'},
	--Schism on cooldown.
	{'Schism', "talent(1,3) & {!moving || player.buff(Norgannon's Foresight)}", 'target'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', '{target.debuff(Purge The Wicked) || target.debuff(Shadow Word: Pain)} & infront', 'target'},
	--Power Word: Solace on cooldown if talent.
	{'Power Word: Solace', 'talent(4,1)', 'target'},
	--Divine Star if mobs are 3 or more.
	{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
	--Smite on CD.
	{'Smite', 'infront', 'target'},
}

local Tankpred = {
    --Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
	{'Power Word: Shield', '!tank.buff(atonement) || !tank.buff(Power Word: Shield)', 'tank'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'tank.health.predicted <= UI(t_mend) & tank.buff(Atonement) & infront', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "tank.health.predicted <= UI(t_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'tank'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'tank.health.predicted <= UI(t_plea) & !tank.buff(Atonement)', 'tank'},
	
}

local Tank = {
    --Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
	{'Power Word: Shield', '!tank.buff(atonement) || !tank.buff(Power Word: Shield)', 'tank'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'tank.health <= UI(t_mend) & tank.buff(Atonement) & infront', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "tank.health <= UI(t_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'tank'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'tank.health <= UI(t_plea) & !tank.buff(Atonement)', 'tank'},
	
}
local Playerpred = {
    --Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
	{'Power Word: Shield', 'player.health <= UI(p_PWS) & !player.buff(Power Word: Shield)', 'player'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'player.health.predicted <= UI(p_mend) & player.buff(Atonement) & infront', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "player.health.predicted <= UI(p_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'player'},
	--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
	{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
	--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
	{'Divine Star', 'talent(6,2) & player.area(24, 90).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'player.health.predicted <= UI(p_plea) & !player.buff(Atonement)', 'player'},
}

local Player = {
    --Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
	{'Power Word: Shield', 'player.health <= UI(p_PWS) & !player.buff(Power Word: Shield)', 'player'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'player.health <= UI(p_mend) & player.buff(Atonement) & infront', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "player.health <= UI(p_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'player'},
	--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
	{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
	--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
	{'Divine Star', 'talent(6,2) & player.area(24, 90).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'player.health <= UI(p_plea) & !player.buff(Atonement)', 'player'},
}
local Lowestpred = {
    --Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
	{'Power Word: Shield', '!tank1.buff(atonement) || !tank1.buff(Power Word: Shield)', 'tank1'},
	{'Power Word: Shield', '!tank2.buff(atonement) || !tank2.buff(Power Word: Shield)', 'tank2'},
	--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
	{'Power Word: Shield', 'lowest.health <= UI(l_PWS) & !lowest.buff(Power Word: Shield)', 'lowest'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'lowestp.health <= UI(l_mend) & lowest.buff(Atonement) & !lowest.health <= 30 & infront', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "lowestp.health <= UI(l_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'lowestp'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'lowestp.health <= UI(l_plea) & !lowestp.buff(Atonement)', 'lowestp'},
	--Power Word: Shield on CD if not Atonement on 6 people max.
	{'Power Word: Shield', '!lowest1.buff(Atonement)', 'tank'},
	{'Power Word: Shield', '!lowest1.buff(Atonement)', 'lowest1'},
	{'Power Word: Shield', '!lowest2.buff(Atonement)', 'lowest2'},
	{'Power Word: Shield', '!lowest3.buff(Atonement)', 'lowest3'},
	{'Power Word: Shield', '!lowest4.buff(Atonement)', 'lowest4'},
	{'Power Word: Shield', '!lowest5.buff(Atonement)', 'lowest5'},
}

local Lowest = {
    --Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
	{'Power Word: Shield', '!tank.buff(atonement) || !tank.buff(Power Word: Shield)', 'tank'},
	--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
	{'Power Word: Shield', 'lowest.health <= UI(l_PWS) & !lowest.buff(Power Word: Shield)', 'lowest'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'lowest.health <= UI(l_mend) & lowest.buff(Atonement) & !lowest.health <= 30 & infront', 'target'},
	--Shadow Mend on UI value if PWS don't make it.
	{'Shadow Mend', "lowest.health <= UI(l_mend) & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'lowest'},
	--Plea on UI value if no 6 atonements are active.
	{'Plea', 'lowest.health <= UI(l_plea) & !lowest.buff(Atonement)', 'lowest'},
	--Power Word: Shield on CD if not Atonement on 6 people max.
	{'Power Word: Shield', '!lowest1.buff(Atonement)', 'tank'},
	{'Power Word: Shield', '!lowest1.buff(Atonement)', 'lowest1'},
	{'Power Word: Shield', '!lowest2.buff(Atonement)', 'lowest2'},
	{'Power Word: Shield', '!lowest3.buff(Atonement)', 'lowest3'},
	{'Power Word: Shield', '!lowest4.buff(Atonement)', 'lowest4'},
	{'Power Word: Shield', '!lowest5.buff(Atonement)', 'lowest5'},
}
local Mythic = {
{'!Pain Suppression', 'tank.health <= 20', 'tank'},
{'!Pain Suppression', 'lowest.health <= 20', 'lowest'},
{'Gift of the Naaru', 'lowest.health <= 20', 'lowest'},
{'!Light\'s Wrath', '{!talent(7,3) & player.area(40,70).heal >= 2 & count(Atonement).friendly.buffs >= 4 & lowest.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime} || {talent(7,3) & player.spell(Evangelism).cooldown >= 70 & player.area(40,70).heal >= 2 & count(Atonement).friendly.buffs >= 4 & lowest.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime}','target'},
{'!Evangelism', 'talent(7,3) & player.area(40,70).heal >= 2 & count(Atonement).friendly.buffs >= 4 & lowest.buff(Atonement)','player'},
{'!Shadowfiend', "player.spell(Light's Wrath).cooldown >= 85 & !talent(4,3)",'target'},
{'Power Word: Radiance', 'lowest.area(30,85).heal >= 3 & lowest.health <= 85 & !lowest.buff(Atonement) & advanced & player.spell(Power Word: Radiance).charges = 2', 'lowest'},
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & lowest.health <= 85 & !lowest.buff(Atonement) & !advanced & player.spell(Power Word: Radiance).charges = 2', 'lowest'},
{'Power Word: Radiance', 'lowest.area(30,85).heal >= 3 & lowest.health <= 85 & !lowest.buff(Atonement) & advanced & player.spell(Power Word: Radiance).charges < 2 & !player.lastcast(Power Word: Radiance)', 'lowest'},
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & lowest.health <= 85 & !lowest.buff(Atonement) & !advanced & player.spell(Power Word: Radiance).charges < 2 & !player.lastcast(Power Word: Radiance)', 'lowest'},
{'Power Word: Radiance', 'pull_timer  <= 6 & pull_timer >= 3 & lowest.range <= 40', 'lowest'},
{'Power Word: Shield', 'lowest.health <= 90 & !lowest.buff(Power Word: Shield)', 'lowest'},
{'Penance', 'player.health <= 65 & player.buff(Atonement) & infront', 'target'},
{'Shadow Mend', "player.health <= 65 & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'player'},
{'Penance', 'lowest.health <= 65 & lowest.buff(Atonement) & infront', 'target'},
{'Shadow Mend', "lowest.health <= 70 & !player.channeling(Penance) & !player.channeling(Light\'s Wrath) & {!moving || player.buff(Norgannon's Foresight)}", 'lowest'},
{'Plea', 'lowest.health <= 85 & !lowest.buff(Atonement)', 'lowest'},	
}
local Moving = {
	--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'/cast [@player] Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player'},
	-- Body and Soul usage if enabled in UI.
	{'Power Word: Shield', 'talent(2,2) & !player.buff(Body and Soul) & player.movingfor >= 1 & UI(m_Body) & !player.channeling(Penance) & !player.buff(Speed of the Pious)', 'player'},
}

local ST = {
{Playerpred,'partycheck = 3 & !lowestp.health <= 50'},
{Player, '!tank.health <= 40 & !lowest.health <= 50 & !partycheck = 3'},
{Lowestpred,'partycheck = 3 & !tank.health.predicted <= 50'},
{Lowest, '!tank.health <= 50 & !partycheck = 3'},
{Tankpred,'partycheck = 3'},
{Tank, '!partycheck = 3'},


	
}

local inCombat = {
	{Potions},
	{Cooldowns},
	{'%dispelall', '{toggle(disp) & spell(Purify).cooldown = 0 & tank.health > UI(t_mend)} || {player.health > UI(l_mend) & !tank.exists & toggle(disp) & spell(Purify).cooldown = 0}'},
	--Fade when you get aggro.
	{'fade', 'player.aggro & !toggle(xDPS)'},
	--Knock back enemies if enemies are attack you and fade on CD.
	{'Shining Force', 'spell(fade).cooldown > 0 & player.area(10).enemies > 1 & aggro & !toggle(xDPS) & player.health <= 40', 'player'},
	--Knock back enemies as interrupt.
	{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range > 10 & !lowest.health <= UI(l_mend)', 'tank'},
	{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range <= 10 & !lowest.health <= UI(l_mend)', 'player'},
	{'Arcane Torrent', 'player.mana < 97', 'player'},
	{Keybinds},
	{Trinkets},
	{Rapture, 'player.buff(Rapture)'},
	{{
	{Moving, 'player.moving'},
	{Rampup, 'toggle(ramp) & !lowest.debuff(Ignite Soul)'},
	{Solo, 'toggle(xDPS)'},
	{PWR, 'UI(PWR) & !tank.health <= 30'},
	{Mythic, 'partycheck = 2 & UI(myth_heal)'},
	{ST, '!UI(myth_heal)'},
	},'!player.buff(Rapture)'},
	{Atonement, '!lowest.health <= UI(l_mend) || {UI(myth_heal) & !lowest.health <= 65}'},
}

local outCombat = {
	{Keybinds},
	{Moving, 'moving & !UI(ato) & !inareaid = 1040'},
	{Mythic, 'partycheck = 2 & UI(myth_heal)'},
	{{
		{'Shadow Mend', "lowest.health <= 90 & {!moving || player.buff(Norgannon's Foresight)}", 'lowest'},
	}, 'UI(ooc_heal)||UI(myth_heal)'},
	{{
		{'Power Word: Shield', '!tank.buff(Power Word: Shield)', 'tank'},
		{Moving, 'moving'},
		{'Plea', 'lowest1.health > UI(l_mend) & !lowest1.buff(Atonement)', 'lowest1'},
		{'Plea', 'lowest2.health > UI(l_mend) & !lowest2.buff(Atonement)', 'lowest2'},
		{'Plea', 'lowest3.health > UI(l_mend) & !lowest3.buff(Atonement)', 'lowest3'},
		{'Plea', 'lowest4.health > UI(l_mend) & !lowest4.buff(Atonement)', 'lowest4'},
		{'Plea', 'lowest5.health > UI(l_mend) & !lowest5.buff(Atonement)', 'lowest5'},
	}, 'UI(ato)||UI(myth_heal)'}, 
	{Mythic, 'partycheck = 2 & UI(myth_heal)'},
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
