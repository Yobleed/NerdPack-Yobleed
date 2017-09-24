local _, yobleed = ...
local NeP = NeP
--[[
{type='checkspin', text='something', desc='something something', key='KEY', spin=80, check=true}
UI(KEY_check) & UI(KEY_spin)
]]--

local GUI = {
{type = "texture",
texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\holy.blp",
width = 512, 
height = 256, 
offset = 90, 
y = 42, 
center = true},
--GENERAL
{type = 'header', text = 'General', align = 'center'},
{type = 'checkbox', text = 'Healing OOC', key = 'ooc_heal', width = 55, default = false},
{type = 'checkbox', text = 'Mythic+ Healing', key = 'myth_heal', width = 55, default = false},
{type = 'checkbox', text = 'Attack Fel Explosives', key = 'myth_fel', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

--TOS DISPELLING
{type = 'header', text = 'Dispel', align = 'center'},
{type = 'text', text = 'Advanced Only', align = 'center', color ='FF0000'},
{type = 'checkbox', text = 'Echoing Anguish (Demonic Inquisition)', key = 'disp_ang', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

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
{type = 'checkbox', text = 'Smite', key = 'd_smite', width = 55, default = true},
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
{type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_PPull', width = 55, default= false},
{type = 'ruler'}, {type = 'spacer'},

--TRINKETS
{type = 'header', text = 'Trinkets', align = 'center'},
{type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', width = 55, default = false},
{type = 'checkbox', text = 'Bottom Trinket', key = 'trinket_2', width = 55, default = false},
{type = 'ruler'},{type = 'spacer'},

--Cooldowns
{type = 'header', text = 'Cooldowns when toggled on', align = 'center'},
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
{type = 'text', text = 'Arcane Torrent', align = 'center'},
{type = 'checkbox', text = 'ON/OFF', key = 'dps_at', width = 55, default= true},
{type = 'checkspin',text = 'Light\'s Judgment - Units', key = 'LJ',	spin = 4, step = 1, max = 20, check = true,	desc = '|cff00FF96World Spell usable on Argus.|r'},
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
{type = 'spinner', text = 'Holy Word: Serenity', key = 't_HWSE', width = 55, default = 55},
{type = 'spinner', text = 'Flash Heal', key = 't_FH', width = 55, default = 65},
{type = 'spinner', text = 'Renew', key = 't_Ren', width = 55, default = 0},
{type = 'ruler'},{type = 'spacer'},

--PLAYER
{type = 'header', text = 'Player', align = 'center'},
{type = 'text', text = 'Player health values', align = 'center'},
{type = 'spinner', text = 'Gift of the Naaru', key = 'p_Gift', width = 55, default = 20},
{type = 'spinner', text = 'Holy Word: Serenity', key = 'p_HWSE', width = 55, default = 55},
{type = 'spinner', text = 'Flash Heal', key = 'p_FH', width = 55, default = 65},
{type = 'ruler'},{type = 'spacer'},

--LOWEST
{type = 'header', text = 'Lowest', align = 'center'},
{type = 'text', text = 'Lowest health values', align = 'center'},
{type = 'spinner', text = 'Holy Word: Serenity', key = 'l_HWSE', width = 55, default = 65},
{type = 'spinner', text = 'Flash Heal', key = 'l_FH', width = 55, default = 75},
{type = 'spinner', text = 'Heal', key = 'l_H', width = 55, default = 95},
{type = 'ruler'},{type = 'spacer'},

--MOVING
{type = 'header', text = 'Movement', align = 'center'},
{type = 'checkbox', text = 'Angelic Feather', key = 'm_AF', width = 55, default = false},
{type = 'checkbox', text = 'Body and Mind', key = 'm_Body', width = 55, default = false},
{type = 'text', text = 'Lowest health and moving values', align = 'center'},
{type = 'spinner', text = 'Holy Word: Serenity', key = 'm_HWSE', width = 55, default = 50},
{type = 'spinner', text = 'Flash Heal Surge of Light', key = 'm_FH', width = 55, default = 70},
{type = 'spinner', text = 'Renew', key = 'm_Ren', width = 55, default = 40},

}

local exeOnLoad = function()
  print('|cffFACC2E Holy Priest Rotation loaded|r')
  print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

    NeP.Interface:AddToggle({
    key = 'xDPS',
    name = 'DPS Mode',
    text = 'ON/OFF DPS Mode',
    icon = 'Interface\\ICONS\\inv_staff_2h_artifactheartofkure_d_06', --toggle(xDPS)
  })

  NeP.Interface:AddToggle({
    key = 'disp',
    name = 'Dispell',
    text = 'ON/OFF Dispel All',
    icon = 'Interface\\ICONS\\spell_holy_dispelmagic', --toggle(disp)
  })

  NeP.Interface:AddToggle({
    key = 'mana',
    name = 'Mana Management',
    text = 'ON/OFF Mana Management',
    icon = 'Interface\\ICONS\\inv_misc_ancient_mana', --toggle(mana)
  })
    
end


local Cooldowns = {
{'!Guardian Spirit', 'UI(c_GSt) & !player.spell(Holy Word: Serenity).cooldown == 0 & {health <= UI(c_GSspint) || player.health <= UI(c_GSspint)}', 'lowest(tank)'},
{'!Guardian Spirit', 'UI(c_GS) & !player.spell(Holy Word: Serenity).cooldown == 0 & health <= UI(c_GSspin) & !is(player)', 'lowest'},
{'Desperate Prayer', 'UI(c_DP) & health <= UI(c_DPspin) & !buff(Guardian Spirit)', 'player'},
{'Arcane Torrent', 'player.mana < 97 & UI(dps_at)', 'player'},
{'Light of T\'uure', 'UI(c_lot1) & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !lowest.health <= 40 & !keybind(lshift) & {player.spell(Light of T\'uure).charges == 2||health <= UI(c_LoTspint)}', 'lowest(tank)'},
{'Light of T\'uure', 'UI(c_LoT) & health <= UI(c_LoTspin) & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !health <= 40 & !keybind(lshift)', 'lowest'},
{'Light\'s Judgment', 'UI(LJ_check)&range<61&area(15).enemies>=UI(LJ_spin)', 'enemies.ground'}
}

local Guidinghand = {
{'#147007', '!buff(Guiding Hand) & health > 60 & player.equipped(147007) & partycheck == 3', {'tank1','tank2'}}, -- Deceiver's Grand Design
{'#147007', '!buff(Guiding Hand) & health > 60 & player.equipped(147007) & partycheck == 2', {'tank1','player'}},
}
local Archive = {
{'#147006', 'health <= 50 & !player.moving & equipped(147006) & {player.spell(Holy Word: Serenity).cooldown > gcd || player.mana <= 5}', {'lowest(tank)','lowest'}},
}

local Trinkets = {
{Guidinghand},
{Archive},
--Top Trinket.
{'#trinket1', 'UI(trinket_1)', 'target'},
--Bottom Trinket
{'#trinket2', 'UI(trinket_2)', 'target'},
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

local DPS = {
{'Holy Word: Chastise', 'UI(d_HWC) & infront', 'target'},
{{
{'Holy Fire', 'UI(d_HF) & infront & !debuff(Holy Fire).count == 2 & infront','target'},
{'Holy Fire', 'UI(d_HF) & range <= 40 & infront & !debuff(Holy Fire).count == 2 & combat', 'enemies'},
{'Holy Nova', 'UI(d_nova) & {player.area(10).enemies >= 2 || {player.moving & range <= 10}}','target'},
},'!player.buff(Apotheosis)'},
{'Smite', 'infront & UI(d_smite) & !player.moving', 'target'},
}

local Tankpred = {
{'!Holy Word: Serenity', 'health.predicted <= 40 & !player.buff(Divinity)', 'lowest(tank)'},
{'!Holy Word: Serenity', 'health.predicted <= UI(t_HWSE) & !player.casting(Prayer of Healing) & !player.buff(Divinity)', 'lowest(tank)'},
{'Flash Heal', 'health.predicted <= UI(t_FH)', 'lowest(tank)'},
{'Renew', '!buff(Renew) & health.predicted <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'lowest(tank)'},
}

local Tank = {
{'!Holy Word: Serenity', 'health <= 40 & !player.buff(Divinity)', 'lowest(tank)'},
{'!Holy Word: Serenity', 'health <= UI(t_HWSE) & !player.casting(Prayer of Healing) & !player.buff(Divinity)', 'lowest(tank)'},
{'Flash Heal', 'health <= UI(t_FH)', 'lowest(tank)'},
{'Renew', '!buff(Renew) & health<= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'lowest(tank)'},
}

local Playerpred = {
{'!Holy Word: Serenity', 'health.predicted <= 40 & !spell(Desperate Prayer).cooldown == 0 & !player.buff(Divinity)', 'player'},
{'!Holy Word: Serenity', 'health.predicted <= UI(p_HWSE) & !spell(Desperate Prayer).cooldown == 0 & !player.casting(Prayer of Healing) & !player.buff(Divinity)', 'player'},
{'Gift of the Naaru', 'health.predicted <= UI(p_Gift)', 'player'},
{'Flash Heal', 'health.predicted <= UI(p_FH)', 'player'},
}

local Player = {
{'!Holy Word: Serenity', 'health <= 40 & !spell(Desperate Prayer).cooldown == 0 & !player.buff(Divinity)', 'player'},
{'!Holy Word: Serenity', 'health <= UI(p_HWSE) & !spell(Desperate Prayer).cooldown == 0 & !player.casting(Prayer of Healing) & !player.buff(Divinity)', 'player'},
{'Gift of the Naaru', 'health <= UI(p_Gift)', 'player'},
{'Flash Heal', 'health <= UI(p_FH)', 'player'},
}  

local Lowestpred = {
{'!Holy Word: Serenity', 'health <= 40 & !player.buff(Divinity)', 'lowestp'},
{'!Holy Word: Serenity', 'health <= UI(l_HWSE) & !player.casting(Prayer of Healing) & !player.buff(Divinity)', 'lowestp'},
{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= {gcd*2}+1 & health < 100', 'lowestp'},
{'Gift of the Naaru', 'health <= 40', 'lowestp'},
{'Binding Heal', '!health <= UI(l_HWSE) & !is(player) & {area(20, 95).heal >= 2 || {player.health <= 95 & health <= 95}}', 'lowestp'},
{'Flash Heal', 'health <= UI(l_FH)', 'lowestp'},
{'Heal', 'health <= UI(l_H) & !toggle(mana)', 'lowestp'},
}

local Lowest = {
{'!Holy Word: Serenity', 'health <= 40 & !player.buff(Divinity)', 'lowest'},
{'!Holy Word: Serenity', 'health <= UI(l_HWSE) & !player.casting(Prayer of Healing) & !player.buff(Divinity)', 'lowest'},
{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= {gcd*2}+1 & health < 100', 'lowest'},
{'Gift of the Naaru', 'health <= 40', 'lowest'},
{'Binding Heal', '!health <= UI(l_HWSE) & !is(player) & {area(20, 95).heal >= 2 || {player.health <= 95 & health <= 95}}', 'lowest'},
{'Flash Heal', 'health <= UI(l_FH)', 'lowest'},
{'Heal', 'health <= UI(l_H) & !toggle(mana)', 'lowest'},
}

local Spirit = {
{'!Holy Word: Serenity', 'health <= 40 & !player.buff(Divinity)', 'lowest'},
{'!Holy Word: Serenity', 'health <= UI(l_HWSE) & !player.casting(Prayer of Healing) & !player.buff(Divinity)', 'lowest'},
{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= {gcd*2}+1 & health < 100', 'lowest'},
{'Gift of the Naaru', 'health <= 40', 'lowest'},
{'Flash Heal', 'health <= 100', 'lowest'},
}


local Solo = {
{'Apotheosis', nil,'player'},
{'Gift of the Naaru', 'health <= UI(full_Gift)', 'player'},
{'Holy Word: Serenity', 'health <= UI(full_HWSE) & !player.buff(Divinity)', 'player'},
{'Flash Heal', 'health <= UI(full_FH)', 'player'},
{'Holy Word: Chastise', 'infront' , 'target'},
{{
{'Holy Nova', 'area(10).enemies >= 4 & toggle(AOE)', 'player'},
{'Holy Fire', '!debuff(Holy Fire).count == 2 & infront' , 'target'},
{'Holy Fire', 'range <= 40 & infront & !debuff(Holy Fire).count == 2 & combat', 'enemies'},
},'!player.buff(Apotheosis)'},
{'Smite', nil, 'target'},
}

local PoMooc = {
{'Prayer of Mending', 'buff(Prayer of Mending).duration <= 15 & partycheck == 3', {'tank1','tank2'}},
{'Prayer of Mending', 'buff(Prayer of Mending).count < 5 & partycheck == 3', {'tank1','tank2'}},
{'Prayer of Mending', '!buff(Prayer of Mending) & partycheck == 2', {'tank','player','lowest'}},
}

local Felexplosive = {
{{
{'Holy Word: Chastise', 'id(120651) & range <= 30' , 'enemies'},
{'Holy Fire', 'id(120651) & range <= 40', 'enemies'}, 
{'Smite', 'id(120651) & range <= 40', 'enemies'}, 
},'lowest.health >= 80 & UI(myth_fel) & enemies.infront'},
}



local Sanctify = {
{'!Holy Word: Sanctify', 'area(10, 85).heal = 6','lowest.ground'},
{'!Holy Word: Sanctify', 'area(10, 85).heal >= 5','lowest.ground'},
{'!Holy Word: Sanctify', 'area(10, 85).heal >= 4','lowest.ground'},
{{
{'!Holy Word: Sanctify', 'area(10, 85).heal >= 3','lowest.ground'},
},'partycheck ~= 3 || set_bonus(T20)= 4'},
}


local PoM = {
{'Prayer of Mending', '!buff(Prayer of Mending) & !lowest.health <= 60 & !UI(myth_heal)', {'tank','player','lowest'}},
}

local Keybinds = {
{{
{'!Mass Dispel', '!advanced', 'cursor.ground'},
{'!Mass Dispel', nil, 'mouseover.ground'},
},'UI(k_MD) & keybind(lcontrol)'},
{{
{'!Holy Word: Sanctify', '!advanced', 'cursor.ground'},
{'!Holy Word: Sanctify', 'area(10, 99).heal >= 3 & advanced','lowest.ground'},
{'!Holy Word: Sanctify', 'advanced', 'tank.ground'},
{'Prayer of Healing', 'health < 100','lowest'},
},'keybind(lshift) & UI(k_HWS)'},
{'%pause', 'keybind(lalt)& UI(k_P)'},
}

local Beforepull = {
--Potion of Prolonged Power
{'#142117', 'pull_timer <= 3 & UI(s_PPull) & !buff(Potion of Prolonged Power)', 'player'},
{'Prayer of Mending', 'buff(Prayer of Mending).duration <= 15', {'tank1','tank2'}},
{'Prayer of Mending', 'buff(Prayer of Mending).count < 5', {'tank1','tank2'}},
}

local Moving = {
{Sanctify,'!player.buff(Divinity)'},
{'Holy Word: Serenity', 'health <= UI(m_HWSE) & !player.buff(Divinity)', 'lowest'},
{'Gift of the Naaru', 'health <= 20', 'lowest'},
{'Flash Heal', 'player.buff(Surge of Light) & {{player.buff(Surge of Light).duration <= {gcd*2}+1 & health < 100}||health <= UI(m_FH)}', 'lowest'},
{'Renew', '!buff(Renew) & {UI(myth_heal) || health <= UI(m_Ren)}', 'lowest'},
}

local AOE = {
{Sanctify,'!player.buff(Divinity) & !player.casting(Prayer of Healing)'},
{'Prayer of Healing', 'area(40, 85).heal >= 10', 'lowest'},
{'!Prayer of Healing', 'area(10, 85).heal >= 5 & {player.buff(Power of the Naaru) || player.buff(Divinity)}', 'lowest'},
{'!Prayer of Healing', 'area(15, 85).heal >= 5 & {player.buff(Power of the Naaru) || player.buff(Divinity)}', 'lowest'},
{'!Prayer of Healing', 'area(20, 85).heal >= 5 & {player.buff(Power of the Naaru) || player.buff(Divinity)}', 'lowest'},
{'!Prayer of Healing', 'area(25, 85).heal >= 5 & {player.buff(Power of the Naaru) || player.buff(Divinity)}', 'lowest'},
{'!Prayer of Healing', 'area(30, 85).heal >= 5 & {player.buff(Power of the Naaru) || player.buff(Divinity)}', 'lowest'},
{'Prayer of Healing', 'area(40, 85).heal >= 4 & partycheck==2', 'lowest'},
}

local Raid = {
{PoM,'!tank.health <= 50 & !player.moving'},
{Tankpred,'tank.health.predicted < 70 & tank.exists'},
{Playerpred,'player.health.predicted <= 50'},
{Lowestpred,'lowestp.health <100'},
{'!Flash Heal', 'health < UI(l_FH) & player.casting(Smite)', 'lowest'},
}

local Mythic = {
{'!Holy Word: Sanctify', 'area(10, 90).heal >= 3 & range <= 40 & !player.buff(Divinity)','lowest.ground'},
{'Prayer of Mending', 'health > 95 & !player.moving & !buff(Prayer of Mending) & partycheck ~=3', {'tank1','tank2','lowest','player'}},
{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & health < 100', 'lowest'},
{'Renew', '!buff(Renew) & player.moving', 'lowest'},
{'Renew', '!buff(Renew) & player.moving', 'friendly'},
{'!Holy Word: Serenity', 'health <= 75 & !player.buff(Divinity)', 'lowest'},
{'!Gift of the Naaru', 'health <= 50', 'lowest'},
{'Binding Heal', '!health <= 70 & !is(player) & {area(20, 99).heal >= 2 || {player.health < 100 & health < 100}}', 'lowest'},
{'Flash Heal', 'health <= 90', 'lowest'},
{'Heal', 'health <= 95', 'lowest'},
}

local Party = {
{PoM,'!tank.health <= 50 & !player.moving'},
{Tank,'tank.health < 50 & tank.exists'},
{Player,'player.health<= 45'},
{Lowest,'lowest.health <100'},
{'!Flash Heal', 'health < UI(l_FH) & player.casting(Smite)', 'lowest'},
}

local Stopcasting ={
{'!/stopcasting','!player.area(40,95).heal >= 5 & player.casting(Prayer of Healing) & partcheck == 3'},
{'!/stopcasting','lowest.health >= 100 & !player.casting.percent >= 80 & {player.casting(Heal) || player.casting(Flash Heal) || player.casting(Binding Heal) }'},
}

local inCombat = {
{'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
{'!Purify', 'toggle(disp) & player.spell(Purify).cooldown == 0 & purify & area(8).friendly == 1 & UI(disp_ang) & range <= 40', 'friendly'},
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
{'fade', '{target.inmelee || player.area(2).enemies >= 1} & player.aggro & !partycheck == 1'},
{'/cast [@player] Angelic Feather', 'movingfor >= 2 & !buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player'},
{'Body and Mind', 'movingfor >= 2 & !buff(Body And Mind) & UI(m_Body)', 'player'},
{Felexplosive},
{'!Holy Word: Chastise', 'toggle(interrupts) & interruptAt(70) & infront', 'target'},
{Potions,'!player.buff(Spirit of Redemption)'},
{Cooldowns,'!player.buff(Spirit of Redemption)'},
{Trinkets,'!player.buff(Spirit of Redemption) & !keybind(lshift)'},
{Keybinds}, 
{Stopcasting,'!player.buff(Spirit of Redemption) & !UI(myth_heal)'},
{Moving,'player.moving'},
{AOE,'toggle(AOE) & !UI(myth_heal)'},
{Spirit,'player.buff(Spirit of Redemption)'},
{{
{Raid,'partycheck == 3'},
{Mythic,'partycheck == 2 & UI(myth_heal)'},
{Party,'partycheck == 2 & !UI(myth_heal)'},
{Solo,'partycheck == 1 || toggle(xDPS)'},
{DPS,'lowest.health > UI(l_FH)'},
},'!player.buff(Spirit of Redemption)'},
} 



local outCombat = {
{'!/stopcasting','debuff(Quake).any.duration <= gcd & debuff(Quake).any','player'}, --Quaking 
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
{'/cast [@player] Angelic Feather', 'movingfor >= 2 & !buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF) & !inareaid == 1040', 'player'},
{'Body and Mind', 'movingfor >= 2 & !buff(Body And Mind) & UI(m_Body) !inareaid == 1040', 'player'},
{Cooldowns,'partycheck == 2 & UI(myth_heal)'},
{Potions},
{Keybinds}, 
{Beforepull,'pull_timer >= 1 & pull_timer <= 20'},
{AOE,'toggle(AOE) & !UI(myth_heal)'}, 
{Mythic,'UI(myth_heal)'},
{PoMooc,'partycheck >=2 & !player.moving & UI(ooc_heal) & !UI(myth_heal)'},

}


NeP.CR:Add(257, {
  name = '|cffFACC2E [Yobleed]|r Priest - |cffFACC2EHoly|r',
  ic = {{inCombat,'!player.channeling(Divine Hymn)'}},
  ooc = {{outCombat,'!player.channeling(Divine Hymn)'}},
  gui = GUI,
  gui_st = {title='Yobleed\'s Priest Pack: Holy', width='512', height='256', color='FACC2E'},
  load = exeOnLoad,
  ids = yobleed.spell_ids
})
