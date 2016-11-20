local GUI = {

}

local exeOnLoad = function()
end


local Voidform = {
 --Void Bolt CD (ID fix)


 -- Body and Soul
 {"17", {"player.moving & !player.buff(193223) & !player.channeling(Void Torrent) & player.movingfor >= 1 & talent(Body and Soul)" }},

 --Trinket

     --Remove Mastery
     {"#trinket1", { "toggle(cooldowns) & player.buff(227396) & player.buff(Voidform) & !player.channeling(Void Torrent)" }}, --Eyasu's Mulligan's crit or haste
     {"#trinket2", { "toggle(cooldowns) & player.buff(227396) & player.buff(Voidform) & !player.channeling(Void Torrent)" }}, --Eyasu's Mulligan's crit or haste


     --Remove Versatility
     {"#trinket1", { "toggle(cooldowns) & player.buff(227397) & player.buff(Voidform) & !player.channeling(Void Torrent)" }}, --Eyasu's Mulligan's crit or haste
     {"#trinket2", { "toggle(cooldowns) & player.buff(227397) & player.buff(Voidform) & !player.channeling(Void Torrent)" }}, --Eyasu's Mulligan's crit or haste

     --Remove Crit
     {"#trinket1", { "toggle(cooldowns) & player.buff(227389) & player.buff(Voidform) & !player.channeling(Void Torrent)" }}, --Eyasu's Mulligan's crit or haste
     {"#trinket2", { "toggle(cooldowns) & player.buff(227389) & player.buff(Voidform) & !player.channeling(Void Torrent)" }}, --Eyasu's Mulligan's crit or haste


     {"#trinket1", { "toggle(cooldowns) & player.buff(voidform).count >= 55 & player.insanity >= 70 & player.buff(Voidform) & !player.channeling(Void Torrent)" }},
     {"#trinket2", { "toggle(cooldowns) & player.buff(voidform).count >= 55 & player.insanity >= 70 & player.buff(Voidform) & !player.channeling(Void Torrent)" }},


     {"#trinket1", { "toggle(cooldowns)","player.buff(Voidform) & !player.channeling(Void Torrent) & !player.buff(193223) & player.buff(voidform).count >= 10" }},
     {"#trinket2", { "toggle(cooldowns)","player.buff(Voidform) & !player.channeling(Void Torrent) & !player.buff(193223) & player.buff(voidform).count >= 10" }},



 -- Shadowy insight
   {"!Mindblast", {"player.buff(Shadowy Insight) & !player.channeling(Void Torrent) & !player.channeling(Mindblast)"}}, --Used ASAP so no procs are wasted

-- Surrender To Madness Rotation --
  --Boss health check -- Activate Surrender to Madness (VOIDFORM)
   {"Power Infusion", {"talent(Power Infusion) & player.buff(Voidform) & player.buff(voidform).count >= 80 & player.buff(193223) & player.spell(Void Torrent).cooldown <= 20 & !player.channeling(Void Torrent)" }},
   {"Power Infusion", {"talent(Power Infusion) & player.buff(Voidform) & player.buff(voidform).count >= 80 & player.spell(Void Torrent).cooldown > 0 & !player.buff(47585) & player.buff(193223) & !player.channeling(205065)" }}, -- PI last resort
   {"Mindbender", {"talent(Mindbender) & !player.channeling(Void Torrent)"}}, -- CD
   {"!47585", {"player.buff(voidform).count > 99 & !player.channeling(Void Torrent) & player.spell(Shadow Word: Death).charges = 0 & target.health <= 35 & player.spell(47585).cooldown = 0"}},
   {"!47585", {"player.buff(voidform).count > 99 & !player.channeling(Void Torrent) & player.spell(47585).cooldown = 0 & target.health > 35"}},


   {"Void Torrent", {"player.buff(Voidform) & !talent(Power Infusion) & player.spell(Mindbender).cooldown <= 45 & talent(Mindbender) & player.buff(193223)"}}, -- Void Torrent on CD When Bender isn't active
   {"Void Torrent", {"player.buff(Voidform) & talent(Power Infusion) & !player.buff(Power Infusion) & player.buff(193223)"}}, -- Void Torrent on CD StM

   {"Void Torrent", {"player.buff(194249) & !talent(Power Infusion) & !player.buff(193223) & !player.channeling(Void Torrent)"}},
   {"Void Torrent", {"player.buff(Voidform) & talent(Power Infusion) & !player.buff(193223)"}}, -- Void Torrent on CD

   {"!Shadow Word: Death", {"target.health <= 35 & !player.channeling(Void Torrent) & player.buff(Voidform) & player.buff(voidform).count < 20 & player.spell(Shadow Word: Death).cooldown = 0"}},  -- SW:D Dump below 35
   {"!Shadow Word: Death", {"target.health <= 35 & !player.channeling(Void Torrent) & player.spell(32379).charges = 2 & player.buff(Voidform) & player.insanity <= 60 & player.spell(Shadow Word: Death).cooldown = 0"}},  -- casting 1 SW:D when 2 charges
   {"!Shadow Word: Death", {"target.health <= 35 & !player.channeling(Void Torrent) & player.insanity <= 40 & player.buff(Voidform) & player.spell(Shadow Word: Death).cooldown = 0"}},  -- Keeping up Surrender to madness

  

   {"!Mind Blast", {"player.buff(Voidform) & !player.channeling(Void Torrent) & player.spell(228260).cooldown > 0.5 & !player.channeling(Mind Sear)"}}, --Voidbolt before Mindblast
   {"Shadow Word: Pain", {"!target.debuff(Shadow Word: Pain) & player.buff(Voidform) & !player.channeling(Void Torrent) & !player.channeling(Mind Sear)"}}, -- SW:P check
   {"Vampiric Touch", {"!target.debuff(Vampiric Touch) & player.buff(Voidform) & !player.channeling(Void Torrent) & !player.channeling(Mind Sear)"}}, -- VT check

   {"Mind Sear", {"toggle(AOE) & player.buff(Voidform) & !player.channeling(Mind Sear) & !player.channeling(Void Torrent)"}}, -- Replace Mind Flay Filler
   {"Mind Flay", {"player.spell(228260).cooldown > 0 & player.spell(8092).cooldown > 0 & !player.channeling(Mind Flay) & !player.channeling(Void Torrent) & !toggle(AOE) & !player.channeling(Mind Blast) & !player.channeling(Mind Sear)"}},

 {"!Void Eruption", "!player.channeling(Void Torrent)"},


}

