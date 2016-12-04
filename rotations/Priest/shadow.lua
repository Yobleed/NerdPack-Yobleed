local GUI = { 
	-- GUI Header 
{
	type = 'texture',
	texture = 'Interface\\AddOns\\Nerdpack-Yobleed\\media\\shadow.blp',
	width = 512,
	height = 256,
	offset = 90,
	y = 42,
	center = true
},

	-- GUI Survival & Potions
	{type = 'header', text = 'Survival & Potions', align = 'center'},
	{type = 'checkbox', text = 'Fade', key = 's_F', default= false},
	{type = 'checkspin', text = 'Power Word: Shield', key = 's_PWS', default_check = false, default_spin = 40},
	{type = 'checkspin', text = 'Dispersion', key = 's_D', default_check = false, default_spin = 20},
	{type = 'checkspin', text = 'Gift of the Naaru', key = 's_GotN', default_check = false, default_spin = 40},
	{type = 'checkspin', text = 'Healthstone', key = 's_HS', default_check = false, default_spin = 20},
	{type = 'checkspin', text = 'Ancient Healing Potion', key = 's_AHP', default_check = false, default_spin = 20},
	{type = 'checkbox', text = 'Potion of Prolonged Power with Lust/Hero', key = 's_PP', default= false},
	{type = 'ruler'}, {type = 'spacer'},

	-- GUI DPS Cooldown
	{type = 'header', text = 'DPS Cooldown', align = 'center'},
	{type = 'text', text = 'No Surrender to Madness Active', align = 'center'},
	{type = 'text', text = 'Check and Choose Stacks', align = 'center'},
	{type = 'checkspin', text = 'Dispersion: Target <= 35%', key = 'dps_D', default_check = false, default_spin = 35},
	{type = 'checkspin', text = 'Dispersion: Target > 35%', key = 'dps_D2', default_check = false, default_spin = 30},
	{type = 'spacer'},
	{type = 'text', text = '--AOE--', align = 'center'},
	{type = 'checkspin', text = 'Dispersion: Target <= 35%', key = 'dps_DAOE', default_check = false, default_spin = 40},
	{type = 'checkspin', text = 'Dispersion: Target > 35%', key = 'dps_D2AOE', default_check = false, default_spin = 37},
	{type = 'ruler'}, {type = 'spacer'},

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', default = false},
	{type = 'checkbox', text = 'Bottom Trinket', key = 'Trinket_2', default = false},
	{type = 'ruler'}, {type = 'spacer'},

	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'text', text = 'Left Shift: Mind Sear|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
	{type = 'checkbox', text = 'Mind Sear', key = 'k_MS', default = false},
	{type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', default = false},
	{type = 'checkbox', text = 'Pause', key = 'k_P', default = false},
	{type = 'ruler'}, {type = 'spacer'},

	-- GUI Moving
	{type = 'header', text = 'Movement', align = 'center'},
	{type = 'checkbox', text = 'Body and Soul', key = 'm_Body', default = false},
	{type = 'ruler'}, {type = 'spacer'},

	-- GUI Party Support
	{type = 'header', text = 'Party Support', align = 'center'},
	{type = 'text', text = 'Attempt to save members of your party.', align = 'center'},
	{type = 'checkspin', text = 'Gift of the Naaru', key = 'sup_GotN', default_check = false, default_spin = 20},
	{type = 'checkspin', text = 'Power Word: Shield', key = 'sup_PWS', default_check = false, default_spin = 20},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff6c00ff ----------------------------------------------------------------------|r')
	print('|cff6c00ff --- |rPriest: |cff6c00ffSHADOW|r')
	print('|cff6c00ff --- |rRecommended Talents: 1/1 - 2/2 - 3/1 - 4/2 - 5/3 - 6/3 - 7/3')
	print('|cff6c00ff --- |rRecommended Talents: 1/1 - 2/2 - 3/1 - 4/2 - 5/2 - 6/1 - 7/3')
	print('|cff6c00ff ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		-- Mind Bomb toggle only active with AoE.
		key = 'xMind',
		name = 'Mind Bomb AoE',
		text = 'Enable/Disable: Mind Bomb in AOE rotation.',
		icon = 'Interface\\ICONS\\Spell_shadow_mindbomb',
	})
end

local Survival = {
	-- Fade usage if enabled in UI.
	{'Fade', 'target.threat = 100 & UI(s_F)'},
	-- Power Word: Shield usage if enabled in UI.
	{'Power Word: Shield', 'player.health <= UI(s_PWS_spin) & UI(s_PWS_check)'},
	-- Dispersion usage if enabled in UI.
	{'!Dispersion', 'player.health <= UI(s_D_spin) & UI(s_D_check)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'Gift of the Naaru', 'player.health <= UI(s_GotN_spin) & UI(s_GotN_check)'},
	-- Healthstone usage if enabled in UI.
	{'#Healthstone', 'player.health <= UI(s_HS_spin) & UI(s_HS_check)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#Ancient Healing Potion', 'player.health <= UI(s_AHP_spin) & UI(s_AHP_check)'},
}

local Potions = {
	-- Potion of Prolonged Power usage if enabled in UI.
	{'#Potion of Prolonged Power', 'player.hashero & !player.buff(Potion of Prolonged Power) & UI(s_PP)'},
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)'},
}

local Keybinds = {
	-- Mind Sear on target if Left-Shift if enabled in UI.
	{'!Mind Sear', 'keybind(lshift) & UI(k_MS)'},
	-- Mass Dispel at cursor on Left-Control if enabled in UI.
	{'/cast [@cursor] !Mass Dispel', 'keybind(lcontrol) & UI(k_MD)'},
	-- Pause on Left-Alt if enabled in UI.
	{'%pause', 'keybind(lalt) & UI(k_P)'},
}

local Movement = {
	-- Body and Soul usage if enabled in UI.
	{'!Power Word: Shield', 'talent(2,2) & player.movingfor >= 1 & UI(m_Body)', 'player'},
}

local Support = {
	-- Gift of the Naaru usage if enabled in UI.
	{'!Gift of the Naaru', 'lowest.health <= UI(sup_GotN_spin) & UI(sup_GotN_check)', 'lowest'},
	-- Power Word: Shield usage if enabled in UI.
	{'!Power Word: Shield', 'lowest.health <= UI(sup_PWS_spin) & UI(sup_PWS_check)', 'lowest'},
}

local Interrupts = {
	-- Silence selected target.
	{'Silence'},
	-- Arcane Torrent if within 8 yard range of selected target when Silence is on cooldown.
	{'Arcane Torrent', 'target.range <= 8 & spell(Silence).cooldown > gcd & !lastgcd(Silence)'},
}

local Insight = { 
	-- Mind Blast when buffed with Shadowy Insight only when Voidbolt is on CD.
	{'!Mindblast', '!spell(Void Eruption).cooldown = 0'}, 
}




local Emergency = {
  --Dispersion when SWD charges are 0 and VF stacks are 95 or higher and insanity is below or equal to 50%.
  {'!Dispersion', 'player.spell(Shadow Word: Death).charges < 1 & player.buff(voidform).count >= 95 & player.insanity <= 50'},
  --Power Infusion if talent active and VF stacks are 70 or higher if SWD charges are 0 and insanity is 50% or below.
  {'!Power Infusion', 'talent(Power Infusion) & player.buff(voidform).count >= 70 & spell(Shadow Word: Death).charges < 1 & player.insanity <= 50'},
  --Power Infusion if talent active and VF stacks are 75 or higher.
  {'!Power Infusion', 'talent(Power Infusion) & player.buff(voidform).count >= 75'},

}

local cooldowns = {
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target below or equal to 35% health.
  {'!Power Infusion', 'talent(Power Infusion) & !player.buff(Surrender to Madness) & player.buff(voidform).count >= 20 & target.health <= 35', 'player'},
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target above or 35% health.
  {'!Power Infusion', 'talent(Power Infusion) & !player.buff(Surrender to Madness) & player.buff(voidform).count >= 10 & target.health > 35', 'player'},
  --Mindbender if talent is active on CD in S2M.
  {'!Mindbender', 'talent(Mindbender) & player.buff(Surrender to Madness)'},
  --Mind Bender if talent is active and not in S2M if VF stacks are above 5.
  {'!Mindbender', 'talent(Mindbender) & !player.buff(Surrender to Madness) & player.buff(voidform).count > 5'},
  --Shadowfiend if Void Bolt is on CD and VF stacks are above 10 when Power Infusion talent is not active.
  {'!Shadowfiend', '!talent(Mindbender) & !spell(Void Eruption).cooldown = 0 & player.buff(voidform).count > 10 & !talent(Power Infusion)'},
  --Shadowfiend if Void Bolt is on CD and VF stacks are above or equal to 15 and Power Infusion talent is active.
  {'!Shadowfiend', '{!talent(Mindbender) & !spell(Void Eruption).cooldown = 0 & player.buff(voidform).count >= 15z & talent(Power Infusion) & spell(Power Infusion).cooldown = 0} || {!talent(Mindbender) & !spell(Void Eruption).cooldown = 0 & player.buff(voidform).count >= 5 & talent(Power Infusion) & !spell(Power Infusion).cooldown = 0}'},

}

local AOE = {
   --Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 40% and Target Health is below or equal to 35% health.
  {'!Dispersion', 'player.buff(voidform).count >= UI(dps_DAOE_spin) & UI(dps_DAOE_check) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 40 & target.health <= 35'},
  --Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 40% and Target Health is above 35% health.
  {'!Dispersion', 'player.buff(voidform).count >= UI(dps_D2AOE_spin) & UI(dps_D2AOE_check) & !player.buff(Surrender to Madness) & player.insanity <= 40 & target.health > 35'},
   --Torrent on CD.
  {'!Void Torrent'},
  --Voidbolt on CD
  {'!Void Eruption', 'player.buff(voidform)'},
  --Void Eruption if VT on target is 13seconds or higher and SWP on target and in S2M.
  {'!Void Eruption','target.debuff(Vampiric Touch).duration > 13 & player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Void Eruption if VT on target is 6seconds or higher and SWP on target and no S2M.
  {'!Void Eruption', 'target.debuff(Vampiric Touch).duration > 6 & !player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --SWD when target below 35%
  {'!Shadow Word: Death', 'target.health <= 35 & !player.channeling(Void Eruption)'},
  --MB if channeling Mind flay or Mind Sear
  {'!Mind Blast', 'player.channeling(Mind Flay) || player.channeling(Mind Sear)'},
  --Mind Blast on CD.
  {'Mind Blast', '{!player.insanity >= 70 & talent(Legacy of the Void) & !player.buff(voidform) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) } || {!player.insanity = 100 & talent(Surrender to Madness) & !player.buff(voidform) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) } || {target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) } & player.buff(voidform)'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || !target.debuff(Vampiric Touch)'},
  --Mind Sear if 3 or more targets within 10yd range of target with dots up.
  {'Mind Sear', 'target.area(10).enemies >= 3 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
  --Mind Flay if 2 or less targets within 10yd range of target with dots up. 
  {'Mind Flay', 'target.area(10).enemies <= 2 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'}, 

}

local AOEs2m = {
  --Dispersion after Void Torrent.
  {'!Dispersion', 'lastcast(Void Torrent)'},
  --Torrent on CD.
  {'!Void Torrent'},
   --Voidbolt on CD
  {'!Void Eruption', 'player.buff(voidform)'},
  --Void Eruption if VT on target is 13seconds or higher and SWP on target and in S2M.
  {'!Void Eruption','target.debuff(Vampiric Touch).duration > 13 & player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Void Eruption if VT on target is 6seconds or higher and SWP on target and no S2M.
  {'!Void Eruption', 'target.debuff(Vampiric Touch).duration > 6 & !player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --SWD Charge dump if below 20 stacks of VF and if DoTs are up.
  {'!Shadow Word: Death', 'target.health <= 35 & player.buff(voidform).count < 20  & target.debuff(Shadow Word: Pain).duration > 6 & target.debuff(Vampiric Touch).duration > 6'},
  --SWD if insanity is below 40%.
  {'!Shadow Word: Death', 'target.health <= 35 & player.insanity <= 40 & !lastcast(Shadow Word: Death)'},
  --MB if channeling Mind flay or Mind Sear
  {'!Mind Blast', 'player.channeling(Mind Flay) || player.channeling(Mind Sear)'},
  --Mind Blast on CD.
  {'Mind Blast', '{!player.insanity >= 70 & talent(Legacy of the Void) & !player.buff(voidform) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) } || {!player.insanity = 100 & talent(Surrender to Madness) & !player.buff(voidform) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) } || {target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain) } & player.buff(voidform)'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || !target.debuff(Vampiric Touch)'},
  --Mind Sear if 3 or more targets within 10yd range of target with dots up.
  {'Mind Sear', 'target.area(10).enemies >= 3 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
  --Mind Flay if 2 or less targets within 10yd range of target with dots up. 
  {'Mind Flay', 'target.area(10).enemies <= 2 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'}, 

}

local ST1 = {
  --Void Eruption if VT on target is 13seconds or higher and SWP on target and in S2M.
  {'!Void Eruption','target.debuff(Vampiric Touch).duration > 13 & player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Void Eruption if VT on target is 6seconds or higher and SWP on target and no S2M.
  {'!Void Eruption', 'target.debuff(Vampiric Touch).duration > 6 & !player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --SWD when target below 35%
  {'!Shadow Word: Death', '{target.health <= 35 & talent(Legacy of the Void) & !player.insanity >= 70} || {target.health <= 35 & talent(Surrender to Madness) & !player.insanity = 100}'},
  --Mind Blast if player is channeling Mind Flay.
  {'!Mind Blast', 'player.channeling(Mind Flay)'},
  --Mind Blast on CD.
  {'Mind Blast', '{talent(Legacy of the Void) & !player.insanity >= 70} || {talent(Surrender to Madness) & !player.insanity = 100}'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || !target.debuff(Vampiric Touch)'}, 
  --Mind Flay if Mind Blast is on cooldown
  {'Mind Flay', '!spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch) & !toggle(AOE)'},

}

local lotv1 = {
  --Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 40% and Target Health is below or equal to 35% health.
  {'!Dispersion', 'player.buff(voidform).count >= UI(dps_D_spin) & UI(dps_D_check) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 40 & target.health <= 35'},
  --Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 40% and Target Health is above 35% health.
  {'!Dispersion', 'player.buff(voidform).count >= UI(dps_D2_spin) & UI(dps_D2_check) & !player.buff(Surrender to Madness) & player.insanity <= 40 & target.health > 35'},
  --Torrent on CD.
  {'!Void Torrent'},
  --SWD if target is below or equal to 35% Health and player insanity is below or equal to 65%.
  {'!Shadow Word: Death', 'target.health <= 35 & player.insanity <= 65'},
  --Void Bolt on CD not interrupting casting MB.
  {'!Void Eruption', '!player.channeling(Mind Blast)'}, 
  --Mind Blast on CD if VB is on CD.
  {'!Mind Blast', '!player.spell(Void Eruption).cooldown = 0 & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'!Vampiric Touch', 'target.debuff(Vampiric Touch).duration <= 3 || !target.debuff(Vampiric Touch)'}, 
  --Mind Flay if Dots are up and VB and MB are on CD.
  {'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & !player.spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
  

}

local s2m1 = {
  --Dispersion after Void Torrent.
  {'!Dispersion', 'lastcast(Void Torrent)'},
  --Torrent on CD.
  {'!Void Torrent'},
  --SWD Charge dump if below 20 stacks of VF and if DoTs are up.
  {'!Shadow Word: Death', 'target.health <= 35 & player.buff(voidform).count < 20  & target.debuff(Shadow Word: Pain).duration > 6 & target.debuff(Vampiric Touch).duration > 6'},
  --SWD if insanity is below 40%.
  {'!Shadow Word: Death', 'target.health <= 35 & player.insanity <= 40 & !lastcast(Shadow Word: Death)'}, 
  --Void Bolt on CD not interrupting casting MB.
  {'!Void Eruption', '!player.channeling(Mind Blast)'}, 
  --Mind Blast on CD if VB is on CD.
  {'!Mind Blast', '!player.spell(Void Eruption).cooldown = 0 & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'!Vampiric Touch', 'target.debuff(Vampiric Touch).duration <= 3 || !target.debuff(Vampiric Touch)'}, 
  --Mind Flay if Dots are up and VB and MB are on CD.
  {'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & !player.spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},

}

--------------------------------------------------LEGENDARY BELT-----------------------------------------------------------------------------------------------------------
local ST2 = { 
  --Void Eruption if VT on target is 13seconds or higher and SWP on target and in S2M.
  {'!Void Eruption','target.debuff(Vampiric Touch).duration > 13 & player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Void Eruption if VT on target is 6seconds or higher and SWP on target and no S2M.
  {'!Void Eruption', 'target.debuff(Vampiric Touch).duration > 6 & !player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --SWD when target below 35%
  {'!Shadow Word: Death', '{target.health <= 35 & talent(Legacy of the Void) & !player.insanity >= 70} || {target.health <= 35 & talent(Surrender to Madness) & !player.insanity = 100}'},
  --Mind Blast if player is channeling Mind Flay.
  {'!Mind Blast', 'player.channeling(Mind Flay)'},
  --Mind Blast if target has SWP and VT.
  {'Mind Blast', 'target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
  --Mind Blast if target doesnt have SWP and VT and wasn't last cast.
  {'Mind Blast', '!target.debuff(Shadow Word: Pain) & !target.debuff(Vampiric Touch) & !lastcast(Mind Blast) & {talent(Legacy of the Void) & !player.insanity >= 70} || {talent(Surrender to Madness) & !player.insanity = 100}'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !lastcast(Vampiric Touch)} || !target.debuff(Vampiric Touch)'}, 
  --Mind Flay if Mind Blast is on cooldown
  {'Mind Flay', '!spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch) & !toggle(AOE)'},

}

local lotv2 = {
  --Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 40% and Target Health is below or equal to 35% health.
  {'!Dispersion', 'player.buff(voidform).count >= UI(dps_D_spin) & UI(dps_D_check) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 40 & target.health <= 35'},
  --Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 40% and Target Health is above 35% health.
  {'!Dispersion', 'player.buff(voidform).count >= UI(dps_D2_spin) & UI(dps_D2_check) & !player.buff(Surrender to Madness) & player.insanity <= 40 & target.health > 35'},
  --Torrent on CD.
  {'!Void Torrent'},
  --SWD if target is below or equal to 35% Health and player insanity is below or equal to 65%.
  {'!Shadow Word: Death', 'target.health <= 35 & player.insanity <= 65'},
  --Void Bolt on CD not interrupting casting MB.
  {'!Void Eruption', '!player.channeling(Mind Blast)'}, 
  --Mind Blast on CD if VB is on CD.
  {'!Mind Blast', '!player.spell(Void Eruption).cooldown = 0 & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'!Vampiric Touch', 'target.debuff(Vampiric Touch).duration <= 3 || !target.debuff(Vampiric Touch)'}, 
  --Mind Flay if Dots are up and VB and MB are on CD.
  {'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & !player.spell(Mind Blast).cooldown = 0 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},
  
}

local s2m2 = {
  --Dispersion after Void Torrent.
  {'!Dispersion', 'lastcast(Void Torrent)'},
  --Torrent on CD.
  {'!Void Torrent'},
  --SWD Charge dump if below 20 stacks of VF and if DoTs are up.
  {'!Shadow Word: Death', 'target.health <= 35 & player.buff(voidform).count < 20  & target.debuff(Shadow Word: Pain).duration > 6 & target.debuff(Vampiric Touch).duration > 6'},
  --SWD if insanity is below 40%.
  {'!Shadow Word: Death', 'target.health <= 35 & player.insanity <= 40 & !lastcast(Shadow Word: Death)'}, 
  --Void Bolt on CD not interrupting casting MB.
  {'!Void Eruption', '!player.channeling(Mind Blast)'}, 
  --Mind Blast on CD if VB is on CD.
  {'!Mind Blast', '!player.spell(Void Eruption).cooldown = 0 & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'!Shadow Word: Pain', 'target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'!Vampiric Touch', 'target.debuff(Vampiric Touch).duration <= 3 || !target.debuff(Vampiric Touch)'}, 
  --Mind Flay if Dots are up and VB and MB are on CD.
  {'Mind Flay', '!player.spell(Void Eruption).cooldown = 0 & player.spell(Mind Blast).charges < 1 & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch)'},

}

   

local inCombat = {

  --Shadowform if no voidform and no shadowform.
  {'Shadowform', '!player.buff(Voidform) & !player.buff(Shadowform)'},
  -- S2M when in Xavius Dreamstate.
  {"Surrender to Madness", "player.debuff(Dream Simulacrum)"},
  {Emergency, '!player.channeling(Void Torrent)'},
  {cooldowns, 'player.buff(voidform) & !player.channeling(Void Torrent) & toggle(cooldowns)'}, 
  {s2m2, "equipped(Mangaza's Madness) & talent(Surrender to Madness) & player.buff(voidform) & !toggle(AOE) & !player.channeling(Void Torrent) & player.buff(Surrender to Madness)"},
  {s2m1, "!equipped(Mangaza's Madness) & talent(Surrender to Madness) & player.buff(voidform) & !toggle(AOE) & !player.channeling(Void Torrent) & player.buff(Surrender to Madness)"},
  {lotv2, "{equipped(Mangaza's Madness) & player.buff(voidform) & !toggle(AOE) & !player.channeling(Void Torrent)  & talent(Legacy of the Void)} || {talent(Surrender to Madness) & !player.buff(Surrender to Madness) & equipped(Mangaza's Madness) & player.buff(voidform) & !toggle(AOE) & !player.channeling(Void Torrent)}"}, 
  {lotv1, "{!equipped(Mangaza's Madness) & player.buff(voidform) & !toggle(AOE) & !player.channeling(Void Torrent) & talent(Legacy of the Void)} || {talent(Surrender to Madness) & !player.buff(Surrender to Madness) & !equipped(Mangaza's Madness) & player.buff(voidform) & !toggle(AOE) & !player.channeling(Void Torrent)}"}, 
  {ST2, "equipped(Mangaza's Madness) & !player.buff(voidform) & !toggle(AOE)"}, 
  {ST1, "!equipped(Mangaza's Madness) & !player.buff(voidform) & !toggle(AOE)"},
  {AOEs2m, 'toggle(AOE) & !player.channeling(Void Torrent) & player.buff(Surrender to Madness)'},
  {AOE, 'toggle(AOE) & !player.channeling(Void Torrent) & !player.buff(Surrender to Madness)'},

	{Insight, 'player.buff(Shadowy Insight) & !player.channeling(Void Torrent)'},
	{Survival, 'player.health < 100 & !player.channeling(Void Torrent) & !player.buff(Surrender to Madness)'},
	{Potions, '!player.channeling(Void Torrent)'},
	{Trinkets, '!player.channeling(Void Torrent)'},
	{Keybinds},
	{Movement, '!player.buff(Voidform) || player.buff(Voidform) & !player.buff(Surrender to Madness)'},
	{Support, '!player.buff(Surrender to Madness) & !player.channeling(Void Torrent)'}
	{Interrupts, 'toggle(interrupts) & target.interruptAt(80) & target.infront & target.range <= 30 & !player.channeling(Void Torrent)'},
	{'Mind Bomb', 'toggle(xMind) & toggle(AoE) & target.area(8).enemies >= 3 & !player.buff(Surrender To Madness)'},
}

local outCombat = {
	{'Shadowform', '!player.buff(Shadowform)'},
	{Keybinds},
	{Movement},
	{'%ressdead(Resurrection)'},
}

NeP.CR:Add(258, {
	name = '|cff6c00ff [Yobleed]|r Priest - |cff6c00ffShadow|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
