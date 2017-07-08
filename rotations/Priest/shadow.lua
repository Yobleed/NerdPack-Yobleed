--[[TO DO:
count.buff/debuff() with count.enemies/friendly.buff/debuff()
counts how many have the buff/debuff

Vampiric Touch:
enemyndebuff(Vampiric Touch) FAKEUNIT

Shadow Word: Pain  :
enemyndebuff(Shadow Word: Pain) FAKEUNIT

Shadow Word: Death :
Lowestenemy FAKEUNIT
]]--



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
	{type = 'text', text = 'Mythic +', align = 'center'},
	{type = 'checkbox', text = 'Target Fel Explosives', key = 'myth_fel', width = 55, default= false},
	{type = 'text', text = 'Before Pull', align = 'center'},
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
	{type = 'text', text = 'Shadowfiend/Mindbender', align = 'center'},
	{type = 'checkbox', text = 'ON/OFF', key = 'dps_fiend', width = 55, default= false},
    {type = 'spinner', text = 'Stacks', key = 'dps_SFspin', align = 'left', width = 55, step = 1, default = 22},
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

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff6c00ff ----------------------------------------------------------------------|r')
	print('|cff6c00ff --- |rPriest: |cff6c00ffSHADOW|r')
	print('|cff6c00ff --- |rSupported Talents:ToF,Body&Soul,Mind Bomb, LI, LoS, Tier 5 & 6 & 7')
	print('|cff6c00ff --- |cffff6800Mangaza\'s Madness & Norgannon\'s Foresight|r Supported')
	print('|cff6c00ff ----------------------------------------------------------------------|r')
	print('|cff6c00ff --- |rQuestions or Issues? @Yobleed NeP discord channel')
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

end
local Mythic = {
    {'!Void Eruption', 'id(120651) & range <= 40 & infront', 'enemies'},
    {'!Shadow Word: Death', 'id(120651) & range <= 40', 'enemies'}, 
	{'!Mind Blast', 'id(120651) & range <= 40 & infront' , 'enemies'},
    {'Shadow Word: Pain', 'id(120651) & range <= 40 & !debuff(Shadow Word: Pain)', 'enemies'},
    {'Mind Flay', 'id(120651) & range <= 40 & debuff(Shadow Word: Pain) & infront', 'enemies'},

}

local Zeks = {
	--Shadow Word Death with Zek's Exterminatus
	{'!Shadow Word: Death', 'equipped(144438) & !player.buff(voidform) & player.spell(Mind Blast).cooldown > gcd', 'target'},
	{'!Shadow Word: Death', 'equipped(144438) & player.spell(Void Eruption).cooldown > gcd & player.spell(Mind Blast).cooldown > gcd & player.buff(voidform)', 'target'},
}
local Survival = {
	-- Fade usage if enabled in UI.
	{'Fade', 'player.aggro & UI(s_F)'},
	-- Power Word: Shield usage if enabled in UI.
	{'Power Word: Shield', 'player.health <= UI(s_PWSspin) & UI(s_PWS)', 'player'},
	-- Dispersion usage if enabled in UI.
	{'!Dispersion', 'player.health <= UI(s_Dspin) & UI(s_D)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'Gift of the Naaru', 'player.health <= UI(s_GotNspin) & UI(s_GotN)'},
}

local Potions = {
	-- Potion of Prolonged Power usage if enabled in UI.
	{'#142117', 'player.hashero & !player.buff(Potion of Prolonged Power) & UI(s_PP)'},
	-- Healthstone usage if enabled in UI.
	{'#5512', 'player.health <= UI(s_HSspin) & UI(s_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#127834', 'player.health <= UI(s_AHPspin) & UI(s_AHP)'},
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)', 'target'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)', 'target'},
}

local Keybinds = {
	--Forcing AOE
	{'!Void Eruption', 'UI(k_AOE) & keybind(lshift) & !player.buff(Voidform)', 'target'},
	{'!Shadow Crash', 'advanced & keybind(lshift) & !target.moving', 'target.ground'},
	{'!Shadow Crash', '!advanced & keybind(lshift) & !target.moving', 'cursor.ground'},
	{'!Shadow Word: Pain', '!target.debuff(shadow word: pain) & UI(k_AOE) & keybind(lshift)', 'target'},
	{'!Shadow Word: Pain', '!mouseover.debuff(shadow word: pain) & UI(k_AOE) & keybind(lshift)', 'mouseover'},
	{'!Mind Flay', 'target.debuff(shadow word: pain) & UI(k_AOE) & keybind(lshift)', 'target'},
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD) & !advanced', 'cursor.ground'},
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'mouseover.ground'},
	-- Pause on Left-Alt if enabled in UI.
	{'%pause', 'keybind(lalt) & UI(k_P)'},
}

