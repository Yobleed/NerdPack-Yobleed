local _, yobleed = ...
local NeP = NeP
local GUI = {
-- GUI Header 
{type = "texture",
texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\disc.blp",
width = 512, 
height = 256, 
offset = 90, 
y = 42, 
center = true},
    
--ARTIFACT CHALLENGE
{type = 'header', text = 'Mage Tower Artifact Challenge', align = 'center'},
{type = 'text', text = 'What you should know before doing the Artifact challenge:', align = 'center'},
{type = 'text', text = 'Items Required: Drums of Fury, Azshari Salad, Defiled Augment Rune & Potion of Prolonged Power', align = 'center'},
{type = 'text', text = 'Talents Required: Schism, Masochism, Psychic Voice, Mindbender, Sanctuary, Purge the Wicked and Power Infusion', align = 'center'},
{type = 'header', text = 'Tactics', align = 'center'},
{type = 'text', text = 'Toggle Interrupts for Fel Burst interrupts with Psychic Voice', align = 'center'},
{type = 'text', text = 'Kill fel totems asap, it should do this Automatically', align = 'center'},
{type = 'text', text = 'If the big Wurm charges for you, go behind the Eathquake spikes to make it lose stacks.', align = 'center'},
{type = 'text', text = 'Try mitigating Damage from fel burst if Psychic Voice is on CD with Fade automatically or Pain Supression near the end and Barrier near the end as Damage gets higher every Fel Burst', align = 'center'},
{type = 'text', text = 'and FINALLY, it will pop Drums of Fury at 30% you will have to pop ur potion too ', align = 'center'},
{type = 'text', text = 'Doing a few tries is unavoidable. !!GOOD LUCK!!', align = 'center'},
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
{type = 'checkbox', text = 'Ancient Healing Potion', key = 'p_AHP', width = 55, default = false},
{type = 'spinner', text = '', key = 'p_AHPspin', width = 55, default = 25},
}
	
local exeOnLoad = function()
-- Rotation loaded message.
print('|cffFF9900 Priest:|r|cffFF9900HOLY Mage Tower|r')
print('HOLY MAGE TOWER ARTIFACT CHALLENGE')
print('|cffff0000 READ ME |rRight-click the MasterToggle and go to Combat Routines Settings|r')

NeP.Interface:AddToggle({
key = 'stage1',
name = 'Stage1',
text = 'Stage1',
icon = 'Interface\\ICONS\\spell_holy_chastise',
})

NeP.Interface:AddToggle({
key = 'stage3',
name = 'Stage3',
text = 'Stage3',
icon = 'Interface\\ICONS\\trade_engineering',
})
NeP.Interface:AddToggle({
key = 'stage4',
name = 'Stage4',
text = 'Stage4',
icon = 'Interface\\ICONS\\trade_engineering',
})
NeP.Interface:AddToggle({
key = 'stage5',
name = 'Stage5',
text = 'Stage5',
icon = 'Interface\\ICONS\\trade_engineering',
})
NeP.Interface:AddToggle({
key = 'stage6',
name = 'Stage6',
text = 'Stage6',
icon = 'Interface\\ICONS\\trade_engineering',
})
NeP.Interface:AddToggle({
key = 'stage7',
name = 'Stage7',
text = 'Stage7',
icon = 'Interface\\ICONS\\trade_engineering',
})
NeP.Interface:AddToggle({
key = 'disp',
name = 'Dispell',
text = 'ON/OFF Dispel All',
icon = 'Interface\\ICONS\\spell_holy_dispelmagic',
})
end

local Keybinds = {
{{
{'!Mass Dispel', '!advanced', 'cursor.ground'},
{'!Mass Dispel', nil, 'mouseover.ground'},
},'UI(k_MD) & keybind(lcontrol)'},
{{
{'!Holy Word: Sanctify', '!advanced', 'cursor.ground'},
{'!Holy Word: Sanctify', 'area(10, 99).heal >= 5 & advanced','lowest.ground'},
{'!Holy Word: Sanctify', 'advanced', 'tank.ground'},
{'Prayer of Healing', '{player.area(40,99).heal >= 4 & !advanced}||area(20,99).heal >= 4','friendly'},
},'keybind(lshift) & UI(k_HWS)'},
{'%pause', 'keybind(lalt)& UI(k_P)'},
}

local Potions = {
{'#Ancient Healing Potion', 'player.health <= 30 & player.spell(Guardian Spirit).cooldown > 0'},
}

