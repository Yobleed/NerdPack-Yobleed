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
{type = 'text', text = 'Left Shift Holy Word: Sanctify @Cursor', align = 'center'},
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
text = 'Interrupt all Risen',
icon = 'Interface\\ICONS\\spell_holy_chastise',
})

NeP.Interface:AddToggle({
key = 'stage5',
name = 'Stage5',
text = 'Heal all damaged souls',
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
{'!Holy Word: Sanctify', 'keybind(lshift)', 'cursor.ground'},
}

local Potions = {
{'#Ancient Healing Potion', 'player.health <= 30 & player.spell(Guardian Spirit).cooldown > 0'},
}

local Cooldowns = {
{'!Guardian Spirit', '!player.spell(Holy Word: Serenity).cooldown == 0 & health <= 20 & !is(player)', 'lowest'},
{'Desperate Prayer', 'health <= 50 & !buff(Guardian Spirit)', 'player'},
{'Light of T\'uure', 'health <= 70 & !buff(Light of T\'uure) & !buff(Guardian Spirit) & !health <= 40 & !partycheck == 1', 'lowest'},
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
{'Prayer of Mending', '!lowest.health <= 60 & !player.moving & !buff(Prayer of Mending) & !partycheck == 1', 'lowest'},
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
{'!Shackle Undead','casting(Knife Dance) & range <= 40','enemies'},--Corrupted Risen Soldier
{'!Shackle Undead','channeling(Knife Dance) & range <= 40','enemies'},--Corrupted Risen Soldier
{'!Holy Word: Chastise', 'casting(Arcane Blitz) & casting.percent >= 50 & buff(Arcane Blitz).count.any > 2 & range <= 30', 'enemies'}, -- Corrupted Risen Mage
{'!Shackle Undead','channeling(Mana Sting) & player.spell(Holy Word: Chastise).cooldown > 0 & range <= 40','enemies'},--Corrupted Risen Arbalest
{'!Holy Word: Chastise','channeling(Mana Sting) & range <= 30','enemies'}, --Corrupted Risen Arbalest
{Healing,'lowest.health < 90'},
}

local Stage5 = {
{Healing,'lowest.health <= 60'},
{'Holy Word: Serenity', 'health < 100 & id(119480)', 'friendly'}, -- archer
{'Flash Heal', 'health < 100 & id(119480)', 'friendly'}, -- archer
{'Holy Word: Serenity', 'health < 100 & id(119477)', 'friendly'}, -- mage
{'Flash Heal', 'health < 100 & id(119477)', 'friendly'}, -- mage
{'Holy Word: Serenity', 'health < 100 & id(119476)', 'friendly'}, -- soldier
{'Flash Heal', 'health < 100 & id(119476)', 'friendly'}, -- soldier
}

local Magetower = {
{Stage1,'toggle(stage1)'},
{Stage5,'toggle(stage5)'},

}
local inCombat = {
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0'},
{Cooldowns},
{Potions},
{Keybinds},
{Magetower},
{Healing,'lowest.health <= 70 & !toggle(Stage1) & !toggle(Stage5)'},
{DPS,'!target.debuff(Shackle Undead)'},
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
