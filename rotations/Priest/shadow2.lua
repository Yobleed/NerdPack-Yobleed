
local cooldowns = {
	{'Power Infusion'},
	{'Shadowfiend', 'player.buff(voidform).count >= 10'},
	-- >= UI(dps_SFspin) & UI(dps_fiend)'},
}

local surv = {

	{'Fade', 'target.threat = 100 & UI(s_F)'},

	{'!dispersion', 'player.health <= 20', 'player'},

	{'!Power Word: Shield', 'player.health <= 30', 'player'},



}

	local boss1 = {

		{'Shadow Word: Pain', 'boss1.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2) & !boss1.buff(Voidform)', 'boss1'},

		{'Vampiric Touch', 'boss1.debuff(Vampiric Touch).duration <= 3  & !boss1.buff(Voidform), & target.ttd >= 10', 'boss1'},

		{'!Shadow Word: Pain', 'boss1.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2)', 'boss1'},

		{'!Vampiric Touch', 'boss1.debuff(Vampiric Touch).duration <= 3, & target.ttd >= 10', 'boss1'},

	}

	local boss2 = {

		{'Shadow Word: Pain', 'boss2.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2) & !boss2.buff(Voidform)', 'boss2'},

		{'Vampiric Touch', 'boss2.debuff(Vampiric Touch).duration <= 3  & !boss2.buff(Voidform), & target.ttd >= 10', 'boss2'},

		{'!Shadow Word: Pain', 'boss2.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2)', 'boss2'},

		{'!Vampiric Touch', 'boss2.debuff(Vampiric Touch).duration <= 3, & target.ttd >= 10', 'boss2'},
	}

	local boss3 = {

		{'Shadow Word: Pain', 'boss3.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2) & !boss3.buff(Voidform)', 'boss3'},

		{'Vampiric Touch', 'boss3.debuff(Vampiric Touch).duration <= 3  & !boss3.buff(Voidform), & target.ttd >= 10', 'boss3'},

		{'!Shadow Word: Pain', 'boss3.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2)', 'boss3'},

		{'!Vampiric Touch', 'boss3.debuff(Vampiric Touch).duration <= 3, & target.ttd >= 10', 'boss3'},

	}

	local boss4 = {

		{'Shadow Word: Pain', 'boss4.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2) & !boss4.buff(Voidform)', 'boss4'},

		{'Vampiric Touch', 'boss4.debuff(Vampiric Touch).duration <= 3  & !boss4.buff(Voidform), & target.ttd >= 10', 'boss4'},

		{'!Shadow Word: Pain', 'boss4.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2)', 'boss4'},

		{'!Vampiric Touch', 'boss4.debuff(Vampiric Touch).duration <= 3, & target.ttd >= 10', 'boss4'},

	}

local bosses = {

	{boss1, 'boss1.exists'},
	{boss2, 'boss2.exists'},
	{boss3, 'boss3.exists'},
	{boss4, 'boss4.exists'},
}

local aoe = {

	{'Shadow Crash', nil, 'cursor.ground'},
	{'Mindflay', 'target.debuff(Shadow Word: Pain)', 'target'},

}

local s2m = {

	{'!Shadow Word: Death', 'talent(7,3) & player.insanity < 60 & !player.casting(Mind Blast)' , 'target'},

	{'!Dispersion', 'talent(7,3) & player.insanity < 30 & !player.casting(Mind Blast) & !player.casting(Mind Blast)' , 'target'},

}

