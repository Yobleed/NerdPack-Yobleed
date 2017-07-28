--count.friendly.buffs(Plea)
-- Counts how many units have the buff
-- USAGE: count(BUFF).buffs > = #
-- {type='checkspin', text='something', desc='something something', key='KEY', spin=80, check=true}
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
	{type = 'text', text = 'Left Shift: Power Word: Barrier|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Power Word: Barrier', key = 'k_PWB', width = 55, default = false},
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
	print('|cffFF9900 Priest:|r|cffFF9900DISCIPLINE Mage Tower|r')
	print('DISC MAGE TOWER ARTIFACT CHALLENGE')
	print('|cffff0000 READ ME |rRight-click the MasterToggle and go to Combat Routines Settings|r')


	NeP.Interface:AddToggle({
		key = 'disp',
		name = 'Dispell',
		text = 'ON/OFF Dispel All',
		icon = 'Interface\\ICONS\\spell_holy_dispelmagic', --toggle(disp)
	})


end

local Keybinds = {
	-- Power Word: Barrier on left shift when checked in UI.
	{'!Power Word: Barrier', 'keybind(lshift) & UI(k_PWB)', 'cursor.ground'},
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
	-- Pause on left alt when checked in UI.
	{'%pause', 'keybind(lalt)& UI(k_P)'},
}

local Potions = {
	{'#Ancient Healing Potion', 'UI(p_AHP) & player.health <= UI(p_AHPspin) & !player.channeling(Divine Hymn)'},

}

local Magetower = {
	{'#142117', 'player.buff(Drums of Fury) & !player.buff(Potion of Prolonged Power) & !player.buff(229206)'},
        {'#Drums of Fury', '!buff(Drums of Fury) & target.health <= 30 & !debuff(Exhaustion)','player'},
        {'Fade', 'aggro & target.interruptAt(70) & toggle(interrupts) & spell(Psychic Scream).cooldown ~= 0','player'},
        {'!Psychic Scream', 'interruptAt(70) & toggle(interrupts) & range <= 8', 'target'},
	{'Power Word: Shield', '!buff(Power Word: Shield)', 'player'},
	{'Schism', nil, 'target'},
	{'Power Infusion', 'talent(7,1)', 'target'},
        {'Mindbender', 'talent(4,3)', 'target'},
        {'!Light\'s Wrath', '!debuff(Schism).duration > {player.spell(Light\'s Wrath).casttime + 1.5} ','target'}, 
	{'Shadow Mend', 'health <= 65', 'player'},
	{'Gift of the Naaru', 'health <= 40', 'player'},
	{'Purge the Wicked', '!debuff(Purge the Wicked) & id(121499) & range <= 40', 'enemies'},
	{'Purge the Wicked', '!debuff(Purge the Wicked) & !player.spell(Penance).cooldown == 0 & range <= 40', 'enemies'},
	{'Purge the Wicked', '!debuff(Purge the Wicked)', 'target'},
	{'Penance', 'debuff(Purge the Wicked) & infront', 'target'},
	{'Smite', 'infront', 'target'},

}
local inCombat = {
{'%dispelall', 'toggle(disp) & spell(Purify).cooldown == 0 & !UI(disp_ang)'},
{Potions},
{Keybinds},
{Magetower},
}

local outCombat = {
{'Power Word: Shield', '!buff(Power Word: Shield)', 'player'},
		
}

NeP.CR:Add(256, {
	name = '|cffFF9900[Yobleed]|r Priest - |cffFF9900Discipline Mage Tower|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
