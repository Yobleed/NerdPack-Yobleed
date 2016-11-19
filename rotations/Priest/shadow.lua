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
		
}

local exeOnLoad = function()
	
     ---------CREDITS GO TO XEER-----------
	print('|cff5F2061 ----------------------------------------------------------------------|r')
	print('|cff5F2061 --- |rPRIEST |cff5F2061Shadow |r')
	print('|cff5F2061 --- |rRecommended Talents1: 1/1 - 2/2 - 3/1 - 4/2 - 5/3 - 6/3 - 7/3')
	print('|cff5F2061 --- |rRecommended Talents2: 1/1 - 2/2 - 3/1 - 4/2 - 5/2 - 6/1 - 7/3')
	print('|cff5F2061 ----------------------------------------------------------------------|r')

	

end

local Voidform = {
 -- Body and Soul
 {"17", {"player.moving & !player.buff(193223) & !player.channeling(Void Torrent) & player.movingfor >= 1 & talent(Body and Soul)" }},
    
   {'!Power Infusion', 'talent(Power Infusion) & player.buff(voidform).count >= 70 & !player.channeling(Void Torrent) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 40'}, -- Meh can't make it :(
   {'!Power Infusion', 'talent(Power Infusion) & player.buff(voidform).count >= 75 & !player.channeling(Void Torrent)'}, -- PI last resort
   {"Mindbender", {"talent(Mindbender) & !player.channeling(Void Torrent)"}}, -- CD
   {'!Dispersion', 'player.buff(voidform).count >= 99 & !player.channeling(Void Torrent)'},
   {'!Dispersion', 'player.buff(voidform).count >= 90 & !player.channeling(Void Torrent) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 30'},
  

   {"!Void Torrent", {"player.buff(Voidform) & !talent(Power Infusion) & !player.channeling(Void Torrent) & player.spell(Mindbender).cooldown <= 45 & talent(Mindbender) & player.buff(193223)"}}, -- Void Torrent on CD When Bender isn't active
   {"!Void Torrent", {"player.buff(Voidform) & talent(Power Infusion) & !player.channeling(Void Torrent) &  !player.buff(Power Infusion) & player.buff(193223)"}}, -- Void Torrent on CD StM

   {"!Void Torrent", {"player.buff(194249) & !player.channeling(Void Torrent) & !talent(Power Infusion) & !player.buff(193223) & !player.channeling(Void Torrent)"}},
   {"!Void Torrent", {"player.buff(Voidform) & !player.channeling(Void Torrent) & !player.buff(Power Infusion) & talent(Power Infusion) & !player.buff(193223)"}}, -- Void Torrent on CD

   {"!Shadow Word: Death", {"player.buff(Surrender to Madness) & target.health <= 35 & !player.channeling(Void Torrent) & player.buff(Voidform) & player.buff(voidform).count < 20 & player.spell(Shadow Word: Death).cooldown = 0"}},  -- SW:D Dump below 35
   {"!Shadow Word: Death", {"player.buff(Surrender to Madness) & target.health <= 35 & !player.channeling(Void Torrent) & player.insanity <= 40 & player.buff(Voidform) & player.spell(Shadow Word: Death).cooldown = 0 & !lastcast(Shadow Word: Death)"}},  -- Keeping up Surrender to madness

   {"!Mind Blast", {"player.buff(Voidform) & !player.channeling(Void Torrent) & player.spell(Void Eruption).cooldown > 0.5 & !player.channeling(Mind Sear)"}}, --Voidbolt before Mindblast
   {"Shadow Word: Pain", {"!target.debuff(Shadow Word: Pain) & player.buff(Voidform) & !player.channeling(Void Torrent) & !player.channeling(Mind Sear)"}}, -- SW:P check
   {"Vampiric Touch", {"!target.debuff(Vampiric Touch) & player.buff(Voidform) & !player.channeling(Void Torrent) & !player.channeling(Mind Sear)"}}, -- VT check

   {"Mind Sear", {"toggle(AOE) & player.buff(Voidform) & !player.channeling(Mind Sear) & !player.channeling(Void Torrent)"}}, -- Replace Mind Flay Filler
   {"Mind Flay", {"player.spell(228260).cooldown > 0 & player.spell(8092).cooldown > 0 & !player.channeling(Mind Flay) & !player.channeling(Void Torrent) & !toggle(AOE) & !player.channeling(Mind Blast) & !player.channeling(Mind Sear)"}},

   {"!Void Eruption", "!player.channeling(Void Torrent) & !player.channeling(Mind blast)"},

}