local ST = {

	{ s2m },

	{'Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2) & !player.buff(Voidform)', 'target'},

	{'Vampiric Touch', 'target.debuff(Vampiric Touch).duration <= 3  & !player.buff(Voidform), & target.ttd >= 10', 'target'},

	{bosses, 'toggle(Multitarget)', nil },

	{'!Void Eruption', 'player.buff(Voidform) & !player.casting(Mind Blast)', 'target'},

	{'!Shadow Word: Death', '!talent(7,3) & !player.casting(Mind Blast)' , 'target'},

	{'!Void Eruption', '!player.buff(Voidform) & !player.casting(Mind Blast)', 'target'},

	{'!Mind Blast', nil , 'target'},

	{'!Void Torrent', 'spell(Mind Blast).cooldown >= 1 & spell(Void Bolt).cooldown >= 1 & !talent(7,3)', 'target'},

	{'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration <= 3 & !talent(6,2)', 'target'},

	{'!Vampiric Touch', 'target.debuff(Vampiric Touch).duration <= 3, & target.ttd >= 10', 'target'},

	{ cooldowns, 'toggle(cooldowns)' },

	{'Mind Flay', nil , 'target'},

}

local inCombat = {

	{ surv },

	{'!Power Word: Shield', 'player.movingfor >= 2', 'player'},

	{ aoe, 'keybind(lshift)' },

	{ ST, '!player.channeling(Void Torrent)' },

}

