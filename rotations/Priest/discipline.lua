

local GUI = {  
        --[[ Header Texture ]]
		{ 
			type = "texture",
			texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\disc.blp",
			width = 512, 
			height = 256, 
			offset = 90, 
			y = 42, 
			center = true 
		},


    --Cooldowns
	{type = 'header', text = 'Cooldowns when toggled on', align = 'center'},
	{type = 'checkbox', text = 'Use Pain Suppression', key = 'c_PS', width = 55, default = false},
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
	{type = 'checkbox', text = 'Power Word: Barrier', key = 'k_PWB', width = 55, default = false},
	{type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', width = 55, default = false},
	{type = 'checkbox', text = 'Pause', key = 'k_P', width = 55, default = false},
	{type = 'ruler'},{type = 'spacer'},

	--POTIONS
	{type = 'header', text = 'Potions', align = 'center'},
	{type = 'text', text = 'Check to enable Potions', align = 'center'},
	{type = 'checkspin', text = 'Healthstone', key = 'p_HS', width = 55, default_check = false, default_spin = 25},
	{type = 'checkspin', text = 'Ancient Healing Potion', key = 'p_AHP', width = 55, default_check = false, default_spin = 25},
	{type = 'checkspin', text = 'Ancient Mana Potion', key = 'p_AMP', width = 55, default_check = false, default_spin = 20},
	{type = 'ruler'},{type = 'spacer'},
    
    --Spreading Atonement
	{type = 'header', text = 'Atonement Spreading', align = 'center'},
	{type = 'text', text = 'Forces Rotation to Spread Atonement before DPS', align = 'center'},
	{type = 'checkbox', text = 'ON/OFF', key = 'tog_plea', default = false},
	{type = 'spinner', text = 'Number of Atonements', key = 'plea',  width = 55, step = 1, min = 0, max = 10, default = 6},
	{type = 'ruler'},{type = 'spacer'},


	--Solo
	{type = 'header', text = 'Solo mode', align = 'center'},
	{type = 'text', text = 'Player health values', align = 'center'},
	{type = 'spinner', text = 'Gift of the Naaru', key = 'full_Gift', width = 55, default = 20},
	{type = 'spinner', text = 'Shadow Mend', key = 'full_mend',  width = 55, default = 40},
	{type = 'spinner', text = 'Power Word: Shield', key = 'full_PWS',  width = 55, default = 70},
	{type = 'ruler'},{type = 'spacer'},
    
    --TANK
	{type = 'header', text = 'Tank', align = 'center'},
	{type = 'text', text = 'Tank health values', align = 'center'},
	{type = 'spinner', text = 'Shadow Mend', key = 't_mend',  width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 't_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},


	--LOWEST
	{type = 'header', text = 'Lowest', align = 'center'},
	{type = 'text', text = 'Lowest health values', align = 'center'},
	{type = 'spinner', text = 'Power Word: Shield', key = 'l_PWS',  width = 55, default = 90},
	{type = 'spinner', text = 'Shadow Mend', key = 'l_mend',  width = 55, default = 40},
	{type = 'spinner', text = 'Plea', key = 'l_plea', min = 70, max = 90, width = 55, default = 80}, --step = 1
	{type = 'ruler'},{type = 'spacer'},

}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff58FAF4 ----------------------------------------------------------------------|r')
	print('|cff58FAF4 --- |rPriest: |cff58FAF4DISCIPLINE|r')
	print('|cff58FAF4 --- |rRecommended Talents: 1/3 or 1/2 - 2/2 or 2/1 - 3/1 - 4/2 or 4/3 - 5/2 or 5/3 - 6/2 or 6/3 - 7/1 or 7/2')
	print('|cff58FAF4 ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

		NeP.Interface:AddToggle({
		key = 'xDPS',
		name = 'Solo',
		text = 'ON/OFF Solo rotation',
		icon = 'Interface\\ICONS\\spell_holy_holysmite', --toggle(xDPS)
	})

	NeP.Interface:AddToggle({
		key = 'disp',
		name = 'Dispell',
		text = 'ON/OFF Dispel All',
		icon = 'Interface\\ICONS\\spell_holy_dispelmagic', --toggle(disp)
	})

	NeP.Interface:AddToggle({
		key = 'ato',
		name = 'OOC Atonement',
		text = 'ON/OFF Out of Combat Atonement Spreading',
		icon = 'Interface\\ICONS\\ability_priest_atonement', --toggle(ato)
	})
    
    NeP.Interface:AddToggle({
		key = 'ooc_heal',
		name = 'OOC Healing',
		text = 'ON/OFF Out of Combat Healing',
		icon = 'Interface\\ICONS\\spell_priest_plea_yellow', --toggle(ooc_heal) 
	})

end
local Rapture = {
	  --Power Word: Shield on CD.
	{'Power Word: Shield', '!tank.buff(Power Word: Shield)', 'tank'},
    {'Power Word: Shield', '!lowest1.buff(Power Word: Shield)', 'lowest1'},
    {'Power Word: Shield', '!lowest2.buff(Power Word: Shield)', 'lowest2'},
    {'Power Word: Shield', '!lowest3.buff(Power Word: Shield)', 'lowest3'},
    {'Power Word: Shield', '!lowest4.buff(Power Word: Shield)', 'lowest4'},
    {'Power Word: Shield', '!lowest5.buff(Power Word: Shield)', 'lowest5'},
    {'Power Word: Shield', '!lowest5.buff(Power Word: Shield)', 'lowest6'},

}

local Emergency = {
    --Power Infusion if PWS and Rapture and Pain Suppression is on CD.
	{'!Power Infusion', 'spell(Power Word: Shield).cooldown > 0 & spell(Rapture).cooldown > 0 & spell(Pain Suppression).cooldown > 0 & tank.health <= 20', 'player'},
	--Power Infusion if 5 or more people are below 40% Health and cooldown is toggled on.
	{'!Power Infusion', 'player.area(40, 40).heal >= 5 & toggle(cooldowns)', 'player'},
	--Mindbender if mana is below or if 90%.
	{'Mindbender', 'talent(Mindbender) & player.mana <= 90 & toggle(cooldowns)', 'target'},
	--Rapture if 5 ore more people are below 30% health and cooldown is toggled on.
	{'!Rapture', 'player.area(40, 30).heal >= 5 & spell(Power Word: Shield).cooldown > 0 & toggle(cooldowns)', 'player'},
	--Pain Suppression if lowest health is below or equal to 20% and checked.
	{'!Pain Suppression', 'UI(c_PS) & lowest.health <= 20 & toggle(cooldowns)', 'lowest'},
	--Gift of the Naaru if lowest health is below or if 20%.
	{'Gift of the Naaru', 'lowest.health <= 20 & toggle(cooldowns) ', 'lowest'},
}

local Trinkets = {
	--Top Trinket usage if UI enables it.
	{'#trinket1', 'UI(trinket_1)'},
	--Bottom Trinket usage if UI enables it.
	{'#trinket2', 'UI(trinket_2)'}
}

local Keybinds = {
    -- Power Word: Barrier on left shift when checked in UI.
    {'!Power Word: Barrier', 'keybind(lshift) & UI(k_PWB)', 'mouseover.ground' },
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_PWB)', 'mouseover.ground' },
	-- Power Word: Barrier on left shift when checked in UI.
    {'!Power Word: Barrier', 'keybind(lshift) & UI(k_MD) & !advanced', 'cursor.ground' },
	--Mass Dispel on Mouseover target Left Control when checked in UI.
	{'!Mass Dispel', 'keybind(lcontrol) & UI(k_MD) & !advanced', 'cursor.ground' },
	-- Pause on left alt when checked in UI.
	{'%pause', 'keybind(lalt)& UI(k_P)'}
} 

local Potions = {
	--Health Stone below 20% health. Active when NOT channeling Divine Hymn.
	{'#Healthstone', 'UI(p_HS_check) & player.health <= UI(p_HS_spin) & !player.channeling(Divine Hymn)'},
	--Ancient Healing Potion below 20% health. Active when NOT channeling Divine Hymn.
	{'#Ancient Healing Potion', 'UI(p_AHP_check) & player.health <= UI(p_AHP_spin) & !player.channeling(Divine Hymn)'},
	--Ancient Mana Potion below 20% mana. Active when NOT channeling Divine Hymn.
	{'#Ancient Mana Potion', 'UI(p_AMP_check) & player.mana <= UI(p_AMP_spin) & !player.channeling(Divine Hymn)'}
}


local Spread = {
--Spreading Atonement before DPS if checked.
	{'Power Word: Radiance', 'spell(plea).count < 3 & !lowest.buff(Atonement)', 'lowest'},
	{'Plea', 'lowest1.health > UI(l_mend) & !lowest1.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest1'},
    {'Plea', 'lowest2.health > UI(l_mend) & !lowest2.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest2'},
    {'Plea', 'lowest3.health > UI(l_mend) & !lowest3.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest3'},
    {'Plea', 'lowest4.health > UI(l_mend) & !lowest4.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest4'},
    {'Plea', 'lowest5.health > UI(l_mend) & !lowest5.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest5'},
    {'Plea', 'lowest6.health > UI(l_mend) & !lowest6.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest6'},
    {'Plea', 'lowest7.health > UI(l_mend) & !lowest7.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest7'},
    {'Plea', 'lowest8.health > UI(l_mend) & !lowest8.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest8'},
    {'Plea', 'lowest9.health > UI(l_mend) & !lowest9.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest9'},
    {'Plea', 'lowest10.health > UI(l_mend) & !lowest10.buff(Atonement) & spell(Plea).count <= UI(plea)', 'lowest10'},
    {'Power Word: Shield', '!tank.buff(atonement) || !tank.buff(Power Word: Shield)', 'tank'},
}


local Solo = {
    --Plea to keep on Atonement.
    {'!Plea', "{!player.buff(Atonement) & player.health < 90} || {!player.buff(Atonement) & spell(Light's Wrath).cooldown = 0}", 'player'},
    --PWS if player health is below or if UI value.
	{'Power Word: Shield', 'Player.Health <= UI(full_PWS)', 'player'},
    --LW on CD if toggled.
	{"Light's Wrath", '{toggle(cooldowns) & player.buff(Atonement) & target.debuff(Schism) & target.debuff(Schism).duration >= 3} || {toggle(cooldowns) & player.buff(Atonement) & !talent(Schism)}', 'target'},
    --PI on CD if toggled.
	{'Power Infusion', 'talent(Power Infusion) & toggle(cooldowns)', 'target'},
	--Shadowfiend on CD if toggled.
	{'Shadowfiend', 'toggle(cooldowns) & !talent(Mindbender)', 'target'},
    --Shadow Mend if player health is below or if UI value.
	{'Shadow Mend', 'player.health <= UI(full_mend)', 'player'},
    --Gift of the Naaru if player health is below or if UI value.
	{'Gift of the Naaru', 'player.health <= UI(full_Gift)', 'player'},
    --Purge the Wicked if talent and not on target.
	{'Purge the Wicked', 'talent(Purge the Wicked) & !target.debuff(Purge the Wicked)', 'target'},
	--Shadow Word: Pain if not on target.
	{'Shadow Word: Pain', '!talent(Purge the Wicked) & !target.debuff(Shadow Word: Pain)', 'target'},
	--Schism on cooldown.
	{'Schism', 'talent(Schism) & !moving', 'target'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'target.debuff(Purge the Wicked) || target.debuff(Shadow Word: Pain)', 'target'},
    --Power Word: Solace on cooldown if talent.
	{'Power Word: Solace', 'talent(Power Word: Solace)', 'target'},
	--Divine Star if mobs are 3 or more.
	{'Divine Star', 'talent(Divine Star) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
	--Divine Star if moving.
	{'Divine Star', 'talent(Divine Star) & player.area(24).enemies.infront >= 1 & moving'},
	--Smite on CD.
	{'Smite', nil, 'target'},
	
}

local Atonement = {
     --LW on CD if toggled and if atonement stacks are 5 or higher.
	{"!Light's Wrath", '{toggle(cooldowns) & target.debuff(Schism) & target.debuff(Schism).duration >= 3 & spell(plea).count >= 5} || {toggle(cooldowns) & player.buff(Atonement) & !talent(Schism) & spell(plea).count >= 5}', 'target'},
	--Shadowfiend on CD if toggled.
	{'Shadowfiend', 'toggle(cooldowns) & !talent(Mindbender)', 'target'},
    --Purge the Wicked if talent and not on target.
	{'Purge the Wicked', 'talent(Purge the Wicked) & !target.debuff(Purge the Wicked)', 'target'},
	--Shadow Word: Pain if not on target.
	{'Shadow Word: Pain', '!talent(Purge the Wicked) & !target.debuff(Shadow Word: Pain)', 'target'},
	--Schism on cooldown.
	{'Schism', 'talent(Schism) & !moving', 'target'},
	--Penance on cooldown if target has Purge the Wicked or Shadow Word: Pain.
	{'Penance', 'target.debuff(Purge the Wicked) || target.debuff(Shadow Word: Pain)', 'target'},
    --Power Word: Solace on cooldown if talent.
	{'Power Word: Solace', 'talent(Power Word: Solace)', 'target'},
	--Divine Star if mobs are 3 or more.
	{'Divine Star', 'talent(Divine Star) & player.area(24).enemies.infront >= 3 & toggle(AOE)'},
	--Divine Star if moving.
	{'Divine Star', 'talent(Divine Star) & player.area(24).enemies.infront >= 1 & moving'},
	--Smite on CD.
	{'Smite', nil, 'target'},


}

local Tank = {
    --Power Word: Shield if tank doesn't have atonement or if tank doesnt have PWS.
	{'Power Word: Shield', '!tank.buff(atonement) || !tank.buff(Power Word: Shield)', 'tank'},
	--Plea on UI value if no 6 atonements are active.
    {'Plea', 'tank.health <= UI(t_plea) & !tank.buff(Atonement) & spell(Plea).count <= 6', 'tank'},
    --Shadow Mend on UI value if PWS don't make it.
    {'!Shadow Mend', 'tank.health <= UI(t_mend)', 'tank'},

}

local Lowest = {  
    --Power Word: Radiance if lowest and 2 or more around within 40yds without atonement buff.
	{'Power Word: Radiance', '{spell(plea).count > 6 & spell(plea).count < 10 & player.buff(Power Infusion) & lowest.area(40,75).heal >= 10 & advanced} || {spell(plea).count > 6 & spell(plea).count < 10 & player.buff(Power Infusion) & player.area(40,75).heal >= 10 & !advanced}', 'lowest'},
    --Power Word: Shield on UI value if Atonement won't make it or if not Atonement.
    {'Power Word: Shield', 'lowest.health <= UI(l_PWS) & !lowest.buff(Power Word: Shield)', 'lowest'},
    --Plea on UI value if no 6 atonements are active.
    {'Plea', 'lowest.health <= UI(l_plea) & !lowest.buff(Atonement) & spell(Plea).count <= 6', 'lowest'},
    --Shadow Mend on UI value if PWS don't make it.
    {'!Shadow Mend', 'lowest.health <= UI(l_mend)', 'lowest'},
    --Power Word: Radiance if lowest and 2 or more around within 40yds without atonement buff.
	{'Power Word: Radiance', '{spell(plea).count < 3 & player.mana >= 70 & !lastcast(Power Word: Radiance)} || {spell(plea).count < 3 & lowest.area(40,95).heal >= 3 & advanced & !lowest.buff(Atonement) & !lastcast(Power Word: Radiance)} || {spell(plea).count < 3 & player.area(40,95).heal >= 3 & !advanced & !lowest.buff(Atonement) & !lastcast(Power Word: Radiance)}', 'lowest'},
    --Power Word: Shield on CD if not Atonement on 6 people max.
    {'Power Word: Shield', '!lowest1.buff(Atonement) & spell(Plea).count >= 5', 'lowest1'},
    {'Power Word: Shield', '!lowest2.buff(Atonement) & spell(Plea).count >= 5', 'lowest2'},
    {'Power Word: Shield', '!lowest3.buff(Atonement) & spell(Plea).count >= 5', 'lowest3'},
    {'Power Word: Shield', '!lowest4.buff(Atonement) & spell(Plea).count >= 5', 'lowest4'},
    {'Power Word: Shield', '!lowest5.buff(Atonement) & spell(Plea).count >= 5', 'lowest5'},
    --Plea to aplly Atonement if lowest is above mend value and below plea value in UI and lowest missing atonement.
    {'Plea', 'lowest1.health > UI(l_mend) & lowest1.health <= UI(l_plea) & !lowest1.buff(Atonement) & spell(Plea).count <= 5', 'lowest1'},
    {'Plea', 'lowest2.health > UI(l_mend) & lowest2.health <= UI(l_plea) & !lowest2.buff(Atonement) & spell(Plea).count <= 5', 'lowest2'},
    {'Plea', 'lowest3.health > UI(l_mend) & lowest3.health <= UI(l_plea) & !lowest3.buff(Atonement) & spell(Plea).count <= 5', 'lowest3'},
    {'Plea', 'lowest4.health > UI(l_mend) & lowest4.health <= UI(l_plea) & !lowest4.buff(Atonement) & spell(Plea).count <= 5', 'lowest4'},
    {'Plea', 'lowest5.health > UI(l_mend) & lowest5.health <= UI(l_plea) & !lowest5.buff(Atonement) & spell(Plea).count <= 5', 'lowest5'},

}

local Moving = {
	--Angelic Feather if player is moving for 2 seconds or longer and Missing Angelic Feather and if UI enables it.
	{'Angelic Feather', 'player.movingfor >= 2 & !player.buff(Angelic Feather) & spell(Angelic Feather).charges >= 1 & UI(m_AF)', 'player.ground'},
	-- Body and Soul usage if enabled in UI.
	{'!Power Word: Shield', 'talent(Body and Soul) & !player.buff(Body and Soul) & player.movingfor >= 1 & UI(m_Body) & !player.channeling(Penance)', 'player'},

}

                                          

local inCombat = { 
    
    {Potions},
    {Emergency},
    {'%dispelall', '{toggle(disp) & spell(Purify).cooldown = 0 & tank.health > UI(t_mend)} || {player.health > UI(l_mend) & !tank.exists & toggle(disp) & spell(Purify).cooldown = 0}'},
	--Fade when you get aggro.
	{'fade', 'aggro & !toggle(xDPS)'},
	{Keybinds},
	{Trinkets},
	{Rapture, 'player.buff(Rapture) & lowest.range <= 40'},
	{Moving, 'moving'},
	--Halo if player has talent and at least 4 or more people within a 30yd range are below or equal to 85% health.
	{'Halo','talent(Halo) & player.area(30, 90).heal >= 4 & toggle(AOE) & !toggle(xDPS)'},
	--Divine Star if player has talent and at least 1 enemy is in front with a range of 24yds and at least 3 or higher players with health below or equal to 95% are in front with a range of 24yds.
    {'Divine Star', 'talent(Divine Star) & player.area(24, 95).heal.infront >= 3 & toggle(AOE) & !toggle(xDPS)'},
    {Tank, 'tank.range <= 40 & !toggle(xDPS)'},
    {Spread, 'UI(tog_plea) & !lowest.health <= UI(l_mend) & lowest.range <= 40'},
    {Lowest, '{!toggle(xDPS) & !player.buff(Rapture) & lowest.range <= 40} ||{lowest1.buff(Power Word: Shield) & lowest2.buff(Power Word: Shield) & lowest3.buff(Power Word: Shield) & lowest4.buff(Power Word: Shield) & lowest5.buff(Power Word: Shield) & lowest.range <= 40}'},
    {Atonement, '!toggle(xDPS)'},
    {Solo, 'toggle(xDPS)'},

}

local outCombat = {
   {Keybinds},
   {Moving, 'moving & !toggle(ato)'},
{{   
   {'Plea', 'lowest.health < 100 & moving', 'lowest'},
   {'Shadow Mend', 'lowest.health < 100 & !moving', 'lowest'},
}, 'toggle(ooc_heal)'},
{{
    {'Power Word: Shield', '!tank.buff(atonement) || !tank.buff(Power Word: Shield)', 'tank'},
    {Moving, 'moving'},
    {'Plea', 'lowest1.health > UI(l_mend) & !lowest1.buff(Atonement) & spell(Plea).count <= 4', 'lowest1'},
    {'Plea', 'lowest2.health > UI(l_mend) & !lowest2.buff(Atonement) & spell(Plea).count <= 4', 'lowest2'},
    {'Plea', 'lowest3.health > UI(l_mend) & !lowest3.buff(Atonement) & spell(Plea).count <= 4', 'lowest3'},
    {'Plea', 'lowest4.health > UI(l_mend) & !lowest4.buff(Atonement) & spell(Plea).count <= 4', 'lowest4'},
    {'Plea', 'lowest5.health > UI(l_mend) & !lowest5.buff(Atonement) & spell(Plea).count <= 4', 'lowest5'},
}, 'toggle(ato)'}, 
	{'%ressdead(Resurrection)', 'UI(rezz)'},
}


NeP.CR:Add(256, {
    name = '|cff58FAF4 [Yobleed]|r Priest - |cff58FAF4Discipline|r',
      ic = inCombat,
     ooc = outCombat,
     gui = GUI,
    load = exeOnLoad
})