local ST = {
   
   {"Shadowform", "!player.buff(Voidform) & !player.buff(Shadowform)"},

-- Body and Soul
   {"17", "player.moving & !player.buff(193223) & !player.channeling(Void Torrent) & player.movingfor >= 1 & talent(Body and Soul)" },

   {"!Shadow Word: Death", "target.health <= 35 & !player.channeling(Void Torrent) & player.spell(Shadow Word: Death).cooldown = 0 & player.insanity <= 65"},
   {"!Shadow Word: Death", "target.health <= 35 & !player.channeling(Void Torrent) & player.spell(Shadow Word: Death).cooldown = 0 & player.moving"},

   {"!Void Eruption", "target.debuff(Vampiric Touch).duration > 7 & target.debuff(Shadow Word: Pain).duration > 7"},
   {"Shadow Word: Pain", "!player.buff(Voidform) & player.insanity >= 70 & target.debuff(Shadow Word: Pain).duration <= 7 & talent(Legacy of the Void)"}, -- SW:P refresh going into voidform
   {"Vampiric Touch", "!player.buff(Voidform) & player.insanity >= 70 & target.debuff(Vampiric Touch).duration <= 7 & talent(Legacy of the Void)" }, -- VT refresh going voidform

   {"Shadow Word: Pain", "!player.buff(Voidform) & player.insanity = 100 & target.debuff(Shadow Word: Pain).duration <= 7 & talent(Surrender to Madness)"}, -- SW:P refresh going into Stm
   {"Vampiric Touch", "!player.buff(Voidform) & player.insanity = 100 & target.debuff(Vampiric Touch).duration <= 7 & talent(Surrender to Madness)"}, -- VT refresh going into Stm

   {"!Mind Blast", "!player.buff(Voidform) & !player.channeling(Void Eruption)"},
   {"Shadow Word: Pain", "!player.buff(Voidform) & target.debuff(Shadow Word: Pain).duration < 3" }, -- SW:P refresh
   {"Vampiric Touch", "!player.buff(Voidform) & target.debuff(Vampiric Touch).duration < 3" }, -- VT refresh
   {"Mind Sear", "toggle(AOE) & !player.buff(Voidform) & !player.channeling(Mind Sear)"}, -- Replace Mind Flay Filler
   {"Mind Flay", "player.spell(8092).cooldown > 0 & !player.buff(Voidform) & !toggle(AOE) & !player.channeling(Mind Flay)"}, --Mindlay filler no voidform
  
}

local inCombat = {
   -- Shadowy insight
  {"!Mindblast", {"player.buff(Shadowy Insight) & !player.channeling(Void Torrent) & !spell(Void Eruption).cooldown = 0"}}, 
  {'!Dispersion', 'player.spell(Shadow Word: Death).charges < 1 & player.buff(voidform).count >= 95 & player.insanity <= 50'},
  {"!Dispersion", "player.health <= 20 & !player.buff(193223)"},
  {"Mind Sear", "keybind(shift) & !player.channeling(Void Torrent) & !player.channeling(Mind Sear)"},
  {Voidform, 'player.buff(Voidform)', '!player.channeling(Void Torrent)'},
  {ST, '!player.buff(Voidform)'},

  --Surrender to madness
   {"193223", "player.debuff(206005)"}, -- Dream State Xavius




  -- Interrupts
   {"15487", "toggle(Interrupts) & player.spell(15487).cooldown = 0 & !player.channeling(Void Torrent)"},

    -- Potions
   {"#5512", "player.health <= 20 & !player.channeling(Void Torrent)"},
   {"#127834", "player.health <= 20 & !player.channeling(Void Torrent)"}, -- Ancient Healing Potion
   {"#109218", "player.hashero & !player.buff(156426) & !player.channeling(Void Torrent)"}, --DPS potion Doesn't support Potion of Deadly grace
   --{"#109218", "target.boss & !player.buff(156426) & target.health <= 20 & !player.channeling(Void Torrent)"}, --Boss Potion

   -- Survival / Movement
   {'Fade', 'target.threat = 100', '!player.channeling(Void Torrent)',  'player' },
   {"59544", "player.health <= 40 & !player.channeling(Void Torrent)"}, -- Gift of the Naaru
   {"17", "player.health <= 30 & !player.buff(193223) & !player.channeling(Void Torrent)"}, --Power Word: Shield
   {"17", "player.moving & !player.buff(193223) & !player.channeling(Void Torrent) & player.movingfor >= 1" }, --Moving no Voidform


   -- Cooldowns
   {"!Shadow Word: Death", {"target.health <= 35 & & player.insanity <= 65 & !player.buff(Surrender to Madness)"}}, 
   {'!Dispersion', 'toggle(cooldowns) & !player.channeling(Void Torrent) & player.buff(voidform).count >= 35 & spell(Shadow Word: Death).charges < 1 & !player.buff(Surrender to Madness) & player.insanity <= 30'},
   {'!Dispersion', 'toggle(cooldowns) & !player.channeling(Void Torrent) & player.buff(voidform).count >= 39 & spell(Shadow Word: Death).charges < 1 & !player.buff(Surrender to Madness)'},
   {"!Power Infusion", "talent(Power Infusion) & toggle(cooldowns) & player.buff(Voidform) & !player.buff(Dispersion) & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent) & player.buff(voidform).count >= 15 & target.health > 35" },
   {"!Power Infusion", "talent(Power Infusion) & toggle(cooldowns) & player.buff(Voidform) & !player.buff(Dispersion) & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent) & player.buff(voidform).count >= 20 & target.health <= 35" },
   {"!Shadowfiend",  "toggle(cooldowns) & player.buff(Voidform) & !player.channeling(Void Torrent) & player.spell(Void Eruption).cooldown > 0 & player.buff(voidform).count > 10"},
   {"!Mindbender", "talent(Mindbender) & player.buff(Voidform) & toggle(cooldowns) & !player.buff(193223) & player.buff(voidform).count > 5 & !player.channeling(Void Torrent)"},
   {"!Void Eruption", "!player.channeling(Void Torrent)"},

   -- Keybinds
     -- {"!32375 & keybind(lalt) & tank.advancedground"}, -- Mass Dispel (Enable if on Dispel Duty)
    -- AOE Shift button




}

local outCombat = {
 {"Shadowform", "!player.buff(Shadowform)"},
 {"17", "player.movingfor >= 1 & !player.buff(180545) & talent(Body and Soul)", "player"}, -- Body and Soul
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