local Movement = {
	-- Body and Soul usage if enabled in UI.
	{'!Power Word: Shield', 'talent(2,2) & player.movingfor >= 1 & UI(m_Body) ', 'player'},
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

local cooldowns = {
    
    --Torrent on CD.
    {'!Void Torrent', 'player.spell(Void Eruption).cooldown > 0 & UI(dps_void) & player.buff(voidform).count > 3 & set_bonus(T19) = 4', 'target'}, 
    {'!Void Torrent', 'UI(dps_void) & !set_bonus(T19) = 4', 'target'}, 
	--Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target below or equal to 35% health.
	{'!Power Infusion', 'talent(6,1) & player.buff(Surrender to Madness) & player.buff(voidform).count >= 50 & player.insanity >= 50 & !spell(Void Eruption).cooldown = 0 & !spell(Void Torrent).cooldown = 0 & !spell(Dispersion).cooldown = 0 & UI(dps_PI)', 'player'},
	--Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target below or equal to 35% health.
	{'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(voidform).count >= UI(dps_PIspin1) & target.health <= 35 & UI(dps_PI)', 'player'},
	--Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target above or 35% health.
	{'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(voidform).count >= UI(dps_PIspin2) & target.health > 35 & UI(dps_PI)', 'player'},
	--Mindbender if talent is active on CD in S2M.
	{'!Mindbender', 'talent(6,3) & player.buff(Surrender to Madness)'},
	--Mind Bender if talent is active and not in S2M if VF stacks are above 5.
	{'!Mindbender', 'talent(6,3) & !player.buff(Surrender to Madness) & player.buff(voidform).count >= UI(dps_SFspin) & UI(dps_fiend)', 'target'},
	--Shadowfiend if Void Bolt is on CD and VF stacks are above 10 when Power Infusion talent is not active.
	{'!Shadowfiend', '!player.spell(Void Eruption).cooldown = 0 & player.buff(voidform).count >= UI(dps_SFspin) & !talent(6,1) & UI(dps_fiend)', 'target'},
	--Shadowfiend if PI and above 40% insanity.
	{'!Shadowfiend', 'player.buff(Power Infusion) & player.buff(voidform).count >= UI(dps_SFspin) & UI(dps_fiend)'},
}

local AOE = {
    {{
    {'Shadow Word: Pain', '!debuff(Shadow Word: Pain) & !talent(6,2) & toggle(AOE) & distance <= 40 & combat & infront & player.moving||{!player.buff(Twist of Fate) & health <= 35 & talent(1,1)}', 'enemies'},
    {'Vampiric Touch', 'ttd >= 7 & toggle(AOE) & infront & distance <= 40 & combat & !lastcast(Vampiric Touch) & !debuff(Vampiric Touch)||{!debuff(Shadow Word: Pain) & talent(6,2)}', 'enemies'},  
	{'Shadow Word: Pain', '!debuff(Shadow Word: Pain) & !talent(6,2) & toggle(AOE) & distance <= 40 & infront & combat', 'enemies'},
	},'player.buff(voidform) & !player.spell(Mind Blast).cooldown = 0 & !player.spell(Void Eruption).cooldown = 0'},
    {{
    {'Shadow Word: Pain', '!debuff(Shadow Word: Pain) & !talent(6,2) & toggle(AOE) & distance <= 40 & combat & infront & player.moving||{!player.buff(Twist of Fate) & health <= 35 & talent(1,1)}', 'enemies'},
    {'Vampiric Touch', 'ttd >= 7 & toggle(AOE) & infront & distance <= 40 & combat & !lastcast(Vampiric Touch) & !debuff(Vampiric Touch)||{!debuff(Shadow Word: Pain) & talent(6,2)}', 'enemies'},  
	{'Shadow Word: Pain', '!debuff(Shadow Word: Pain) & !talent(6,2) & toggle(AOE) & distance <= 40 & infront & combat', 'enemies'},
	},'!player.buff(voidform) & !player.insanity = 100'},
	--Shadow Crash on CD.
	{'Shadow Crash', '{target.area(8).enemies >= 2 & advanced & toggle(AOE) & player.buff(Voidform) & !target.moving & player.spell(Void Eruption).cooldown > 0} || {!advanced & toggle(AOE) & player.buff(Voidform) & !target.moving & player.spell(Void Eruption).cooldown > 0}', 'target.ground'},


}

local ST = { 
    --Void Eruption if VT on target is 13seconds or higher and SWP on target and in S2M.
	{'!Void Eruption','target.debuff(Vampiric Touch).duration > 13 & player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)','target'},
	--Void Eruption if VT on target is 6seconds or higher and SWP on target and no S2M.
	{'!Void Eruption', 'target.debuff(Vampiric Touch).duration > 4 & !player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)','target'},
	--SWD when target below 35
	{'!Shadow Word: Death', '!player.insanity >= 65 & !player.channeling(Void Eruption)','target'},
	--Misery.
	{'Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & !lastcast(Vampiric Touch)','target'},
	--Mind Blast if player is channeling Mind Flay.
	{'!Mind Blast', 'player.channeling(Mind Flay)','target'},
	{'Mind Blast', 'equipped(Mangaza\'s Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
	--Mind Blast on CD.
	{'Mind Blast', '!equipped(Mangaza\'s Madness)','target'},
	--Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
	{'Shadow Word: Pain', '{target.debuff(Shadow Word: Pain).duration < 3 & !talent(6,2)} || {!target.debuff(Shadow Word: Pain) & !talent(6,2)}','target'},
	{'Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || {!target.debuff(Vampiric Touch) & !lastcast(Vampiric Touch)} || {{!target.debuff(Shadow Word: Pain)} & talent(6,2)}','target'},
	--Mind Flay if Mind Blast is on cooldown
	{'Mind Flay', nil,'target'},
}

local lotv = {
    {{
    {'!Shadow Word: Death', '!player.spell(Void Eruption).cooldown = 0 & player.moving', 'target'},
    {'!Shadow Word: Death', '{!player.spell(Mind Blast).cooldown = 0 & !player.spell(Void Eruption).cooldown = 0 & player.spell(Shadow Word: Death).charges > 1} || {!player.channeling(Mind Blast) & !player.spell(Mind Blast).cooldown = 0 & !player.spell(Void Eruption).cooldown = 0 }', 'target'},
	{'!Shadow Word: Death', '!player.spell(Mind Blast).cooldown = 0 & !player.spell(Void Eruption).cooldown = 0 & !player.channeling(Void Eruption)', 'target'},
	}, '!target.area(10).enemies >= 4 & advanced'},
	 {{
    {'!Shadow Word: Death', '!player.spell(Void Eruption).cooldown = 0 & player.moving', 'target'},
    {'!Shadow Word: Death', '{!player.spell(Mind Blast).cooldown = 0 & !player.spell(Void Eruption).cooldown = 0 & player.spell(Shadow Word: Death).charges > 1} || {!player.channeling(Mind Blast) & !player.spell(Mind Blast).cooldown = 0 & !player.spell(Void Eruption).cooldown = 0 }', 'target'},
	{'!Shadow Word: Death', '!player.spell(Mind Blast).cooldown = 0 & !player.spell(Void Eruption).cooldown = 0 & !player.channeling(Void Eruption)', 'target'},
	}, '!advanced'},
	--Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 20% and Target Health is below or equal to 35% health.
	{'!Dispersion', 'player.buff(voidform).count >= UI(dps_Dspin) & UI(dps_D) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 30 & target.health <= 35 & !player.spell(Void Torrent).cooldown = 0','target'},
	--Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 20% and Target Health is above 35% health.
	{'!Dispersion', 'player.buff(voidform).count >= UI(dps_D2spin) & UI(dps_D) & !player.buff(Surrender to Madness) & player.insanity <= 30 & target.health > 35 & !player.spell(Void Torrent).cooldown = 0','target'},
	--Void Bolt on CD not interrupting casting MB.
	{'!Void Eruption', '!player.channeling(Mind Blast)','target'},
	--Mind Flay if Dots are up and VB and MB are on CD.
	{'Mind Flay', 'target.area(10).enemies >= 4 & advanced & target.debuff(Shadow Word: Pain)','target'},
	--Mind Blast on CD if VB is on CD.
	{'Mind Blast', '!player.spell(Void Eruption).cooldown <= gcd & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) & equipped(Mangaza\'s Madness)','target'},
	{'Mind Blast', '!player.spell(Void Eruption).cooldown <= gcd & !equipped(Mangaza\'s Madness)','target'},
	--Mind Blast if player is channeling Mind Flay.
	{'!Mind Blast', 'player.channeling(Mind Flay) & !player.spell(Void Eruption).cooldown <= gcd & !target.area(10).enemies >= 4 & advanced ','target'},
	{'!Mind Blast', 'player.channeling(Mind Flay) & !player.spell(Void Eruption).cooldown <= gcd & !advanced','target'},
	--Misery.
	{'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & !lastcast(Vampiric Touch)','target'},  
	--Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
	{'Shadow Word: Pain', '{target.debuff(Shadow Word: Pain).duration < 3 & !talent(6,2)} || {!target.debuff(Shadow Word: Pain) & !talent(6,2)} || {moving & !target.debuff(Shadow Word: Pain)}','target'},
	--Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
	{'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || {!target.debuff(Vampiric Touch) & !lastcast(Vampiric Touch)} || {{target.debuff(Shadow Word: Pain).duration <= 1.3 || !target.debuff(Shadow Word: Pain)} & talent(6,2) & !lastcast(Vampiric Touch)}','target'},  
	--Mind Flay if Dots are up and VB and MB are on CD.
	{'Mind Flay', '!player.spell(Mind Blast).cooldown = 0','target'},
}


local inCombat = {
	--Shadowform if no voidform and no shadowform.
	{'Shadowform', '!player.buff(voidform) & !player.buff(Shadowform) & !lastcast(Shadowform)', 'player'},
	{Movement, '!player.buff(Voidform || {player.buff Voidform & !spell(Void Eruption).cooldown = 0 & !player.channeling(Void Torrent)}'},
	{Surrender, '!player.channeling(Void Torrent)'}, 
	{'Mind Bomb', '{toggle(abc) & target.area(8).enemies >= 3 & !player.buff(Surrender To Madness) & !player.channeling(Void Torrent) & !talent(7,2)} || {toggle(abc) & target.area(8).enemies >= 3 & talent(7,2) & spell(Shadow Crash).cooldown = 0 & player.buff(Voidform) & !player.channeling(Void Torrent)}'},
	{Mythic, 'partycheck = 2 & UI(myth_fel)'},
	{Emergency, '!player.channeling(Void Torrent)'},
	{Potions, '!player.channeling(Void Torrent)'},
	{Survival, 'player.health < 100 & !player.channeling(Void Torrent) & !player.buff(Surrender to Madness)'},
	{Support, '!player.buff(Surrender to Madness) & !player.channeling(Void Torrent)'},
	{cooldowns, 'player.buff(voidform) & !player.channeling(Void Torrent) & toggle(cooldowns)'}, 
	{Zeks},
	{Insight, 'player.buff(Shadowy Insight) & {!player.channeling(Void Torrent) & {talent(7,1) & !player.insanity >= 65} || {talent(7,3) ||talent(7,2) & !player.insanity = 100}} || {player.moving & !player.buff(Surrender to Madness)}'},
	{Keybinds},
	{Trinkets, '!player.channeling(Void Torrent)'},
	{Interrupts, 'toggle(interrupts) & target.interruptAt(70) & target.infront & target.range <= 30 & !player.channeling(Void Torrent)'},
	{AOE, '!player.channeling(Void Torrent) & toggle(AOE) & range <= 40'}, 
	{lotv, 'player.buff(voidform) & !player.channeling(Void Torrent)'}, 
	{ST, "!player.buff(voidform) & !player.channeling(Void Torrent)"},

}

local outCombat = {
	-- Potion of Prolonged Power usage before pull if enabled in UI.
	{'#142117', 'pull_timer < 4 & UI(s_pull)'},
	-- Mind Blast before Pull.
	{'8092', 'pull_timer <= 1.2 & UI(pull_MB)'},
	{'Shadowform', '!player.buff(Shadowform) & !lastcast(Shadowform)','player'},
	--No Body and Soul from Class Hall.
	{Movement, '!player.buff(Body and Soul) & !inareaid = 1040'},
}

NeP.CR:Add(258, {
	name = '|cff6c00ff [Yobleed]|r Priest - |cff6c00ffShadow|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
