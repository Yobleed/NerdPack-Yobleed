local _, yobleed = ...
local NeP = NeP

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
{type = 'checkbox', text = 'Attack Fel Explosives', key = 'myth_fel', width = 55, default = false},
{type = 'checkbox', text = 'Out of Combat Atonements', key = 'ato', width = 55, default = false},

--TOS DISPELLING
{type = 'header', text = 'Dispel', align = 'center'},
{type = 'text', text = 'Advanced Only', align = 'center', color ='FF0000'},
{type = 'checkbox', text = 'Echoing Anguish (Demonic Inquisition)', key = 'disp_ang', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

--Healing Options
{type = 'text', text = 'Healing Options', align = 'center'},
{type = 'checkspin',text = 'Shadow Covenant', key = 'SC', check = true, spin = 80},
{type = 'checkbox', text = 'Use Penance Emergency Healing <= 30% health', key = 'Penance', width = 55, default = false},
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
{type = 'text', text = 'Arcane Torrent', align = 'center'},
{type = 'checkbox', text = 'ON/OFF', key = 'dps_at', width = 55, default= true},
{type = 'ruler'},{type = 'spacer'},

--Cooldowns
{type = 'header', text = 'Cooldowns when toggled on', align = 'center'},
{type = 'checkbox', text = 'Use Pain Suppression on tank', key = 'c_PSt', width = 55, default = false},
{type = 'checkbox', text = 'Use Pain Suppression on lowest', key = 'c_PSl', width = 55, default = false},
{type = 'checkspin',text = 'Light\'s Judgment - Units', key = 'LJ',	spin = 4, step = 1, max = 20, check = true,	desc = '|cff00FF96World Spell usable on Argus.|r'},
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
{type = 'checkbox', text = 'Auto Use Velen\'s Future Sight', key = 'velens', width = 55, default = false},
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
{type = 'checkspin', text = 'Healthstone', key = 'HS', spin = 30, check = false},
{type = 'checkspin', text = 'Ancient Healing Potion', key = 'AHP', spin = 30, check = false},
{type = 'checkspin', text = 'Astral Healing Potion', key = 'AsHP', spin = 30, check = false},
{type = 'checkspin', text = 'Ancient Mana Potion', key = 'AMP', spin = 30, check = false},
{type = 'ruler'},{type = 'spacer'},

--Before Pull
{type = 'header', text = 'Pull Timer', align = 'center'},
{type = 'text', text = 'Before Pull.', align = 'center'},
{type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_PPull', width = 55, default= false},
{type = 'checkbox', text = 'Pre-Pull Ramp', key = 'PWR_PPull', width = 55, default= false},
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
{type = 'ruler'},{type = 'spacer'},

--PLAYER
{type = 'header', text = 'Player', align = 'center'},
{type = 'text', text = 'Player health values', align = 'center'},
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


NeP.Interface:AddToggle({
key = 'control',
name = 'Dominant Mind',
text = 'ON/OFF NPC taming',
icon = 'Interface\\ICONS\\spell_shadow_charm', --toggle(control)
})
end

local Felexplosive = {
{{
{'Purge the Wicked', 'id(120651) & range <= 40 & !debuff', 'enemies'},
{'Penance', 'id(120651) & range <= 40' , 'enemies'},
{'Shadow Word: Pain', '!talent(6,1) & id(120651) & range <= 40 & !debuff', 'enemies'},
{'Power Word: Solace', 'id(120651) & range <= 40', 'enemies'},
},'lowest.health >= 65 & UI(myth_fel) & enemies.infront'},
}

local VelensFuture = {
{'#144258','equipped(144258) & UI(velens)'},
}

local Rapture = {
{'Penance', 'player.buff(Penitent)','target'},
{'Power Word: Shield', '!buff(Power Word: Shield)', {'lowest1','lowest2','lowest3','lowest4','lowest5','lowest6'}},
}


local PWR = {
{VelensFuture,'area(30,65).heal >= 3 & !buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & advanced', {'lowest(tank)','lowest'}},
{VelensFuture,'player.area(40,65).heal >= 3 & health <= 65 & !buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & !advanced', {'lowest(tank)','lowest'}},
{VelensFuture,'area(30,85).heal >= 3 & !buff(Atonement) & player.spell(Power Word: Radiance).charges == 2 & advanced',{'lowest(tank)','lowest'}},  
{VelensFuture,'player.area(40,85).heal >= 3 & health <= 85 & !buff(Atonement} & player.spell(Power Word: Radiance).charges == 2 & !advanced',{'lowest(tank)','lowest'}},
{'Power Word: Radiance', 'area(30,65).heal >= 3 & !buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & advanced', {'lowest(tank)','lowest'}},
{'Power Word: Radiance', 'player.area(40,65).heal >= 3 & health <= 65 & !buff(Atonement) & player.spell(Power Word: Radiance).charges < 2 & !advanced', {'lowest(tank)','lowest'}},
{'Power Word: Radiance', 'area(30,85).heal >= 3 & !buff(Atonement) & player.spell(Power Word: Radiance).charges == 2 & advanced',{'lowest(tank)','lowest'}},  
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & health <= 85 & !buff(Atonement} & player.spell(Power Word: Radiance).charges == 2 & !advanced',{'lowest(tank)','lowest'}},
}

local Cooldowns = {
--Mind Control
{'Mind Control', 'talent(3,3) & !creatureType(Demon) & !creatureType(Mechanical) & !creatureType(Undead) & combat & toggle(control)','enemies'},
--Automatic Shadowfiend.
{'!Shadowfiend', 'UI(SF) & !talent(4,3) & player.spell(Light\'s Wrath).cooldown >= 85 || partycheck == 2','target'},
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
{'!Evangelism', 'talent(7,3) & UI(Evang) & area(40,70).heal >= UI(Evang_spin) & buff(Sins of the Many).count >= UI(Evang2_spin) & lowest.buff(Atonement)','player'},
--Automatic Light's Wrath.
{'!Light\'s Wrath', '{!talent(7,3) || {talent(7,3) & player.lastcast(Evangelism)}} & UI(LW) & player.area(40,70).heal >= UI(LW_spin) & player.buff(Sins of the Many).count >= UI(LW2_spin) & lowest.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime','target'},
{'Light\'s Judgment', 'UI(LJ_check)&range<61&area(15).enemies>=UI(LJ_spin)', 'enemies.ground'}
}


local Trinkets = {
--Top Trinket usage if UI enables it.
{'#trinket1', 'UI(trinket_1)'},
--Bottom Trinket usage if UI enables it.
{'#trinket2', 'UI(trinket_2)'},
}

local Keybinds = {
{{
{'!Power Word: Barrier', nil, 'cursor.ground'},
{'Power Word: Radiance', '!buff(Atonement) & !player.spell(Power Word: Barrier).cooldown == 0', 'lowest'},
},'keybind(lshift) & UI(k_PWB)'},
{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
{'%pause', 'keybind(lalt)& UI(k_P)'},
}

local Potions = {
--Health Stone.
{'#5512', 'item(5512).usable&item(5512).count>0&player.health<=UI(HS_spin)&UI(HS_check)', 'player'},
--Ancient Healing Potion.
{'#127834', 'item(127834).usable&item(127834).count>0&player.health<=UI(AHP_spin)&UI(AHP_check)'},
--Astral Healing Potion.
{'#152615', 'item(152615).usable&item(152615).count>0&player.health<=UI(AsHP_spin)&UI(AsHP_check)'},
--Ancient Mana Potion.
{'#127835', 'item(127835).usable&item(127835).count>0&player.mana<=UI(AMP_spin)&UI(AMP_check)', 'player'},
}

local Rampup = {
--Spreading Atonement before DPS if checked.
{'!Light\'s Wrath', 'player.spell(Evangelism).cooldown ~= 0 & friendly.buff(Atonement).duration < {{player.spell(Light\'s Wrath).casttime + gcd}+0.5}','target'},
{'!Evangelism', 'buff(Sins of the Many).count >= 12 & friendly.buff(Atonement).duration < spell(Light\'s Wrath).casttime & partycheck == 3','player'},
{'!Evangelism', 'buff(Sins of the Many).count == 5 & buff(Atonement).duration < spell(Light\'s Wrath).casttime & partycheck == 2','player'},
{'Power Word: Radiance', '!buff(Atonement)', {'lowest','friendly'}},
{'Power Word: Shield', '!buff(Atonement)',{'lowest','friendly'}},
{'Plea', '!buff(Atonement)',{'lowest','friendly'}},
}


local Solo = {
--Plea to keep on Atonement.
{'Power Word: Radiance', 'spell(Light\'s Wrath).cooldown == 0 & partycheck == 2 & area(30).friendly >= 4 & target.is(target) & target.health.actual >= 617526 & buff(Sins of the Many).count < 5', 'player'},
{'Plea', "{!buff(Atonement) & health < 90} || {!buff(Atonement) & spell(Light's Wrath).cooldown == 0}", 'player'},
--PWS if player health is below or if UI value.
{'Power Word: Shield', 'Health <= UI(full_PWS)', 'player'},
--Schism on cooldown.
{'Schism', "talent(1,3) & {!player.moving || player.buff(Norgannon's Foresight)}", 'target'},
--LW.
{'Light\'s Wrath', 'player.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime & health.actual >= 617526','target'},
--PI on CD if toggled.
{'Power Infusion', 'talent(7,1)', 'target'},
--Shadowfiend on CD if toggled.
{'Shadowfiend', '!talent(4,3)', 'target'},
--Shadow Mend if player health is below or if UI value.
{'Shadow Mend', "player.health <= UI(full_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'player'},
--Gift of the Naaru if player health is below or if UI value.
{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
--Purge the Wicked if talent and not on target.
{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked) & !player.spell(Penance).cooldown == 0 & range <= 40 & combat & toggle(AOE)', 'enemies'},
{'Purge the Wicked', 'talent(6,1) & !debuff(Purge the Wicked)', 'target'},
--Shadow Word: Pain if not on target.
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain) & range <= 40 & combat & !player.spell(Penance).cooldown < gcd & toggle(AOE) & {{ttd >= 20 & partycheck = 3}||partycheck ~= 3}', 'enemies'},
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain)', 'target'},
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
{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked) & !player.spell(Penance).cooldown == 0 & range <= 40 & combat & !player.spell(Penance).cooldown < gcd & toggle(AOE) & {{ttd >= 20 & partycheck = 3}||partycheck ~= 3}', 'enemies'},
{'Purge the Wicked', ' talent(6,1) & !debuff(Purge the Wicked)', 'target'},
--Shadow Word: Pain if not on target.
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain) & range <= 40 & combat & !player.spell(Penance).cooldown < gcd & toggle(AOE) & {{ttd >= 20 & partycheck = 3}||partycheck ~= 3}', 'enemies'},
{'Shadow Word: Pain', '!talent(6,1) & !debuff(Shadow Word: Pain)', 'target'},
--Schism on cooldown.
{'Schism', "talent(1,3) & {!moving || player.buff(Norgannon's Foresight)}", 'target'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'target.debuff(Purge the Wicked)||!talent(6,1)', 'target'},
--Power Word: Solace on cooldown if talent.
{'Power Word: Solace', 'talent(4,1)', 'target'},
--Divine Star if mobs are 3 or more.
{'Divine Star', 'talent(6,2) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
--Smite on CD.
{'Smite', 'infront', 'target'}, --& {{partycheck = 3 & player.buff(Sins of the Many).count >= 5}||partycheck ~= 3}

}

local Tankpred = {
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowest(tank).health.predicted <= UI(t_mend) & lowest(tank).buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health.predicted <= UI(t_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest(tank)'},
}

local Tank = {
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowest(tank).health <= UI(t_mend) & lowest(tank).buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(t_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest(tank)'},
}

local Playerpred = {
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'player.health.predicted <= UI(p_mend) & player.buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health.predicted <= UI(p_mend) & {!moving || buff(Norgannon's Foresight)}", 'player'},
--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
{'Divine Star', 'talent(6,2) & player.area(24, 90).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},
--Plea on UI value if no 6 atonements are active.
{'Plea', 'health.predicted <= UI(p_plea) & !buff(Atonement) & !buff(Sins of the Many).count >= 6', 'player'},
}

local Player = {
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'player.health<= UI(p_mend) & player.buff(Atonement) & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(p_mend) & {!moving || buff(Norgannon's Foresight)}", 'player'},
--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
{'Halo','talent(6,3) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
{'Divine Star', 'talent(6,2) & player.area(24, 90).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},
--Plea on UI value if no 6 atonements are active.
{'Plea', 'health <= UI(p_plea) & !buff(Atonement) & !buff(Sins of the Many).count >= 6', 'player'},
}

local Lowestpred = {
--Shadow Covenant if lowest and 5 or more at 30yds are below 90%.
{'Shadow Covenant', 'area(30,90).heal >= 5 & !debuff(Shadow Covenant) & !count(Shadow Covenant).friendly.debuffs >= 10 & UI(SC_check) & health <= UI(SC_spin)','lowestp'},
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
{'Power Word: Shield', 'health <= UI(l_PWS) & !buff(Power Word: Shield) & !is(player)', 'lowest'},
--Penance Emergency Healing if Checked.
{'Penance', 'health <= 30 & infront & UI(Penance)', 'lowestp'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowestp.health <= UI(l_mend) & lowestp.buff(Atonement) & !lowestp.health <= 30 & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(l_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowestp'},
--Plea on UI value if no 6 atonements are active.
{'Plea', 'health <= UI(l_plea) & !buff(Atonement) & !player.buff(Sins of the Many).count >= 6', 'lowestp'},
--Power Word: Shield on CD if not Atonement on 6 people max.
{'Power Word: Shield', '!buff(Atonement)', {'lowest(tank)', 'lowest1', 'lowest2', 'lowest3', 'lowest4', 'lowest5'}},
}

local Lowest = {
--Shadow Covenant if lowest and 3 or more at 30yds are below 90%.
{'Shadow Covenant', 'area(30,90).heal >= 3 & !debuff(Shadow Covenant) & !count(Shadow Covenant).friendly.debuffs >= 4 & UI(SC_check) & health <= UI(SC_spin)','lowest'},
--Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
--Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
{'Power Word: Shield', 'health <= UI(l_PWS) & !buff(Power Word: Shield) & !is(player)', 'lowest'},
--Penance Emergency Healing if Checked.
{'Penance', 'health <= 30 & infront & UI(Penance)', 'lowest'},
--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
{'Penance', 'lowest.health <= UI(l_mend) & lowest.buff(Atonement) & !lowest.health <= 30 & infront', 'target'},
--Shadow Mend on UI value if PWS don't make it.
{'Shadow Mend', "health <= UI(l_mend) & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest'},
--Plea on UI value if no 6 atonements are active.
{'Plea', 'health <= UI(l_plea) & !buff(Atonement) & !player.buff(Sins of the Many).count >= 6', 'lowest'},
--Power Word: Shield on CD if not Atonement on 6 people max.
{'Power Word: Shield', '!buff(Atonement)', {'lowest(tank)', 'lowest1', 'lowest2', 'lowest3', 'lowest4', 'lowest5'}},
}

local Mythic = {
{'!Pain Suppression', 'health <= 20', {'tank','lowest'}},
{'Gift of the Naaru', 'health <= 20', 'lowest'},
{'!Light\'s Wrath', '{!talent(7,3) || {talent(7,3) & player.lastcast(Evangelism)}} & UI(LW) & player.area(40,70).heal >= UI(LW_spin) & player.buff(Sins of the Many).count >= UI(LW2_spin) & lowest.buff(Atonement).duration > player.spell(Light\'s Wrath).casttime','target'},
{'!Evangelism', 'talent(7,3) & player.area(40,70).heal >= 2 & buff(Sins of the Many).count >= 4 & lowest.buff(Atonement)','player'},
{'!Shadowfiend', "player.spell(Light's Wrath).cooldown >= 85 & !talent(4,3)",'target'},
{'Power Word: Radiance', 'area(30,85).heal >= 3 & health <= 85 & !buff(Atonement) & advanced & player.spell(Power Word: Radiance).charges == 2', 'lowest'},
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & health <= 85 & !buff(Atonement) & !advanced & player.spell(Power Word: Radiance).charges == 2', 'lowest'},
{'Power Word: Radiance', 'area(30,85).heal >= 3 & lowest.health <= 85 & !buff(Atonement) & advanced & player.spell(Power Word: Radiance).charges < 2 & !player.lastcast(Power Word: Radiance)', 'lowest'},
{'Power Word: Radiance', 'player.area(40,85).heal >= 3 & health <= 85 & !buff(Atonement) & !advanced & player.spell(Power Word: Radiance).charges < 2 & !player.lastcast(Power Word: Radiance)', 'lowest'},
{'Power Word: Radiance', 'pull_timer <= 6 & pull_timer >= 3 & range <= 40', 'lowest'},
{'Shadow Covenant', 'area(30,90).heal >= 3 & !debuff(Shadow Covenant) & !count(Shadow Covenant).friendly.debuffs >= 4 & UI(SC_check) & health <= UI(SC_spin)', 'lowest'},
{'Power Word: Shield', 'health <= 90 & !buff(Power Word: Shield)', 'lowest'},
{'Penance', 'player.health <= 65 & player.buff(Atonement) & infront', 'target'},
{'Shadow Mend', "health <= 65 & {!moving || buff(Norgannon's Foresight)}", 'player'},
{'Penance', 'lowest.health <= 65 & lowest.buff(Atonement) & infront', 'target'},
{'Shadow Mend', "health <= 70 & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest'},
{'Plea', 'health <= 85 & !buff(Atonement)', 'lowest'},
}
local Moving = {
--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
{'Angelic Feather', 'player.movingfor >= 4 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player.ground'},
-- Body and Soul usage if enabled in UI.
{'Power Word: Shield', 'talent(2,2) & !player.buff(Body and Soul) & player.movingfor >= 1 & UI(m_Body) & !player.channeling(Penance) & !player.buff(Speed of the Pious)', 'player'},
}

local Raid = {
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
{Tankpred,'tank.health.predicted < 50 & tank.exists'},
{Playerpred,'player.health.predicted <= 50'},
{Lowestpred,'lowestp.health <100'},
}

local Party = {
{'Power Word: Shield', '!buff(Power Word: Shield)', 'lowest(tank)'},
{Tank,'tank.health < 50 & tank.exists'},
{Player,'player.health<= 45'},
{Lowest,'lowest.health <100'},
}

local ST = {
{Raid,'partycheck == 3'},
{Party, 'partycheck == 2'},
}

local Beforepull = {
{'#142117', '{pull_timer <= 3 & & pull_timer >= 1 & UI(s_PPull) & !UI(PWR_PPull) & !buff(Potion of Prolonged Power)}||{{ pull_timer >= 1 & pull_timer <= {5 + gcd}} & UI(s_PPull) & UI(PWR_PPull) & !buff(Potion of Prolonged Power)}','player'},
{Rampup, 'pull_timer <= 20 & UI(PWR_PPull)'},
{'Power Word: Shield', 'pull_timer <= 2 &  pull_timer >= 1 & !tank.buff(Power Word: Shield)', 'tank'},
}

local Stopcasting = {
{'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
}

local inCombat = {
{Stopcasting},
{Potions},
{Cooldowns},
{'!Purify', 'toggle(disp) & player.spell(Purify).cooldown == 0 & purify & area(8).friendly == 1 & UI(disp_ang) & range <= 40', 'friendly'},
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
{'fade', '{target.inmelee || player.area(2).enemies >= 1} & player.aggro & !partycheck == 1'},
{'Psychic Scream', 'player.spell(Fade).cooldown > 0 & player.aggro & !toggle(xDPS) & player.area(8).enemies >= 1 & partycheck ~= 2'},
{'Shining Force', 'spell(Fade).cooldown > 0 & spell(Psychic Scream).cooldown > 0 & area(10).enemies >= 1 & aggro & !toggle(xDPS) & partycheck ~= 2', 'player'},
{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range > 10 & !lowest.health <= UI(l_mend)', 'tank'},
{'!Shining Force', 'toggle(interrupts) & target.interruptAt(70) & target.range <= 10 & !lowest.health <= UI(l_mend)', 'player'},
{'Arcane Torrent', 'player.mana < 97 & UI(dps_at)', 'player'},
{Felexplosive},
{Keybinds},
{Trinkets},
{Rapture, 'player.buff(Rapture)'},
{{
{Moving, 'player.moving'},
{Rampup, 'toggle(ramp)'},
{Solo, 'toggle(xDPS)'},
{PWR, 'UI(PWR) & !tank.health <= 30'},
{Mythic, 'partycheck == 2 & UI(myth_heal)'},
{ST, '!UI(myth_heal)'},
},'!player.buff(Rapture)'},
{Atonement, '!lowest.health <= UI(l_mend) || {UI(myth_heal) & !lowest.health <= 65}'},
}

local outCombat = {
{'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
{'%ressdead(Mass Resurrection)', 'UI(rezz)'},
{Beforepull,'pull_timer >= 1'},
{Keybinds},
{Moving, 'player.moving & !UI(ato) & !inareaid == 1040'},
{'!Light\'s Wrath', 'pull_timer >= 1 & pull_timer <= player.spell(Light\'s Wrath).casttime & UI(PWR_PPull) ','target'},
{'!Evangelism', 'buff(Sins of the Many).count >= 12 & friendly.buff(Atonement).duration < spell(Light\'s Wrath).casttime & partycheck == 3 & pull_timer <= 20 & pull_timer >= 1 & UI(PWR_PPull)','player'},
{'!Evangelism', 'buff(Sins of the Many).count == 5 & buff(Atonement).duration < spell(Light\'s Wrath).casttime) & partycheck == 2 & pull_timer <= 20 & pull_timer >= 1 & UI(PWR_PPull)','player'},
{Mythic, 'partycheck == 2 & UI(myth_heal)'},
{{
{'Shadow Mend', "lowest.health <= 90 & {!player.moving || player.buff(Norgannon's Foresight)}", 'lowest'},
},'UI(ooc_heal)||UI(myth_heal)'},
{{
{'Power Word: Shield', '!tank.buff(Power Word: Shield)', 'tank'},
{Moving, 'player.moving'},
{'Plea', 'health > UI(l_mend) & !buff(Atonement)',{'lowest1','lowest2', 'lowest3', 'lowest4', 'lowest5'}},
}, 'UI(ato)||UI(myth_heal)'},
{Mythic, 'partycheck == 2 & UI(myth_heal)'},
}

NeP.CR:Add(256, {
  name = '|cff58FAF4 [Yobleed]|r Priest - |cff58FAF4Discipline|r',
  ic = inCombat,
  ooc = outCombat,
  gui = GUI,
  gui_st = {title='Yobleed\'s Priest Pack: Discipline', width='512', height='256', color='58FAF4'},
  load = exeOnLoad,
  ids = yobleed.spell_ids
})