local outCombat = {

	{'!Power Word: Shield', 'player.movingfor >= 3', 'player'},
	-- Potion of Prolonged Power usage before pull if enabled in UI.
	--{'#142117', 'pull_timer <= 4 & pull_timer > 0 & toggle(raid)},
	-- Mind Blast before Pull.
	--{'Mind Blast', 'pull_timer <= 1.5 & & pull_timer > 0 & toggle(raid)'},
	{'Shadowform', '!player.buff(Shadowform)'},

}

NeP.CR:Add(258, {
	name = '|cFF1500FF [Aeonabyss]|r Shadow Priest',
	ic = inCombat,
	ooc = outCombat,
	--gui = GUI,
	--load = exeOnLoad
})

--[[


local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff6c00ff ----------------------------------------------------------------------|r')
	print('|cff6c00ff --- |rPriest: |cff6c00ffSHADOW|r')
	print('|cff6c00ff --- |rSupported Talents:ToF,Body&Soul,Mind Bomb, LI, LoS, Tier 5 & 6 & 7')
	print('|cff6c00ff --- |cffff6800Mangaza\'s Madness & Norgannon\'s Foresight|r Supported')
	print('|cff6c00ff ----------------------------------------------------------------------|r')
	print('|cff6c00ff --- |rQuestions or Issues? @Aeonabyss NeP discord channel')
	print('|cff6c00ff ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')


	NeP.Interface:AddToggle({
		-- Mind Bomb toggle only active with AoE.
		key = 'abc',
		name = 'Mind Bomb AoE',
		text = 'Enable/Disable: Mind Bomb in rotation.',
		icon = 'Interface\\ICONS\\Spell_shadow_mindbomb',
	})

	NeP.Interface:AddToggle({
		-- Surrender to Madness toggle.
		key = 's2m',
		name = 'Surrender to Madness',
		text = 'Enable/Disable: Automatic S2M',
		icon = 'Interface\\ICONS\\Achievement_boss_generalvezax_01',
	})


	NeP.Interface:AddToggle({
		key = 'level',
		name = 'Leveling',
		text = 'Enable/Disable: Leveling',
		icon = 'Interface\\ICONS\\icon_treasuremap',
	})

		NeP.Interface:AddToggle({

		key = 'solo',
		name = 'Solo',
		text = 'Enable/Disable - solo mode',
		icon = 'Interface\\ICONS\\ability_creature_cursed_02',
	})


end



local GUI = {
	-- GUI Header
	{type = 'texture',
	texture = 'Interface\\AddOns\\Nerdpack-Yobleed\\media\\shadow.blp',
	width = 512,
	height = 256,
	offset = 90,
	y = 42,
	center = true},

	-- GENERAL
	{type = 'header', text = 'General', align = 'center'},
	{type = 'text', text = 'Before Pull.', align = 'center'},
	{type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_pull', width = 55, default= false},
	{type = 'checkbox', text = 'Mind Blast', key = 'pull_MB', width = 55, default= false},
	{type = 'text', text = 'Movement', align = 'center'},
	{type = 'checkbox', text = 'Body and Soul', key = 'm_Body', width = 55, default = false},
    {type = 'ruler'}, {type = 'spacer'},

    -- COOLDOWNS
    {type = 'header', text = 'Cooldowns if Toggled', align = 'center'},
    {type = 'checkbox', text = 'Hero Potion of Prolonged Power', key = 's_PP', width = 55, default= false},
    {type = 'text', text = 'Trinkets', align = 'center'},
    {type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', width = 55, default = false},
	{type = 'checkbox', text = 'Bottom Trinket', key = 'trinket_2', width = 55, default = false},
	{type = 'text', text = 'Power Infusion', align = 'center'},
	{type = 'checkbox', text = 'ON/OFF', key = 'dps_PI', width = 55, default= false},
	{type = 'spinner', text = 'Target <= 35%', key = 'dps_PIspin1', align = 'left', width = 55, step = 1, default = 15},
	{type = 'spinner', text = 'Target > 35%', key = 'dps_PIspin2', align = 'left', width = 55, step = 1, default = 15},
	{type = 'text', text = 'Shadowfiend', align = 'center'},
	{type = 'checkbox', text = 'ON/OFF', key = 'dps_fiend', width = 55, default= false},
    {type = 'spinner', text = 'Shadowfiend Stacks', key = 'dps_SFspin', align = 'left', width = 55, step = 1, default = 22},
    {type = 'text', text = 'Void Torrent', align = 'center'},
    {type = 'checkbox', text = 'ON/OFF', key = 'dps_void', width = 55, default= false},
	{type = 'text', text = 'Dispersion', align = 'center'},
	{type = 'checkbox', text = 'ON/OFF', key = 'dps_D', width = 55, default= false},
	{type = 'spinner', text = 'Target <= 35%', key = 'dps_Dspin', align = 'left', width = 55, min = 15, max = 50, step = 1, default = 44},
	{type = 'spinner', text = 'Target > 35%', key = 'dps_D2spin', align = 'left', width = 55, min = 15, max = 50, step = 1, default = 30},
	{type = 'text', text = 'Arcane Torrent', align = 'center'},
	{type = 'checkbox', text = 'ON/OFF', key = 'dps_at', width = 55, default= true},
	{type = 'ruler'}, {type = 'spacer'},

	-- GUI Survival & Potions
	{type = 'header', text = 'Survival & Potions', align = 'center'},
	{type = 'checkbox', text = 'Fade', key = 's_F', width = 55, default= false},
	{type = 'checkbox', text = 'Power Word: Shield', key = 's_PWS', width = 55, default = false},
	{type = 'spinner', text = '', key = 's_PWSspin', width = 55, default = 40},
	{type = 'checkbox', text = 'Dispersion', key = 's_D', width = 55, default = false},
	{type = 'spinner', text = '', key = 's_Dspin', align = 'left', width = 55, default = 20},
	{type = 'checkbox', text = 'Gift of the Naaru', key = 's_GotN', width = 55, default = false},
	{type = 'spinner', text = '', key = 's_GotNspin', width = 55, default = 40},
	{type = 'checkbox', text = 'Healthstone', key = 's_HS', width = 55, default = false},
	{type = 'spinner', text = '', key = 's_HSspin', width = 55, default = 20},
	{type = 'checkbox', text = 'Ancient Healing Potion', key = 's_AHP', width = 55, default = false},
	{type = 'spinner', text = '', key = 's_AHPspin', width = 55, default = 20, align = 'left'},
	{type = 'ruler'}, {type = 'spacer'},

	-- GUI Party Support
	{type = 'header', text = 'Party Support', align = 'center'},
	{type = 'checkbox', text = 'Gift of the Naaru', key = 'sup_GotN', width = 55, default = false},
	{type = 'spinner', text = '', key = 'sup_GotNspin', width = 55, default = 20},
	{type = 'checkbox', text = 'Power Word: Shield', key = 'sup_PWS', width = 55, default = false},
	{type = 'spinner', text = '', key = 'sup_PWSspin', width = 55, default = 20},

	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'text', text = 'Left Shift: AOE|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Force AOE', key = 'k_AOE', width = 55, default = false},
	{type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', width = 55, default = false},
	{type = 'checkbox', text = 'Pause', key = 'k_P', width = 55, default = false},
	{type = 'ruler'}, {type = 'spacer'},
}


	{'Shadowform', '!player.buff(Voidform) & !player.buff(Shadowform)'},
	{'!Power Word: Shield', 'player.movingfor >= 1'},
	{Movement, '!player.buff(Voidform || {player.buff Voidform & !spell(Void Eruption).cooldown = 0 & !player.channeling(Void Torrent)}'},
	{Surrender, '!player.channeling(Void Torrent)'},
	{'Mind Bomb', '{toggle(abc) & target.area(8).enemies >= 3 & !player.buff(Surrender To Madness) & !player.channeling(Void Torrent) & !talent(7,2)} || {toggle(abc) & target.area(8).enemies >= 3 & talent(7,2) & spell(Shadow Crash).cooldown = 0 & player.buff(Voidform) & !player.channeling(Void Torrent)}'},
	{Emergency, '!player.channeling(Void Torrent)'},
	{Potions, '!player.channeling(Void Torrent)'},
	{Survival, 'player.health < 100 & !player.channeling(Void Torrent) & !player.buff(Surrender to Madness)'},
	{Support, '!player.buff(Surrender to Madness) & !player.channeling(Void Torrent)'},
	{cooldowns, 'player.buff(voidform) & !player.channeling(Void Torrent) & toggle(cooldowns)'},
	{Insight, 'player.buff(Shadowy Insight) & {!player.channeling(Void Torrent) & {talent(7,1) & !player.insanity >= 65} || {talent(7,3) ||talent(7,2) & !player.insanity = 100}} || {player.moving & !player.buff(Surrender to Madness)}'},
	{Keybinds},
	{Trinkets, '!player.channeling(Void Torrent)'},
	{Interrupts, 'toggle(interrupts) & target.interruptAt(80) & target.infront & target.range <= 30 & !player.channeling(Void Torrent)'},
	--{Leveling, '!player.channeling(Void Torrent) & toggle(level)'},
	--{AOE, 'talent(7,2) & !player.channeling(Void Torrent)'},
	{solo1, 'toggle(solo)'},
	{s2m2, "equipped(Mangaza's Madness) & player.buff(voidform) & !player.channeling(Void Torrent) & player.buff(Surrender to Madness)"},
	{s2m1, 'player.buff(Voidform) & !player.channeling(Void Torrent) & player.buff(Surrender to Madness)'},
	{lotv2, "{equipped(Mangaza's Madness) & player.buff(voidform) & !player.channeling(Void Torrent) & talent(7,1)} || {talent(7,3) & !player.buff(Surrender to Madness) & equipped(Mangaza's Madness) & player.buff(voidform) & !player.channeling(Void Torrent)} || {talent(7,2) & !player.buff(Surrender to Madness) & !equipped(Mangaza's Madness) & player.buff(voidform) & !player.channeling(Void Torrent)}"},
	{lotv1, "{player.buff(voidform) & !player.channeling(Void Torrent) & talent(7,1)} || {talent(7,3) & !player.buff(Surrender to Madness) & !equipped(Mangaza's Madness) & player.buff(voidform) & !player.channeling(Void Torrent)} || {talent(7,2) & !player.buff(Surrender to Madness) & !equipped(Mangaza's Madness) & player.buff(voidform) & !player.channeling(Void Torrent)}"},
	{ST2, "equipped(Mangaza's Madness) & !player.buff(voidform) & !player.channeling(Void Torrent)"},
	{ST1, "!player.buff(voidform) & !player.channeling(Void Torrent)"},
	{'Mind Flay'},


local Survival = {
	-- Fade usage if enabled in UI.
	{'Fade', 'target.threat = 100 & UI(s_F)'},
	-- Power Word: Shield usage if enabled in UI.
	{'Power Word: Shield', 'player.health <= UI(s_PWSspin) & UI(s_PWS)', 'player'},
	-- Dispersion usage if enabled in UI.
	{'!Dispersion', 'player.health <= UI(s_Dspin) & UI(s_D)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'Gift of the Naaru', 'player.health <= UI(s_GotNspin) & UI(s_GotN)'},
}

local Potions = {
	-- Potion of Prolonged Power usage if enabled in UI.
	{'#142117', 'player.hashero & !player.buff(229206) & UI(s_PP)'},
	-- Healthstone usage if enabled in UI.
	{'#5512', 'player.health <= UI(s_HSspin) & UI(s_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#127834', 'player.health <= UI(s_AHPspin) & UI(s_AHP)'},
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)', 'target'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)'},
}

local Keybinds = {
	--Forcing AOE
	{'!Void Eruption', 'UI(k_AOE) & keybind(lshift) & !player.buff(Voidform)', 'target'},
	--{'!Shadow Crash', 'advanced & keybind(lshift) & !target.moving', 'target.ground'},
	--{'!Shadow Crash', 'keybind(lshift) & !target.moving', 'player.ground'},
	{'!Shadow Crash', 'keybind(lshift) & !target.moving', 'target.ground'},
	{'!Shadow Word: Pain', '!target.debuff(shadow word: pain) & UI(k_AOE) & keybind(lshift)', 'target'},
	{'!Shadow Word: Pain', '!mouseover.debuff(shadow word: pain) & UI(k_AOE) & keybind(lshift)', 'mouseover'},
	{'Mind Bomb', 'keybind(lshift)' },
	{'!Mind Flay', 'target.debuff(shadow word: pain) & UI(k_AOE) & keybind(lshift)', 'target'},
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD) & !advanced', 'cursor.ground'},
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
	-- Pause on Left-Alt if enabled in UI.
	{'%pause', 'keybind(lalt) & UI(k_P)'},
}

local Movement = {
	-- Body and Soul usage if enabled in UI.
	{'!Power Word: Shield', 'talent(2,2) & player.movingfor >= 2 & UI(m_Body) ', 'player'},
}

local Support = {
	-- Gift of the Naaru usage if enabled in UI.
	{'!Gift of the Naaru', 'lowest.health <= UI(sup_GotNspin) & UI(sup_GotN)', 'lowest'},
	-- Power Word: Shield usage if enabled in UI.
	{'!Power Word: Shield', 'lowest.health <= UI(sup_PWSspin) & UI(sup_PWS)', 'lowest'},
}

local Interrupts = {
	-- Silence selected target.
	{'!Silence'},
	-- Arcane Torrent if within 8 yard range of selected target when Silence is on cooldown.
	{'!Arcane Torrent', 'target.range <= 8 & spell(Silence).cooldown > gcd & !lastgcd(Silence)'},
}

local Surrender = {
	--Surrender to Madness if player has talent and BOSS is dying within 1:40 (100 stacks) and toggled.
	{'!Surrender to Madness', 'talent(7,3) & target.deathin <= 100 & toggle(s2m) & !player.buff(Surrender to Madness) & target.boss & boss.exists'},
	-- S2M when in Xavius Dreamstate.
	{'!Surrender to Madness', 'talent(7,3) & player.debuff(Dream Simulacrum) & toggle(s2m) & !player.buff(Surrender to Madness)'},
}

local Insight = {
	-- Mind Blast when buffed with Shadowy Insight only when Voidbolt is on CD.
	{'!Mindblast', '!spell(Void Eruption).cooldown = 0'},
}

local Emergency = {
	--Dispersion when SWD charges are 0 and VoiT is on CD and insanity below or equal to 20%.
	{'!Dispersion', 'player.spell(Shadow Word: Death).charges < 1 & !spell(Void Torrent).cooldown = 0 & player.insanity <= 20 & !talent(7,1) & !talent(7,2) & UI(dps_D)'},
	--Arcane Torrent if SWD on cd or not usable, dispersion is on CD and insanity is low
	{'!Arcane Torrent', 'UI(dps_at) & player.insanity <= 35 & {!player.spell(shadow word: death).cooldown = 0 || !target.health <= 35} & !player.spell(dispersion).cooldown = 0'},
	--Power Infusion if talent active and VF stacks are 70 or higher if SWD charges are 0 and insanity is 50% or below.
	{'!Power Infusion', 'talent(6,1) & player.buff(voidform).count >= 80 & spell(Shadow Word: Death).charges < 1 & player.insanity <= 60 & UI(dps_PI)'},
}

local AOE = {
	--Shadow Crash on CD.
	{'Shadow Crash', '{target.area(8).enemies >= 2 & advanced & toggle(AOE) & player.buff(Voidform) & !target.moving & player.spell(Void Eruption).cooldown > 0} || {!advanced & toggle(AOE) & player.buff(Voidform) & !target.moving & player.spell(Void Eruption).cooldown > 0}', 'target.ground'},
}

local lotv1 = {
	--Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 20% and Target Health is below or equal to 35% health.
	{'!Dispersion', 'player.buff(voidform).count >= UI(dps_Dspin) & UI(dps_D) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 30 & target.health <= 35 & !player.spell(Void Torrent).cooldown = 0'},
	--Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 20% and Target Health is above 35% health.
	{'!Dispersion', 'player.buff(voidform).count >= UI(dps_D2spin) & UI(dps_D) & !player.buff(Surrender to Madness) & player.insanity <= 30 & target.health > 35 & !player.spell(Void Torrent).cooldown = 0'},
	--SWD if target is below or equal to 35% Health and player insanity is below or equal to 40%.
	{'!Shadow Word: Death', '{!player.channeling(Mind Blast) & player.spell(Shadow Word: Death).charges > 1 & player.insanity <= 70} || {!player.channeling(Mind Blast) & player.insanity <= 35}'},
	--Void Bolt on CD not interrupting casting MB.
	{'!Void Eruption', '!player.channeling(Mind Blast) || player.insanity <= 20'},
	--Misery.
	{'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & & !lastcast(Vampiric Touch)}'},
	--Mind Blast on CD if VB is on CD.
	{'Mind Blast', 'player.spell(Void Eruption).cooldown > gcd'},
	--Mind Blast on CD if VB is on CD.
	{'!Mind Blast', 'player.spell(Void Eruption).cooldown > gcd & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) & player.channeling(Mind Flay)'},
	--Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
	{'Shadow Word: Pain', '{target.debuff(Shadow Word: Pain).duration < 3 & !talent(6,2)} || {!target.debuff(Shadow Word: Pain) & !talent(6,2)} || {moving & !target.debuff(Shadow Word: Pain)}'},
	--Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
	{'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || {!target.debuff(Vampiric Touch) & !lastcast(Vampiric Touch)} || {{target.debuff(Shadow Word: Pain).duration <= 1.3 || !target.debuff(Shadow Word: Pain)} & talent(6,2)}'},
	--Mind Flay if Dots are up and VB and MB are on CD.
	{'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & !player.spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
}

local s2m1 = {
	--Dispersion after Void Torrent and Void Bolt
	{'!Dispersion', 'player.buff(voidform).count >= 6 & player.buff(voidform).count < 10 & !lastcast(Void Torrent) & UI(dps_D)'},
	--Torrent on CD.
	{'!Void Torrent', 'UI(dps_void)'},
	--SWD Charge dump if below 20 stacks of VF and if DoTs are up.
	{'!Shadow Word: Death', 'player.buff(voidform).count < 10 & target.debuff(Shadow Word: Pain).duration > 6 & target.debuff(Vampiric Touch).duration > 6'},
	--SWD if insanity is below 40%.
	{'!Shadow Word: Death', 'player.insanity < 30'},
	--Void Bolt on CD not interrupting casting MB.
	{'!Void Eruption', '!player.channeling(Mind Blast) || player.insanity <= 40'},
	--Misery.
	{'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & & !lastcast(Vampiric Touch)}'},
	--Mind Blast on CD if VB is on CD.
	{'Mind Blast', '!player.spell(Void Eruption).cooldown = 0'},
	--Mind Blast on CD if VB is on CD.
	{'!Mind Blast', '!player.spell(Void Eruption).cooldown = 0 & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) & player.channeling(Mind Flay)'},
	--Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
	{'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
	--Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
	{'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 || !target.debuff(Vampiric Touch)} & & !lastcast(Vampiric Touch)}'},
	--Mind Flay if Dots are up and VB and MB are on CD.
	{'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & !player.spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
}

--------------------------------------------------LEGENDARY BELT-----------------------------------------------------------------------------------------------------------
local ST2 = {
	--Void Eruption if VT on target is 13seconds or higher and SWP on target and in S2M.
	{'!Void Eruption','target.debuff(Vampiric Touch).duration > 13 & player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
	--Void Eruption if VT on target is 6seconds or higher and SWP on target and no S2M.
	{'!Void Eruption', 'target.debuff(Vampiric Touch).duration > 4 & !player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
	--SWD when target below 35%
	{'!Shadow Word: Death', '{talent(7,1) & !player.insanity >= 65 & !player.channeling(Void Eruption)} || {target.health <= 35 & talent(7,3) ||talent(7,2) & !player.insanity = 100 & !player.channeling(Void Eruption)}'},
	--Misery.
	{'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) !lastcast(Vampiric Touch)}'},
	--Mind Blast if player is channeling Mind Flay.
	{'!Mind Blast', 'player.channeling(Mind Flay)'},
	--Mind Blast if target has SWP and VT.
	{'Mind Blast', 'target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
	--Mind Blast if target doesnt have SWP and VT and wasn't last cast.
	{'Mind Blast', '!target.debuff(Shadow Word: Pain) & !target.debuff(Vampiric Touch) & !lastcast(Mind Blast) & {talent(7,1) & !player.insanity >= 65} || {talent(7,3) ||talent(7,2) & !player.insanity = 100}'},
	--Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
	{'Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
	--Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
	{'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || {!target.debuff(Vampiric Touch) & !lastcast(Vampiric Touch)} || {{target.debuff(Shadow Word: Pain).duration <= 1.3 || !target.debuff(Shadow Word: Pain)} & talent(6,2)}'},
	--Mind Flay if Mind Blast is on cooldown
	{'Mind Flay', '!spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch) & {talent(7,1) & !player.insanity >= 65} || {talent(7,3) ||talent(7,2) & !player.insanity = 100}'},
}

local lotv2 = {
	--Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 40% and Target Health is below or equal to 35% health.
	{'!Dispersion', 'player.buff(voidform).count >= UI(dps_Dspin) & UI(dps_D) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 30 & target.health <= 35'},
	--Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 40% and Target Health is above 35% health.
	{'!Dispersion', 'player.buff(voidform).count >= UI(dps_D2spin) & UI(dps_D) & !player.buff(Surrender to Madness) & player.insanity <= 30 & target.health > 35'},
	--Torrent on CD.
	{'!Void Torrent', '{player.buff(voidform).count >= 23 & spell(Shadow Word: Death).charges < 1 & player.insanity <= 30 & UI(dps_void)} || {player.buff(voidform).count >= 16 & !player.buff(Surrender to Madness) & player.insanity <= 30 & target.health > 35 & UI(dps_void)} '},
	--SWD if target is below or equal to 35% Health and player insanity is below or equal to 40%.
	{'!Shadow Word: Death', '{player.insanity <= 40} || {target.health <= 35 & player.buff(voidform).count <= 15 & player.insanity < 70}'},
	--Void Bolt on CD not interrupting casting MB.
	{'!Void Eruption', '!player.channeling(Mind Blast) || player.insanity <= 40'},
	--Misery.
	{'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & !lastcast(Vampiric Touch)'},
	--Mind Blast on CD if VB is on CD.
	{'Mind Blast', '!player.spell(Void Eruption).cooldown = 0'},
	--Mind Blast on CD if VB is on CD.
	{'!Mind Blast', '!player.spell(Void Eruption).cooldown = 0 & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) & player.channeling(Mind Flay)'},
	--Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
	{'Shadow Word: Pain', '{target.debuff(Shadow Word: Pain).duration < 3 & !talent(6,2)} || {!target.debuff(Shadow Word: Pain) & !talent(6,2)} || {moving & !target.debuff(Shadow Word: Pain)}'},
	--Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
	{'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || {!target.debuff(Vampiric Touch) & !lastcast(Vampiric Touch)} || {{target.debuff(Shadow Word: Pain).duration <= 1.3 || !target.debuff(Shadow Word: Pain)} & talent(6,2)}'},
	--Mind Flay if Dots are up and VB and MB are on CD.
	{'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & !player.spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
}

local s2m2 = {
	--Dispersion after Void Torrent and Void Bolt
	{'!Dispersion', 'player.buff(voidform).count >= 6 & player.buff(voidform).count < 10 & !lastcast(Void Torrent) & UI(dps_D)'},
	--Torrent on CD.
	{'!Void Torrent', 'UI(dps_void)'},
	--SWD Charge dump if below 20 stacks of VF and if DoTs are up.
	{'!Shadow Word: Death', 'player.buff(voidform).count < 10 & target.debuff(Shadow Word: Pain).duration > 6 & target.debuff(Vampiric Touch).duration > 6'},
	--SWD if insanity is below 40%.
	{'!Shadow Word: Death', 'player.insanity < 30'},
	--Void Bolt on CD not interrupting casting MB.
	{'!Void Eruption', '!player.channeling(Mind Blast) || player.insanity <= 40'},
	--Misery.
	{'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & !lastcast(Vampiric Touch)'},
	--Mind Blast on CD if VB is on CD.
	{'Mind Blast', '!player.spell(Void Eruption).cooldown = 0'},
	--Mind Blast on CD if VB is on CD.
	{'!Mind Blast', '!player.spell(Void Eruption).cooldown = 0 & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) & player.channeling(Mind Flay)'},
	--Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
	{'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
	--Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
	{'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 || !target.debuff(Vampiric Touch)}  & !lastcast(Vampiric Touch)'},
	--Mind Flay if Dots are up and VB and MB are on CD.
	{'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & player.spell(Mind Blast).charges < 1 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
}

local solo1 = {
	{'Power Word: Shield', 'player.health <= 50', 'player'},
	{'!Shadow Word: Death', '!player.channeling(Mind Blast) || !player.channeling(Void Torrent)'},
	{'!Void Torrent', '{{player.spell(Void Eruption).cooldown & player.spell(Mind Blast).cooldown} & player.buff(voidform).count >= 10}'},


}


local cooldowns = {
	{'Power Infusion', 'talent(6,1) & player.buff(Surrender to Madness) & player.buff(voidform).count >= 50 & player.insanity >= 50 & !spell(Void Eruption).cooldown = 0 & !spell(Void Torrent).cooldown = 0 & !spell(Dispersion).cooldown = 0 & UI(dps_PI)', 'player'},
	{'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(voidform).count >= UI(dps_PIspin1) & target.health <= 35 & UI(dps_PI)', 'player'},
	{'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(voidform).count >= UI(dps_PIspin2) & target.health > 35 & UI(dps_PI)', 'player'},

	{'Shadowfiend', '!talent(6,3) & !spell(Void Eruption).cooldown = 0 & player.buff(voidform).count >= UI(dps_SFspin) & !talent(6,1) & UI(dps_fiend)'},
	-- >= UI(dps_SFspin) & UI(dps_fiend)'},
}


]]--