local Cooldowns = {
{'!Guardian Spirit', '!player.spell(Holy Word: Serenity).cooldown == 0 & health <= 20 & !is(player)', 'lowest'},
{'Desperate Prayer', 'health <= 50 & !buff(Guardian Spirit)', 'player'},
{'Light of T\'uure', 'health <= 70 & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !health <= 40', 'lowest'},
}

local Guidinghand = {
{'#147007', '!buff(Guiding Hand) & health > 60 & player.equipped(147007)', {'lowest','player'}}, -- Deceiver's Grand Design
}

local Archive = {
{'#147006', 'health <= 50 & !player.moving & equipped(147006) & {player.spell(Holy Word: Serenity).cooldown > gcd || player.mana <= 5}', 'lowest'},
}

local Healing = {
{Guidinghand},
{Archive},
{'!Holy Word: Sanctify', 'area(10, 90).heal >= 3','lowest.ground'},
{'Prayer of Mending', '!lowest.health <= 60 & !player.moving & !buff(Prayer of Mending)', 'lowest'},
{'Flash Heal', 'player.buff(Surge of Light) & player.buff(Surge of Light).duration <= 3 & health < 100', 'lowest'},
{'Renew', '!buff(Renew) & player.moving', 'lowest'},
{'!Holy Word: Serenity', 'health <= 60', 'lowest'},
{'!Gift of the Naaru', 'health <= 40', 'lowest'},
{'Binding Heal', '!health <= 70 & !is(player) & {area(20, 90).heal >= 2 || {player.health < 90 & health < 90}}', 'lowest'},
{'Flash Heal', 'health <= 90', 'lowest'},
}

local DPS = {
{'Holy Fire', 'debuff(Holy Fire).count == 2 & debuff(Holy Fire).duration <= gcd ' , 'target'},
{'Holy Fire', '!debuff(Holy Fire).count == 2', 'target'},
{'Smite', nil, 'target'},
}

local Stage1 = {
{'!Shackle Undead','id(118489) & casting(Knife Dance)','enemies'},--Corrupted Risen Soldier
{'!Shackle Undead','id(118489) & channeling(Knife Dance)','enemies'},--Corrupted Risen Soldier
{'!Holy Word: Chastise', 'id(118491) & casting(Arcane Blitz) & casting.percent >= 50 & buff(Arcane Blitz).count.any > 2', 'enemies'}, -- Corrupted Risen Mage
{'!Shackle Undead','id(118492) & channeling(Mana Sting) & player.spell(Holy Word: Chastise).cooldown > 0','enemies'},--Corrupted Risen Arbalest
{'!Holy Word: Chastise','id(118492) & channeling(Mana Sting)','enemies'}, --Corrupted Risen Arbalest
}
local Stage3 = {
{'!Shackle Undead','id(118492) & channeling(Mana Sting) & player.spell(Holy Word: Chastise).cooldown > 0','enemies'},--Corrupted Risen Arbalest
{'!Holy Word: Chastise','id(118492) & channeling(Mana Sting)','enemies'}, --Corrupted Risen Arbalest
{'!Holy Word: Serenity', 'id(119470)', 'friendly'},
{'Flash Heal', 'id(119470)', 'friendly'},  
{Healing,'lowest.health <= 60'},


}
local Stage4 = {}
local Stage5 = {}
local Stage6 = {}
local Stage7 = {}

local Magetower = {
{Stage1,'toggle(stage1)'},
{Stage3,'toggle(stage3)'},
{Stage4,'toggle(stage4)'},
{Stage5,'toggle(stage5)'},
{Stage6,'toggle(stage6)'},
{Stage7,'toggle(stage7)'},
}
local inCombat = {
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0'},
{Cooldowns},
{Potions},
{Keybinds},
{Magetower},
{Healing,'lowest.health < 90'},
{DPS,'target.debuff(Shackle Undead)'},
}

local outCombat = {
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0'},
{Potions},
{Keybinds},
{Magetower},
{Healing,'lowest.health < 90'},		
} 

NeP.CR:Add(257, {
  name = '|cffFF9900[Yobleed]|r Priest - |cffFF9900Holy Mage Tower|r',
  ic = {{inCombat,'!player.channeling(Divine Hymn)'}},
  ooc = {{outCombat,'!player.channeling(Divine Hymn)'}},
  gui = GUI,
  load = exeOnLoad,
  ids = yobleed.spell_ids
})
