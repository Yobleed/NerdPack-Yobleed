local _, yobleed = ...
local NeP = NeP

--[[
{'Heal', 'health<100', {'player, 'tank', 'lowest'}},
Priority by array order
player > tank > lowest
]]--

--Spirit Realm = 235621
local GUI = {
  -- GUI Header
  {
    type = "texture",
    texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\holy.blp",
    width = 512,
    height = 256,
    offset = 90,
    y = 42,
    center = true
  },
  --GENERAL
  {type = 'header', text = 'General', align = 'center'},
  {type = 'checkbox', text = 'Healing OOC', key = 'ooc_heal', width = 55, default = false},
  {type = 'checkbox', text = 'Mythic+ Healing', key = 'myth_heal', width = 55, default = false},
  {type = 'checkbox', text = 'Attack Fel Explosives', key = 'myth_fel', width = 55, default = false},
  {type = 'ruler'},{type = 'spacer'},

  --TOS DISPELLING
  {type = 'header', text = 'Dispel', align = 'center'},
  {type = 'text', text = 'Advanced Only', align = 'center'},
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
  {type = 'spinner', text = 'Binding Heal', key = 'l_BH', width = 55, default = 85},
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
    name = 'Solo Mode',
    text = 'ON/OFF Solo Mode',
    icon = 'Interface\\ICONS\\spell_holy_holysmite', --toggle(xDPS)
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
{'!Guardian Spirit', 'UI(c_GSt) & {health <= UI(c_GSspint) || player.health <= UI(c_GSspint)}', 'tank1'},
{'!Guardian Spirit', 'UI(c_GSt) & {health <= UI(c_GSspint) || player.health <= UI(c_GSspint)}', 'tank2'},
{'!Guardian Spirit', 'UI(c_GS) & health <= UI(c_GSspin)', 'lowest'},
{'Desperate Prayer', 'UI(c_DP) & health <= UI(c_DPspin) & !buff(Guardian Spirit) & !channeling(Divine Hymn)', 'player'},
{'Arcane Torrent', 'mana < 97', 'player'},
{'Light of T\'uure', '{UI(c_lot1) & player.spell(Light of T\'uure).charges == 2 & !lowest.health <= 40 & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift) & partycheck == 2 & !UI(myth_heal)} || {UI(c_LoTt) & health <= UI(c_LoTspint) & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift) & partycheck == 2}', 'tank'},
{'Light of T\'uure', '{UI(c_lot1) & player.spell(Light of T\'uure).charges == 2 & !lowest.health <= 40 & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift) & health < tank2.health} ||{UI(c_LoTt) & health <= UI(c_LoTspint) & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift) & health < tank2.health}', 'tank1'},
{'Light of T\'uure', '{UI(c_lot1) & player.spell(Light of T\'uure).charges == 2 & !lowest.health <= 40 & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift) & health < tank1.health} || {UI(c_LoTt) & tank2.health <= UI(c_LoTspint) & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !toggle(xDPS) & !lowestp.health <= 40 & !keybind(lshift) & health < tank1.health}', 'tank2'},
{'Light of T\'uure', 'UI(c_LoT) & health <= UI(c_LoTspin) & !player.channeling(Divine Hymn) & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !toggle(xDPS) & !health <= 40 & !keybind(lshift)', 'lowest'},
}

local Trinkets = {
  --Top Trinket usage if UI enables it.
  {'#trinket1', 'UI(trinket_1) & !tank1.buff(Guiding Hand) & tank1.health < tank2.health & tank1.health > 60 & player.equipped(The Deceiver\'s Grand Design)', 'tank1'}, -- Deceiver's Grand Design
  {'#trinket1', 'UI(trinket_1) & !tank2.buff(Guiding Hand) & tank2.health < tank1.health & tank2.health > 60 & player.equipped(The Deceiver\'s Grand Design)', 'tank2'},
  {'#trinket1', 'UI(trinket_1) & !tank.buff(Guiding Hand) & tank.health > 60 & player.equipped(The Deceiver\'s Grand Design)', 'tank'},
  {'#trinket1', 'UI(trinket_1) & !player.buff(Guiding Hand) & player.health > 60 & player.equipped(The Deceiver\'s Grand Design) & UI(myth_heal)', 'player'},
  {'#trinket1', 'UI(trinket_1)'},
  --Bottom Trinket usage if UI enables it.
  {'!#trinket2', 'UI(trinket_2) & lowest.health <= 60 & !player.moving & equipped(Archive of Faith) & {player.spell(Holy Word: Serenity).cooldown > gcd || player.mana <= 5}', 'lowest'},
}

local Potions = {
  {'#Healthstone', 'UI(p_HS) & player.health <= UI(p_HSspin)','player'},
  {'#Ancient Healing Potion', 'UI(p_AHP) & player.health <= UI(p_AHPspin)','player'},
  {'#Ancient Mana Potion', 'UI(p_AMP) & player.mana <= UI(p_AMPspin)','player'},
}

local DPS = {
  {{
    {'Holy Word: Chastise', 'UI(d_HWC) & infront' , 'target'},
    {'Holy Fire', 'UI(d_HF) & infront & !debuff(Holy Fire).count == 2 & infront & !player.buff(Apotheosis)' , 'target'},
    {'Holy Fire', 'UI(d_HF) & range <= 40 & infront & !debuff(Holy Fire).count == 2 & combat & !player.buff(Apotheosis)', 'enemies'},
    {'Holy Nova', '{player.area(10).enemies >= 2 & UI(d_nova) & !player.buff(Apotheosis)} || {player.moving & UI(d_nova) & range <= 10 & !player.buff(Apotheosis)}','target'},
  },'!player.mana <= 35'},
  {'Smite', 'infront & UI(d_smite) & !player.moving', 'target'},
}

local Solo = {
  {'Apotheosis','talent(7,1) & target.debuff(Holy Fire).count == 2','player'},
  {'Gift of the Naaru', 'health <= UI(full_Gift)', 'player'},
  {'Holy Word: Serenity', 'health <= UI(full_HWSE)', 'player'},
  {'Flash Heal', 'health <= UI(full_FH)', 'player'},
  {'Holy Word: Chastise', 'infront' , 'target'},
  {'Holy Nova', 'area(10).enemies >= 4 & toggle(AOE) & !buff(Apotheosis)', 'player'},
  {'Holy Fire', 'UI(d_HF) & infront & !debuff(Holy Fire).count == 2 & infront & !player.buff(Apotheosis)' , 'target'},
  {'Holy Fire', 'UI(d_HF) & range <= 40 & infront & !debuff(Holy Fire).count == 2 & combat & !player.buff(Apotheosis)', 'enemies'},
  {'Smite', nil, 'target'},
}

local Tankpred = {
  {'!Holy Word: Serenity', 'health.predicted <= UI(t_HWSE) & !player.buff(Divinity)', 'tank1'},
  {'!Holy Word: Serenity', 'health.predicted <= UI(t_HWSE) & !player.buff(Divinity)', 'tank2'},
  {'Heal', 'health.predicted <= UI(t_FH) & player.spell(Heal)casttime <= 1.2', 'tank1'},
  {'Heal', 'health.predicted <= UI(t_FH) & player.spell(Heal)casttime <= 1.2', 'tank2'},
  {'Flash Heal', 'health.predicted <= UI(t_FH)', 'tank1'},
  {'Flash Heal', 'health.predicted <= UI(t_FH)', 'tank2'},
  {'Renew', '!buff(Renew) & health.predicted <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank1'},
  {'Renew', '!buff(Renew) & health.predicted <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank2'},
}

local Tank = {
  {'!Holy Word: Serenity', 'health <= UI(t_HWSE) & !player.buff(Divinity)', 'tank1'},
  {'!Holy Word: Serenity', 'health <= UI(t_HWSE) & !player.buff(Divinity)', 'tank2'},
  {'Heal', 'health <= UI(t_FH) & player.spell(Heal)casttime <= 1.2', 'tank1'},
  {'Heal', 'health <= UI(t_FH) & player.spell(Heal)casttime <= 1.2', 'tank2'},
  {'Flash Heal', 'health <= UI(t_FH)', 'tank1'},
  {'Flash Heal', 'health <= UI(t_FH)', 'tank2'},
  {'Renew', '!buff(Renew) & health <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank1'},
  {'Renew', '!buff(Renew) & health <= UI(t_Ren) & !player.buff(Spirit of Redemption)', 'tank2'},
}

local Playerpred = {
  {'!Holy Word: Serenity', 'health.predicted <= UI(p_HWSE) & !buff(Divinity) & !spell(Desperate Prayer).cooldown == 0', 'player'},
  {'Gift of the Naaru', 'health.predicted <= UI(p_Gift)', 'player'},
  {'Binding Heal', 'health <= UI(l_BH) & !is(player) & player.health.predicted <= 95 & !player.buff(Surge of Light)', 'lowestp'},
  {'Heal', 'health.predicted <= UI(p_FH) & player.spell(Heal)casttime <= 1.2', 'player'},
  {'Flash Heal', 'health.predicted <= UI(p_FH)', 'player'},
}

local Player = {
  {'!Holy Word: Serenity', 'health <= UI(p_HWSE) & !buff(Divinity) & !spell(Desperate Prayer).cooldown == 0', 'player'},
  {'Gift of the Naaru', 'health <= UI(p_Gift)', 'player'},
  {'Binding Heal', 'health <= UI(l_BH) & !is(player) & player.health <= 95 & !player.buff(Surge of Light)', 'lowest'},
  {'Heal', 'health.predicted <= UI(p_FH) & player.spell(Heal)casttime <= 1.2', 'player'},
  {'Flash Heal', 'health <= UI(p_FH)', 'player'},
}

local Lowestpred = {
  {'!Holy Word: Serenity', 'health <= UI(l_HWSE) & !player.buff(Divinity)', 'lowestp'},
  {'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & health < 100', 'lowestp'},
  {'Gift of the Naaru', 'health <= 20 & buff(Guardian Spirit)', 'lowestp'},
  {'Binding Heal', 'health <= UI(l_BH) & !is(player) & player.health.predicted <= 95  & !player.buff(Surge of Light)', 'lowestp'},
  {'Heal', 'health <= UI(l_H) & player.spell(Heal)casttime <= 1.2', 'lowestp'},
  {'Flash Heal', 'health <= UI(l_FH)', 'lowestp'},
  {'Heal', 'health <= UI(l_H) & !toggle(mana)', 'lowestp'},
}

local Lowest = {
  {'!Holy Word: Serenity', 'health <= UI(l_HWSE) & !player.buff(Divinity)', 'lowest'},
  {'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & health < 100', 'lowest'},
  {'Gift of the Naaru', 'health <= 20 & buff(Guardian Spirit)', 'lowest'},
  {'Binding Heal', 'health <= UI(l_BH) & !is(player) & player.health <= 95 & !player.buff(Surge of Light)', 'lowest'},
  {'Heal', 'health <= UI(l_H) & player.spell(Heal)casttime <= 1.2', 'lowest'},
  {'Flash Heal', 'health <= UI(l_FH)', 'lowest'},
  {'Heal', 'health <= UI(l_H) & !toggle(mana)', 'lowest'},
}

local PoMooc = {
  {'Prayer of Mending', '!buff(Prayer of Mending) & pull_timer <= 20', 'tank'},
  {'Prayer of Mending', '!buff(Prayer of Mending) & tank2.buff(Prayer of Mending) & UI(pull_PoM) & partycheck == 3', 'tank1'},
  {'Prayer of Mending', '!buff(Prayer of Mending) & tank1.buff(Prayer of Mending) & UI(pull_PoM) & partycheck == 3', 'tank2'},
  {'Prayer of Mending', 'buff(Prayer of Mending).duration < tank2.buff(Prayer of Mending).duration & UI(pull_PoM) & partycheck == 3', 'tank1'},
  {'Prayer of Mending', 'buff(Prayer of Mending).duration < tank1.buff(Prayer of Mending).duration & UI(pull_PoM) & partycheck == 3', 'tank2'},
  {'Prayer of Mending', 'tank1.buff(Prayer of Mending).duration > buff(Prayer of Mending).duration & UI(pull_PoM)', 'player'},
  {'Prayer of Mending', 'tank2.buff(Prayer of Mending).duration > buff(Prayer of Mending).duration & UI(pull_PoM)', 'player'},
  {'Prayer of Mending', 'player.buff(Prayer of Mending).duration > buff(Prayer of Mending).duration & UI(pull_PoM)', 'tank1'},
  {'Prayer of Mending', 'player.buff(Prayer of Mending).duration > buff(Prayer of Mending).duration & UI(pull_PoM)', 'tank2'},
  {'Prayer of Mending', '!buff(Prayer of Mending) & tank1.buff(Prayer of Mending) & UI(pull_PoM) & partycheck == 3', 'player'},
  {'Prayer of Mending', 'buff(Prayer of Mending).duration < tank1.buff(Prayer of Mending).duration & UI(pull_PoM) & !player.moving', 'friendly'},
  {'Prayer of Mending', '!buff(Prayer of Mending) & UI(pull_PoM) & range <= 40 & tank.buff(Prayer of Mending) & !player.moving', 'friendly'},
}
local Felexplosive = {
  {'Holy Word: Chastise', 'id(120651) & range <= 30 & infront' , 'enemies'},
  {'Holy Fire', 'id(120651) & range <= 40 & infront', 'enemies'},
  {'Smite', 'id(120651) & range <= 40 & infront', 'enemies'},
}

local Mythic = {
  {'!#Archive of Faith', 'UI(trinket_2) & health <= 60 & !player.moving & {player.spell(Holy Word: Serenity).cooldown > gcd || player.mana <= 5}', 'lowest'},
  {'Prayer of Mending', 'lowest.health > 90 & !player.moving & !buff(Prayer of Mending)', 'tank'},
  {'Prayer of Mending', 'health > 90 & !player.moving & !buff(Prayer of Mending)', 'lowest'},
  {'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & health < 100', 'lowest'},
  {'Renew', '!buff(Renew) & player.moving', 'lowest'},
  {'Renew', '!buff(Renew) & player.moving', 'friendly'},
  {'Renew', 'health < 100 & health > 70 & !buff(Renew)', 'lowest'},
  {'!Holy Word: Serenity', 'health <= UI(l_HWSE)', 'lowest'},
  {'!Gift of the Naaru', 'health <= 40', 'lowest'},
  {'Heal', 'health <= 90 & player.spell(Heal)casttime <= 1.2 & !health <= 50', 'lowest'},
  {'Flash Heal', 'health <= 90', 'lowest'},
  {'Binding Heal', 'health <= 95 & !is(player) & player.health <= 95 & !player.buff(Surge of Light)', 'lowest'},
  {'Heal', 'health <= 95', 'lowest'},


}

local Sanctify = {
  {'!Holy Word: Sanctify', 'tank.area(10, 90).heal >= 5 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','tank.ground'},
  {'!Holy Word: Sanctify', 'lowest.area(10, 90).heal >= 5 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowest.ground'},
  {{
    {'!Holy Word: Sanctify', 'tank.area(10, 90).heal >= 4 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','tank.ground'},
    {'!Holy Word: Sanctify', 'lowest.area(10, 90).heal >= 4 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowest.ground'},
    {'!Holy Word: Sanctify', 'tank.area(10, 90).heal >= 3 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','tank.ground'},
    {'!Holy Word: Sanctify', 'lowest.area(10, 90).heal >= 3 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity)','lowest.ground'},
  },'set_bonus(T20)= 4'},
  {'!Holy Word: Sanctify', 'tank.area(10, 90).heal >= 3 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity) & partycheck == 2','tank.ground'},
  {'!Holy Word: Sanctify', 'lowest.area(10, 90).heal >= 3 & toggle(AOE) & !player.channeling(Divine Hymn) & !lowestp.debuff(Ignite Soul) & !player.buff(Divinity) & partycheck == 2','lowest.ground'},
}

local PoH = {
  {'!/stopcasting', '!lowestp.area(30, 90).heal >= 4 & player.casting(Prayer of Healing) & partycheck==3'},
  {'Prayer of Healing', 'area(10, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & partycheck==3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
  {'Prayer of Healing', 'area(15, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & partycheck==3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
  {'Prayer of Healing', 'area(20, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & partycheck==3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
  {'Prayer of Healing', 'area(25, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & partycheck==3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
  {'Prayer of Healing', 'area(30, 90).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & partycheck==3 & player.buff(Power of the Naaru) & player.buff(Divinity)', 'lowestp'},
  {'Prayer of Healing', 'area(10, 85).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown == 0 & partycheck==3', 'lowestp'},
  {'Prayer of Healing', 'area(15, 85).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown == 0 & partycheck==3', 'lowestp'},
  {'Prayer of Healing', 'area(20, 85).heal >= 4 & toggle(AOE) & !tank.health <= 20 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown == 0 & partycheck==3', 'lowestp'},
  {'Prayer of Healing', 'area(40, 85).heal >= 4 & toggle(AOE) & !tank.health <= 50 & !toggle(xDPS) & !player.channeling(Divine Hymn) & !debuff(Ignite Soul) & !player.spell(Prayer of Mending).cooldown == 0 & !partycheck==3', 'lowest'},
}

local PoM = {
  {'Prayer of Mending', '!buff(Prayer of Mending)', 'tank1'},
  {'Prayer of Mending', '!buff(Prayer of Mending)', 'tank2'},
  {'Prayer of Mending', 'buff(Prayer of Mending).duration < tank2.buff(Prayer of Mending).duration', 'tank1'},
  {'Prayer of Mending', 'buff(Prayer of Mending).duration < tank1.buff(Prayer of Mending).duration', 'tank2'},
  {'Prayer of Mending', '!buff(Prayer of Mending).count > 5', 'tank1'},
  {'Prayer of Mending', '!buff(Prayer of Mending).count > 5', 'tank2'},
  {'Prayer of Mending', '!buff(Prayer of Mending)', 'tank'},
  {'Prayer of Mending', '!buff(Prayer of Mending)', 'lowestp'},
}

local Keybinds = {
  {'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD) & !advanced', 'cursor.ground'},
  {'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
  -----------------------------------------------------------------------------T20-----------------------------------------------------------------------
  {{
    {'!Holy Word: Sanctify', 'keybind(lshift) & UI(k_HWS) & !advanced', 'cursor.ground'},
    {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 6 & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
    {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 5 & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
    {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 4 & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
    {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 3 & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
    {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 2 & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
    {'!Holy Word: Sanctify', 'keybind(lshift) & UI(k_HWS) & advanced', 'tank.ground'},
  },'set_bonus(T20)>= 2'},
  -------------------------------------------------------------------------------------------------------------------------------------------------------
  {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 6 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
  {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 5 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
  {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 4 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
  {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 3 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
  {'!Holy Word: Sanctify', 'lowestp.area(10, 99).heal >= 2 & !player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced','lowestp.ground'},
  {'!Holy Word: Sanctify', '!player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & advanced', 'tank.ground'},
  {'!Holy Word: Sanctify', '!player.buff(Power of the Naaru) & keybind(lshift) & UI(k_HWS) & !advanced', 'cursor.ground'},
  {'Prayer of Healing', 'area(10,85).heal >= 4 & keybind(lshift) & UI(k_HWS) & !advanced & buff(Power of the Naaru)' , 'player'},
  {'Prayer of Healing', 'area(20,85).heal >= 4 & keybind(lshift) & UI(k_HWS) & !advanced & buff(Power of the Naaru)' , 'player'},
  {'Prayer of Healing', 'area(10, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
  {'Prayer of Healing', 'area(20, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
  {'Prayer of Healing', 'area(30, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
  {'Prayer of Healing', 'area(40, 85).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
  {'Prayer of Healing', 'area(20, 99).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
  {'Prayer of Healing', 'area(30, 99).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
  {'Prayer of Healing', 'area(40, 99).heal >= 4 & keybind(lshift) & UI(k_HWS) & player.buff(Power of the Naaru) & advanced' , 'lowestp'},
  {'Prayer of Healing', 'health <= 100 & keybind(lshift)' , 'lowestp'},
  {'%pause', 'keybind(lalt)& UI(k_P)'},
}

local Beforepull = {
  {'#Potion of Prolonged Power', 'pull_timer <= 3 & UI(s_PPull)'}, --Potion of Prolonged Power
  {PoMooc},
  {'Renew', '!buff(Renew) & pull_timer <= gcd & UI(pull_Ren)', 'tank'},
}

local Moving = {
  {Sanctify},
  {'Holy Word: Serenity', 'health <= UI(m_HWSE) & !player.buff(Divinity)', 'lowest'},
  {'Gift of the Naaru', 'health <= 20 & buff(Guardian Spirit)', 'lowest'},
  {'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & health < 100', 'lowest'},
  {'Flash Heal', 'player.buff(Surge of Light) & health <= UI(m_FH)', 'lowest'},
  {'Renew', '!buff(Renew) & UI(myth_heal) & partycheck == 2', 'lowest'},
  {'Renew', '!buff(Renew) & health <= UI(m_Ren)', 'lowest'},
}

local ST = {
  {Playerpred,'partycheck == 3 & !lowestp.health <= 50'},
  {Player, '!tank.health <= 40 & !lowest.health <= 50 & !partycheck == 3'},
  {Lowestpred,'partycheck == 3 & !tank.health.predicted <= 50'},
  {Lowest, '!tank.health <= 50 & !partycheck == 3'},
  {Tankpred,'partycheck == 3'},
  {Tank, '!partycheck == 3'},
}

local AOE = {
  {PoM, '!UI(myth_heal)'},
  {Sanctify},
  {PoH},
}

local inCombat = {
  {'Angelic Feather', 'movingfor >= 2 & !buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player.ground'},
  {'Body and Mind', 'movingfor >= 2 & !buff(Body And Mind) & UI(m_Body)', 'player'},
  {'!Holy Word: Chastise', 'toggle(interrupts) & interruptAt(70) & infront', 'target'},
  {'Fade', 'aggro & !partycheck == 1','player'},
  {Cooldowns},
  {Potions},
  {Trinkets},
  {Keybinds},
  {'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
  {'Purify', 'toggle(disp) & player.spell(Purify).cooldown == 0 & purify & area(9).friendly == 1 & UI(disp_ang) & range <= 40', 'friendly'},
  {Solo, 'toggle(xDPS) & target.range <= 40 & target.infront'},
  {Moving, 'player.moving'},
  {AOE,'!tank.health <= 30 & !lowest.health <= 30 & toggle(AOE) & !player.moving'},
  {Felexplosive, 'lowest.health >= 80 & UI(myth_fel)'},
  {Mythic, 'partycheck == 2 & UI(myth_heal) & !player.moving'},
  {'!/stopcasting','lowest.health >= UI(l_FH) & toggle(mana) & partycheck == 2 & {player.casting(Heal) || player.casting(Flash Heal)}'},
  {'!/stopcasting','lowestp.health >= UI(l_FH) & toggle(mana) & partycheck == 3 & {player.casting(Heal) || player.casting(Flash Heal)}'},
  {'!/stopcasting','lowest.health >= 100 & partycheck == 2 & !player.casting.percent >= 80 & {player.casting(Heal) || player.casting(Flash Heal)}'},
  {'!/stopcasting','lowestp.health >= 100 & partycheck == 3 & !player.casting.percent >= 80 & {player.casting(Heal) || player.casting(Flash Heal)}'},
  {ST, '!UI(myth_heal) & !player.moving'},
  {'Flash Heal', 'health < 100 & player.buff(Spirit of Redemption)', 'lowestp'},
  {'!Flash Heal', 'health < UI(l_FH) & player.casting(Smite)', 'lowest'},
  {DPS, 'lowest.health > UI(l_FH)'},
}

local outCombat = {
  {'Angelic Feather', 'movingfor >= 2 & !buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF) & !inareaid == 1040', 'player.ground'},
  {'Body and Mind', 'movingfor >= 2 & !buff(Body And Mind) & UI(m_Body) & !inareaid == 1040', 'player'},
  {Cooldowns,'partycheck == 2 & UI(myth_heal)'},
  {Potions, 'partycheck == 2 & UI(myth_heal)'},
  {Keybinds},
  {'Purify', 'toggle(disp) & player.spell(Purify).cooldown == 0 & purify & area(9).friendly == 1 & UI(disp_ang) & range <= 40', 'friendly'},
  {'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
  {'#trinket1', 'UI(trinket_1) & !tank1.buff(Guiding Hand) & player.equipped(The Deceiver\'s Grand Design)', 'tank1'}, --Deceiver's
  {'#trinket1', 'UI(trinket_1) & !tank2.buff(Guiding Hand) & player.equipped(The Deceiver\'s Grand Design) & tank1.buff(Guiding Hand).duration <= 115', 'tank2'},
  {'#trinket1', 'UI(trinket_1) & !tank.buff(Guiding Hand) & player.equipped(The Deceiver\'s Grand Design)', 'tank'},
  {'#trinket1', 'UI(trinket_1) & !player.buff(Guiding Hand) & player.equipped(The Deceiver\'s Grand Design) & UI(myth_heal) & tank.buff(Guiding Hand).duration <= 115', 'player'},
  {PoMooc, '!UI(myth_heal) & !partycheck == 1'},
  {Moving, 'player.moving'},
  {AOE,'!tank.health <= 30 & !lowest.health <= 30 & toggle(AOE) & {UI(ooc_heal)||UI(myth_heal)} & !player.moving'},
  {Mythic, 'partycheck == 2 & UI(myth_heal) & !player.moving'},
  {ST,'UI(ooc_heal) & !player.moving'},
  {Beforepull, 'pull_timer <= 20'},
}

NeP.CR:Add(257, {
  name = '|cffFACC2E [Yobleed]|r Priest - |cffFACC2EHoly|r',
  ic = {{inCombat,'!player.channeling(Divine Hymn)'}},
  ooc = {{outCombat,'!player.channeling(Divine Hymn)'}},
  gui = GUI,
  load = exeOnLoad,
  ids = yobleed.spell_ids
})
