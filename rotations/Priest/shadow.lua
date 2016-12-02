local GUI = { 

            
        --[[ Header Texture ]]
		{ 
			type = "texture",
			texture = "Interface\\AddOns\\Nerdpack-Yobleed\\media\\shadow.blp",
			width = 512, 
			height = 256, 
			offset = 90, 
			y = 42, 
			center = true 
		},

  --Survival/Potions
  {type = 'header', text = 'Survival/Potions', align = 'center'},
  {type = 'checkbox', text = 'Fade', key = 's_F', default= false},
  {type = 'checkspin', text = 'Dispersion Usage', key = 's_D', default_check = false, default_spin = 20},
  {type = 'checkspin', text = 'Healthstone', key = 's_HS', default_check = false, default_spin = 20},
  {type = 'checkspin', text = 'Ancient Healing Potion', key = 's_AHP', default_check = false, default_spin = 20},
  {type = 'checkbox', text = 'Hero Potion of Prolonged Power', key = 's_PP', default= false},
  {type = 'ruler'},{type = 'spacer'},

  --DPS Cooldown
  {type = 'header', text = 'DPS cooldown', align = 'center'},
  {type = 'text', text = 'No Surrender to Madness Active', align = 'center'},
  {type = 'text', text = 'Check and Choose Stacks', align = 'center'},
  {type = 'checkspin', text = 'Dispersion: Target <= 35%', key = 'dps_D', default_check = false, default_spin = 35},
  {type = 'checkspin', text = 'Dispersion: Target > 35%', key = 'dps_D2', default_check = false, default_spin = 30},
  {type = 'ruler'},{type = 'spacer'},

  --AOE
  {type = 'header', text = 'AoE', align = 'center'},
  {type = 'text', text = 'When AoE is toggled on', align = 'center'},
  {type ='spinner', text = 'Mind Sear', key = 'AoE_MS', default = 3},
  {type = 'ruler'},{type = 'spacer'},

  --TRINKETS
  {type = 'header', text = 'Trinkets', align = 'center'},
  {type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', default = false},
  {type = 'checkbox', text = 'Bottom Trinket', key = 'Trinket_2', default = false},
  {type = 'ruler'},{type = 'spacer'},

  --KEYBINDS
  {type = 'header', text = 'Keybinds', align = 'center'},
  {type = 'text', text = 'Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
  {type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', default = false},
  {type = 'checkbox', text = 'Pause', key = 'k_P', default = false},
  {type = 'ruler'},{type = 'spacer'},

  --MOVING
  {type = 'header', text = 'Movement', align = 'center'},
  {type = 'checkbox', text = 'Body and Soul', key = 'm_Body', default = false},
  {type = 'ruler'},{type = 'spacer'},

  --SUPPORT
  {type = 'header', text = 'Support', align = 'center'},
  {type = 'text', text = 'Protect your Allies like a good guildie ;)', align = 'center'},
  {type = 'checkspin', text = 'Gift of the Naaru', key = 'sup_GotN', default_check = false, default_spin = 20},
  {type = 'checkspin', text = 'Power Word: Shield', key = 'sup_PWS', default_check = false, default_spin = 20},




  
		
}

local exeOnLoad = function()
	
     ---------CREDITS GO TO XEER-----------
	print('|cff5F2061 ----------------------------------------------------------------------|r')
	print('|cff5F2061 --- |rPRIEST |cff5F2061Shadow |r')
	print('|cff5F2061 --- |rRecommended Talents1: 1/1 - 2/2 - 3/1 - 4/2 - 5/3 - 6/3 - 7/3')
	print('|cff5F2061 --- |rRecommended Talents2: 1/1 - 2/2 - 3/1 - 4/2 - 5/2 - 6/1 - 7/3')
	print('|cff5F2061 ----------------------------------------------------------------------|r')
  print('|cff5F2061 For Settings Right-Click the MasterToggle and go to Combat Routines Settings |r')
  print('|cff5F2061 Have a nice day!|r')

	

end

local Trinkets = {
  --Top Trinket usage if UI enables it.
  {'#trinket1', 'UI(trinket_1)'},
  --Bottom Trinket usage if UI enables it.
  {'#trinket2', 'UI(trinket_2)'}
}

local Keybinds = {
  --Mass Dispel on Mouseover target Left Control when checked in UI.
  {'Mass Dispel', 'keybind(lcontrol) & UI(k_MD)', 'cursor.ground'},
  -- Pause on left alt when checked in UI.
  {'%pause', 'keybind(lalt)& UI(k_P)'}
}

local Voidform = {
   {"17", "player.moving & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent) & player.movingfor >= 1 & UI(m_Body) & talent(Body and Soul) & !player.spell(Void Eruption).cooldown = 0" },
   
   {'!Power Infusion', 'talent(Power Infusion) & player.buff(voidform).count >= 70 & !player.channeling(Void Torrent) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 40'}, -- Meh can't make it :(
   {'!Power Infusion', 'talent(Power Infusion) & player.buff(voidform).count >= 75 & !player.channeling(Void Torrent)'}, -- PI last resort
   {"!Power Infusion", "talent(Power Infusion) & player.buff(Voidform) & toggle(cooldowns) & !player.buff(Dispersion) & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent) & player.buff(voidform).count >= 10 & target.health > 35" },
   {"!Power Infusion", "talent(Power Infusion) & player.buff(Voidform) & toggle(cooldowns) & !player.buff(Dispersion) & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent) & player.buff(voidform).count >= 20 & target.health <= 35" }, 
   
   {"Mindbender", {"talent(Mindbender) & !player.channeling(Void Torrent)"}}, -- CD
   {"!Shadowfiend",  "toggle(cooldowns) & player.buff(Voidform) & !player.channeling(Void Torrent) & player.spell(Void Eruption).cooldown > 0 & !spell(Mind Blast).cooldown = 0 & player.buff(voidform).count > 10 & !talent(Power Infusion)"},
   {"!Shadowfiend",  "toggle(cooldowns) & player.buff(Voidform) & !player.channeling(Void Torrent) & player.spell(Void Eruption).cooldown > 0 & !spell(Mind Blast).cooldown = 0 & player.buff(voidform).count >= 15 & talent(Power Infusion)"},
   {"!Mindbender", "talent(Mindbender) & player.buff(Voidform) & toggle(cooldowns) & !player.buff(193223) & player.buff(voidform).count > 5 & !player.channeling(Void Torrent)"},
   
   {'!Dispersion', 'lastcast(Void Torrent) & player.buff(Surrender to Madness) & !player.channeling(Void Torrent)'},
   {'!Dispersion', 'player.buff(voidform).count >= 99 & !player.channeling(Void Torrent) & target.health > 35'},
   {'!Dispersion', 'player.buff(voidform).count >= 99 & !player.channeling(Void Torrent) & target.health <= 35 & spell(Shadow Word: Death).charges < 1 & player.insanity <= 50'},
   {'!Dispersion', 'player.buff(voidform).count >= 90 & !player.channeling(Void Torrent) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 30'},
   {'!Dispersion', '!player.channeling(Void Torrent) & player.buff(voidform).count >= UI(dps_D_spin) & UI(dps_D_check) & spell(Shadow Word: Death).charges < 1 & !player.buff(Surrender to Madness) & player.insanity <= 30 & target.health <= 35'},
   {'!Dispersion', '!player.channeling(Void Torrent) & player.buff(voidform).count >= UI(dps_D2_spin) & UI(dps_D2_check) & !player.buff(Surrender to Madness) & player.insanity <= 30 & target.health > 35'},

   {"!Void Torrent", {"player.buff(Voidform) & !talent(Power Infusion) & !player.channeling(Void Torrent) & player.spell(Mindbender).cooldown <= 45 & talent(Mindbender) & player.buff(193223)"}}, -- Void Torrent on CD When Bender isn't active
   {"!Void Torrent", {"player.buff(Voidform) & talent(Power Infusion) & !player.channeling(Void Torrent) &  !player.buff(Power Infusion) & player.buff(193223)"}}, -- Void Torrent on CD StM

   {"!Void Torrent", {"player.buff(194249) & !player.channeling(Void Torrent) & !talent(Power Infusion) & !player.buff(193223) & !player.channeling(Void Torrent)"}},
   {"!Void Torrent", {"player.buff(Voidform) & !player.channeling(Void Torrent) & talent(Power Infusion) & !player.buff(193223)"}},

   {"!Shadow Word: Death", {"player.buff(Surrender to Madness) & target.health <= 35 & !player.channeling(Void Torrent) & player.buff(Voidform) & player.buff(voidform).count < 20  & player.spell(Shadow Word: Death).cooldown = 0 & target.debuff(Shadow Word: Pain).duration > 6 & target.debuff(Vampiric Touch).duration > 6"}},  -- SW:D Dump below 20 if dots are up
   {"!Shadow Word: Death", {"player.buff(Surrender to Madness) & target.health <= 35 & !player.channeling(Void Torrent) & player.insanity <= 40 & player.buff(Voidform) & player.spell(Shadow Word: Death).cooldown = 0 & !lastcast(Shadow Word: Death)"}},  -- Keeping up Surrender to madness
   {"!Shadow Word: Death", {"target.health <= 35 & & player.insanity <= 65 & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent)"}}, 
   
   {"!Mind Blast", {"player.buff(Voidform) & !player.channeling(Void Torrent) & player.spell(Void Eruption).cooldown > 0.5 & !player.channeling(Mind Sear) & !spell(Void Torrent).cooldown = 0, !lastcast(Void Torrent)"}}, --Voidbolt before Mindblast
   {"Shadow Word: Pain", {"!target.debuff(Shadow Word: Pain) & player.buff(Voidform) & !player.channeling(Void Torrent) & !player.channeling(Mind Sear)"}}, -- SW:P check
   {"Vampiric Touch", {"!target.debuff(Vampiric Touch) & player.buff(Voidform) & !player.channeling(Void Torrent) & !player.channeling(Mind Sear)"}}, -- VT check

  {"Mind Sear", "toggle(AOE) & player.buff(Voidform) & !player.channeling(Void Torrent) & target.area(10).enemies >= UI(AoE_MS) & target.debuff(Shadow Word: Pain)"}, 
  {"Mind Flay", {"player.spell(Void Eruption).cooldown > 0 & player.spell(Mind Blast).cooldown > 0 & !target.area(10).enemies >= UI(AoE_MS) &  target.debuff(Shadow Word: Pain) & toggle(AOE)"}},
  {"Mind Flay", "player.spell(Void Eruption).cooldown > 0 & player.spell(Mind Blast).cooldown > 0 & target.debuff(Shadow Word: Pain) & !toggle(AOE)"},

   {"!Void Eruption", "!player.channeling(Void Torrent) & !player.channeling(Mind blast) & player.buff(Voidform)"},

}

local ST = {
    {"17", "player.moving & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent) & player.movingfor >= 1 & UI(m_Body) & talent(Body and Soul)" }, --Moving no Voidform
    {"Shadowform", "!player.buff(Voidform) & !player.buff(Shadowform)"},

    {"!Shadow Word: Death", "target.health <= 35 & !player.channeling(Void Torrent) & player.spell(Shadow Word: Death).cooldown = 0 & player.insanity <= 65"},
    {"!Shadow Word: Death", "target.health <= 35 & !player.channeling(Void Torrent) & player.spell(Shadow Word: Death).cooldown = 0 & player.moving"},


   {"!Void Eruption", "target.debuff(Vampiric Touch).duration > 13 & target.debuff(Shadow Word: Pain).duration > 13 & player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)"},
   {"!Void Eruption", "target.debuff(Vampiric Touch).duration > 6 & target.debuff(Shadow Word: Pain).duration > 6 & !player.buff(Surrender to Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)"},

   {"Shadow Word: Pain", "!player.buff(Voidform) & player.insanity >= 70 & target.debuff(Shadow Word: Pain).duration <= 6 & !player.buff(Surrender to Madness) & lastcast(Vampiric Touch) & !player.channeling(Vampiric Touch)"}, -- SW:P refresh going into voidform
   {"!Vampiric Touch", "!player.buff(Voidform) & player.insanity >= 70 & target.debuff(Vampiric Touch).duration <= 6 & !player.buff(Surrender to Madness) & !lastcast(Vampiric Touch)" }, -- VT refresh going voidform

   {"Shadow Word: Pain", "!player.buff(Voidform) & player.insanity = 100 & target.debuff(Shadow Word: Pain).duration <= 13 & player.buff(Surrender to Madness) & lastcast(Vampiric Touch) & !player.channeling(Vampiric Touch)"}, -- SW:P refresh going into Stm
   {"!Vampiric Touch", "!player.buff(Voidform) & player.insanity = 100 & target.debuff(Vampiric Touch).duration <= 13 & player.buff(Surrender to Madness) & !lastcast(Vampiric Touch)"}, -- VT refresh going into Stm
   
   --Legendary Belt
   {"Mind Blast", "!player.buff(Voidform) & !player.channeling(Void Eruption) & equipped(Mangaza's Madness) & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch) & !player.insanity >= 70 & talent(legacy of the void)"},
   {"Mind Blast", "!player.buff(Voidform) & !player.channeling(Void Eruption) & equipped(Mangaza's Madness) & target.debuff(Shadow Word: Pain) & target.debuff(Vampiric Touch) & !player.insanity = 100 & talent(surrender to madness)"},
   {"!Mind Blast", "!player.buff(Voidform) & !player.channeling(Void Eruption) & equipped(Mangaza's Madness) & !target.debuff(Shadow Word: Pain) & !target.debuff(Vampiric Touch) & player.spell(Mind Blast).charges = 3"},
   
   --No Legendary
   {"!Mind Blast", "!player.buff(Voidform) & !player.channeling(Void Eruption) & player.channeling(Mind Flay) & !prev_off_gcd(Mind Blast) & !equipped(Mangaza's Madness)"},
   {"Mind Blast", "!player.buff(Voidform) & !player.channeling(Void Eruption) & !prev_off_gcd(Mind Blast) & !equipped(Mangaza's Madness)"},

   {"!Shadow Word: Pain", "!player.buff(Voidform) & target.debuff(Shadow Word: Pain).duration < 3 || !target.debuff(Shadow Word: Pain)" }, -- SW:P refresh
   {"!Vampiric Touch", "!player.buff(Voidform) & target.debuff(Vampiric Touch).duration < 3 || !target.debuff(Vampiric Touch) & !lastcast(Vampiric Touch) " }, -- VT refresh
   {"Mind Sear", "toggle(AOE) & target.area(10).enemies >= UI(AoE_MS) & target.debuff(Shadow Word: Pain)"}, 
   {"Mind Flay", "player.spell(Mind Blast).cooldown > 0 & !target.area(10).enemies >= UI(AoE_MS) & target.debuff(Shadow Word: Pain) & toggle(AOE)" },
   {"Mind Flay", "player.spell(Mind Blast).cooldown > 0 & target.debuff(Shadow Word: Pain) & !toggle(AOE)"},
}

local inCombat = {
-- Dreamstate
 {"Surrender to Madness", "player.debuff(Dream Simulacrum)"},

 -- Potions
 {"#Healthstone", "player.health <= UI(s_HS_spin) & UI(s_HS_check) & !player.channeling(Void Torrent)"}, --Healthstone
 {"#Ancient Healing Potion", "player.health <= UI(s_AHP_spin) & UI(s_AHP_check) & !player.channeling(Void Torrent)"}, -- Ancient Healing Potion
 {"#142117", "player.hashero & !player.buff(156426) & !player.channeling(Void Torrent) & UI(s_PP)"}, --DPS potion Doesn't support Potion of Deadly grace

 -- Interrupts
 {"15487", "toggle(Interrupts) & player.spell(15487).cooldown = 0 & !player.channeling(Void Torrent)"},
 
 -- Survival / Movement
 {'Fade', 'target.threat = 100 & !player.channeling(Void Torrent) & UI(s_F)'},
 {"Gift of the Naaru", "player.health <= 40 & !player.channeling(Void Torrent) & !player.buff(Surrender to Madness) "}, -- Gift of the Naaru
 {"!Gift of the Naaru", "lowest.health <= UI(sup_GotN_spin) & UI(sup_GotN_check) & !player.channeling(Void Torrent) & !player.buff(Surrender to Madness)", "lowest"}, -- support Gift of the Naaru
 {"17", "player.health <= 30 & !player.buff(193223) & !player.channeling(Void Torrent)"}, --Power Word: Shield
 {"!17", "lowest.health <= UI(sup_PWS_spin) & UI(sup_PWS_check) & !player.buff(193223) & !player.channeling(Void Torrent)", "lowest"}, -- support Power Word: Shield
 -- Shadowy insight
 {"!Mindblast", {"player.buff(Shadowy Insight) & !player.channeling(Void Torrent) & !spell(Void Eruption).cooldown = 0"}}, 
 {'!Dispersion', 'player.spell(Shadow Word: Death).charges < 1 & player.buff(voidform).count >= 95 & player.insanity <= 50'},
 {'!Dispersion', 'player.health <= UI(s_D_spin) & UI(s_D_check) & !player.buff(surrender to madness)'},
 {Keybinds},
 {Trinkets, '!player.channeling(Void Torrent)'},
 {Voidform, 'player.buff(Voidform) & !player.channeling(Void Torrent)'},
 {ST, '!player.buff(Voidform) & !player.channeling(Void Eruption)'},

   -- Keybinds
     -- {'!32375', 'keybind(lalt) & advanced','tank.advancedground'}, -- Mass Dispel (Enable if on Dispel Duty)
}

local outCombat = {
 {Keybinds},
 {"Shadowform", "!player.buff(Shadowform)"},
 {"17", "player.movingfor >= 1 & !player.buff(180545) & talent(Body and Soul) & UI(m_Body) & !player.buff(Surrender to Madness)", "player"}, -- Body and Soul
 {"%ressdead(Resurrection)"},

}

NeP.CR:Add(258, {
    name = '|cff5F2061 [Yobleed]|r Priest - |cff5F2061Shadow|r', 
      ic = inCombat,
     ooc = outCombat,
     gui = GUI,
    load = exeOnLoad
})
--NeP.CR:Add(258, '[Yobleed] Priest - |r[|c5F2061Shadow|r]', inCombat, outCombat, exeOnLoad, GUI)

--NOTES:
 --equipped('item_name') or equipped (itemID)
 --'advanced' --advanced unlocker condition