local ST = {
   
   {"Shadowform", "!player.buff(Voidform) & !player.buff(Shadowform)"},

-- Body and Soul
   {"17", "player.moving & !player.buff(193223) & !player.channeling(Void Torrent) & player.movingfor >= 1 & talent(Body and Soul)" },

-- Shadowy insight
   {"!Mind Blast", "player.buff(12443) & !player.channeling(Void Torrent) & !player.channeling(Mind Blast)"}, --Used ASAP so no procs are wasted

--Start Rotation (NO VOIDFORM)
   --{"!Mindbender", "!player.buff(Voidform) & talent(6, 3)"}, -- CD

   {"!Shadow Word: Death", "target.health <= 35 & !player.channeling(Void Torrent) & player.spell(Shadow Word: Death).cooldown = 0 & player.insanity <= 65"},
   {"!Shadow Word: Death", "target.health <= 35 & !player.channeling(Void Torrent) & player.spell(Shadow Word: Death).cooldown = 0 & player.moving"},

   {"!Void Eruption"},
   {"Shadow Word: Pain", "!player.buff(Voidform) & player.insanity >= 70 & target.debuff(Shadow Word: Pain).duration <= 6"}, -- SW:P refresh going into Stm
   {"Vampiric Touch", "!player.buff(Voidform) & player.insanity >= 70 & target.debuff(Vampiric Touch).duration <= 6" }, -- VT refresh going into Stm


   {"!Mind Blast", "!player.buff(Voidform)"},
   {"Shadow Word: Pain", "!player.buff(Voidform) & target.debuff(Shadow Word: Pain).duration < 3" }, -- SW:P refresh
   {"Vampiric Touch", "!player.buff(Voidform) & target.debuff(Vampiric Touch).duration < 3" }, -- VT refresh
   {"Mind Sear", "toggle(AOE) & !player.buff(Voidform) & !player.channeling(Mind Sear)"}, -- Replace Mind Flay Filler
   {"Mind Flay", "player.spell(8092).cooldown > 0 & !player.buff(Voidform) & !toggle(AOE) & !player.channeling(Mind Flay)"}, --Mindlay filler no voidform
  
{"!Void Eruption"},


}

local inCombat = {
  {"!Void Eruption", "!player.channeling(Void Torrent)"},
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
   {"Power Infusion", "talent(Power Infusion) & toggle(cooldowns) & player.buff(Voidform) & !player.buff(Dispersion) & !player.buff(Surrender to Madness) & !player.channeling(Void Torrent) & player.buff(voidform).count >= 15" },
   {"Shadowfiend",  "!talent(Mindbender) & toggle(cooldowns) & player.buff(Voidform) & !player.channeling(Void Torrent) & player.spell(8092).cooldown > 0 & player.spell(228260).cooldown > 0 & player.buff(voidform).count > 10"},
   {"Mindbender", "talent(Mindbender) & player.buff(Voidform) & toggle(cooldowns) & !player.buff(193223) & player.buff(voidform).count > 5 & !player.channeling(Void Torrent)"},
    {"!Void Eruption", "!player.channeling(Void Torrent)"},

   -- Keybinds
     -- {"!32375 & keybind(lalt) & tank.advancedground"}, -- Mass Dispel (Enable if on Dispel Duty)
    -- AOE Shift button




}

local outCombat = {
 {"Shadowform", "!player.buff(Shadowform)"},
 {"17", "player.movingfor >= 1 & !player.buff(180545) & talent(Body and Soul)", "player"}, -- Body and Soul

}

NeP.CR:Add(258, {
    name = ' [Yobleed] Priest - Shadow',
      ic = inCombat,
     ooc = outCombat,
     gui = GUI,
    load = exeOnLoad
})
--NeP.CR:Add(258, '[Yobleed] Priest - Shadow', inCombat, outCombat, exeOnLoad, GUI)
