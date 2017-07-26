local NeP = NeP

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
  {type = 'checkbox', text = 'Target Fel Explosives', key = 'myth_fel', default= false},
  {type = 'text', text = 'Before Pull', align = 'center'},
  {type = 'checkbox', text = 'Potion of Prolonged Power', key = 's_pull', default= false},
  {type = 'checkbox', text = 'Mind Blast', key = 'pull_MB', default = false},
  {type = 'text', text = 'Movement', align = 'center'},
  {type = 'checkbox', text = 'Body and Soul', key = 'm_Body', default = false},
  {type = 'ruler'}, {type = 'spacer'},

  -- COOLDOWNS
  {type = 'header', text = 'Cooldowns if Toggled', align = 'center'},
  {type = 'checkbox', text = 'Hero Potion of Prolonged Power', key = 's_PP', default= false},
  {type = 'text', text = 'Trinkets', align = 'center'},
  {type = 'checkbox', text = 'Top Trinket', key = 'trinket_1', default = false},
  {type = 'checkbox', text = 'Bottom Trinket', key = 'trinket_2', default = false},
  {type = 'text', text = 'Power Infusion', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_PI', default= false},
  {type = 'spinner', text = 'Target <= 35%', key = 'dps_PIspin1', align = 'left', step = 1, default = 15},
  {type = 'spinner', text = 'Target > 35%', key = 'dps_PIspin2', align = 'left', step = 1, default = 15},
  {type = 'text', text = 'Shadowfiend/Mindbender', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_fiend', default= false},
  {type = 'spinner', text = 'Stacks', key = 'dps_SFspin', align = 'left', step = 1, default = 22},
  {type = 'text', text = 'Void Torrent', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_void', default= false},
  {type = 'text', text = 'Dispersion', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_D', default= false},
  {type = 'spinner', text = 'Target <= 35%', key = 'dps_Dspin', align = 'left', min = 15, max = 50, step = 1, default = 44},
  {type = 'spinner', text = 'Target > 35%', key = 'dps_D2spin', align = 'left', min = 15, max = 50, step = 1, default = 30},
  {type = 'text', text = 'Arcane Torrent', align = 'center'},
  {type = 'checkbox', text = 'ON/OFF', key = 'dps_at', default= true},
  {type = 'ruler'}, {type = 'spacer'},

  -- GUI Survival & Potions
  {type = 'header', text = 'Survival & Potions', align = 'center'},
  {type = 'checkbox', text = 'Fade', key = 's_F', default= false},
  {type = 'checkbox', text = 'Power Word: Shield', key = 's_PWS', default = false},
  {type = 'spinner', text = '', key = 's_PWSspin', default = 40},
  {type = 'checkbox', text = 'Dispersion', key = 's_D', default = false},
  {type = 'spinner', text = '', key = 's_Dspin', align = 'left', default = 20},
  {type = 'checkbox', text = 'Gift of the Naaru', key = 's_GotN', default = false},
  {type = 'spinner', text = '', key = 's_GotNspin', default = 40},
  {type = 'checkbox', text = 'Healthstone', key = 's_HS', default = false},
  {type = 'spinner', text = '', key = 's_HSspin', default = 20},
  {type = 'checkbox', text = 'Ancient Healing Potion', key = 's_AHP', default = false},
  {type = 'spinner', text = '', key = 's_AHPspin', default = 20, align = 'left'},
  {type = 'ruler'}, {type = 'spacer'},

  -- GUI Party Support
  {type = 'header', text = 'Party Support', align = 'center'},
  {type = 'checkbox', text = 'Gift of the Naaru', key = 'sup_GotN', default = false},
  {type = 'spinner', text = '', key = 'sup_GotNspin', default = 20},
  {type = 'checkbox', text = 'Power Word: Shield', key = 'sup_PWS', default = false},
  {type = 'spinner', text = '', key = 'sup_PWSspin', default = 20},

  -- GUI Keybinds
  {type = 'header', text = 'Keybinds', align = 'center'},
  {type = 'text', text = 'Left Shift: AOE|Left Ctrl: Mass Dispel|Alt: Pause', align = 'center'},
  {type = 'checkbox', text = 'Force AOE', key = 'k_AOE', default = false},
  {type = 'checkbox', text = 'Mass Dispel', key = 'k_MD', default = false},
  {type = 'checkbox', text = 'Pause', key = 'k_P', default = false},
  {type = 'ruler'}, {type = 'spacer'},
}

local spell_ids = {
  ["Mangaza\'s Madness"]       = 132864,
  ["Shadow Word: Pain"]        = 589,
  ["The Val'kyr"]              = 126695,
  ["Ascension"]                = 161862,
  ["Holy Word: Chastise"]      = 200200,
  ["Power Word: Radiance"]     = 194509,
  ["Psychic Voice"]            = 196704,
  ["Surge of Light"]           = 109186,
  ["Body and Soul"]            = 64129,
  ["Void Eruption"]            = 228260,
  ["Reaper of Souls"]          = 199853,
  ["Glyph of Shackle Undead"]  = 57986,
  ["Surrendered Soul"]         = 212570,
  ["Pain Suppression"]         = 33206,
  ["Glyph of the Sha"]         = 147776,
  ["Circle of Healing"]        = 204883,
  ["Legacy of the Void"]       = 193225,
  ["Arcane Torrent"]           = 232633,
  ["Clarity of Will"]          = 152118,
  ["Void Lord"]                = 199849,
  ["Mind Vision"]              = 2096,
  ["Mind Spike Detonation"]    = 217676,
  ["Twist of Fate"]            = 109142,
  ["Heal"]                     = 2060,
  ["Divine Hymn"]              = 64844,
  ["Guardian Spirit"]          = 47788,
  ["Discipline Priest"]        = 137032,
  ["Shadowy Friends"]          = 126797,
  ["Mind Spike"]               = 73510,
  ["Mind Flay"]                = 193473,
  ["Fortress of the Mind"]     = 193195,
  ["Psychic Scream"]           = 8122,
  ["Shadow Crash"]             = 205385,
  ["Shadow Word: Void"]        = 205351,
  ["Schism"]                   = 214621,
  ["Mass Dispel"]              = 72734,
  ["Mind Bomb"]                = 205369,
  ["Powerheal 4000 Lens"]      = 41321,
  ["Mysticism"]                = 89745,
  ["Apotheosis"]               = 200183,
  ["Atonement"]                = 194384,
  ["Focused Will"]             = 45243,
  ["Void Torrent"]             = 205065,
  ["Inspired Hymns"]           = 148074,
  ["Silence"]                  = 15487,
  ["Shadow Priest"]            = 137033,
  ["Levitate"]                 = 111759,
  ["Flash Heal"]               = 2061,
  ["Divinity"]                 = 197031,
  ["Dispel Magic"]             = 528,
  ["Piety"]                    = 197034,
  ["Powerheal 9000 Lens"]      = 46108,
  ["Serendipity"]              = 63733,
  ["Holy Fire"]                = 231687,
  ["Gift of the Naaru"]        = 59544,
  ["Mania"]                    = 193173,
  ["Void Ray"]                 = 205371,
  ["Leap of Faith"]            = 73325,
  ["Shadowfiend"]              = 34433,
  ["Light's Wrath"]            = 207948,
  ["Shadow"]                   = 107905,
  ["Benediction"]              = 193157,
  ["Holy Word: Serenity"]      = 2050,
  ["Purge the Wicked"]         = 204197,
  ["Spirit Shell"]             = 114908,
  ["Void Bolt"]                = 231688,
  ["Enduring Renewal"]         = 200153,
  ["Censure"]                  = 200199,
  ["Shadowform"]               = 232698,
  ["Shining Force"]            = 204263,
  ["Spirit of Redemption"]     = 215769,
  ["Enlightenment"]            = 193155,
  ["Afterlife"]                = 196707,
  ["Mass Resurrection"]        = 212036,
  ["Heavens"]                  = 112660,
  ["Holy Nova"]                = 132157,
  ["Auspicious Spirits"]       = 155271,
  ["Light of the Naaru"]       = 196985,
  ["Insanity"]                 = 194251,
  ["Glyph of Shadow"]          = 107906,
  ["Shadowy Insight"]          = 162452,
  ["Body and Mind"]            = 214121,
  ["Shadowy Apparitions"]      = 78203,
  ["Masochism"]                = 193063,
  ["Guardian Angel"]           = 200209,
  ["Glyph of the Heavens"]     = 120581,
  ["Sin and Punishment"]       = 131556,
  ["Desperate Prayer"]         = 19236,
  ["San'layn"]                 = 199855,
  ["Shadow Word: Death"]       = 231689,
  ["Power Word: Shield"]       = 17,
  ["Renew"]                    = 139,
  ["Power Infusion"]           = 10060,
  ["Sha"]                      = 148071,
  ["Power Word: Solace"]       = 129250,
  ["Echo of Light"]            = 77489,
  ["Shadowy Apparition"]       = 148859,
  ["Grace"]                    = 200309,
  ["Glyph of Inspired Hymns"]  = 147072,
  ["Trail of Light"]           = 200128,
  ["Mindbender"]               = 200174,
  ["Binding Heal"]             = 32546,
  ["Light of T'uure"]          = 208065,
  ["Voidform"]                 = 228264,
  ["Castigation"]              = 193134,
  ["Angelic Feather"]          = 121536,
  ["Priest"]                   = 137030,
  ["Vampiric Touch"]           = 34914,
  ["Purify Disease"]           = 213634,
  ["Rapture"]                  = 47536,
  ["Fade"]                     = 586,
  ["Surrender to Madness"]     = 193223,
  ["Mind Sear"]                = 208232,
  ["Misery"]                   = 238558,
  ["Halo"]                     = 120517,
  ["Shadow Mend"]              = 187464,
  ["Holy Word: Sanctify"]      = 34861,
  ["Smite"]                    = 231682,
  ["Contrition"]               = 197419,
  ["Vampiric Embrace"]         = 15286,
  ["Mind Blast"]               = 8092,
  ["The Penitent"]             = 200347,
  ["Symbol of Hope"]           = 64901,
  ["Mind Control"]             = 205364,
  ["Invoke the Naaru"]         = 196705,
  ["Shadow Covenant"]          = 204065,
  ["Shackle Undead"]           = 58251,
  ["Dispersion"]               = 47585,
  ["Purify"]                   = 527,
  ["Prayer of Mending"]        = 155793,
  ["Dominant Mind"]            = 205367,
  ["Prayer of Healing"]        = 98367,
  ["Power Word: Barrier"]      = 81782,
  ["Plea"]                     = 212100,
  ["Penance"]                  = 47758,
  ["Shield Discipline"]        = 197045,
  ["Lingering Insanity"]       = 197937,
  ["Shadowcrawl"]              = 63619,
  ["Id"]                       = 205477,
  ["Holy Priest"]              = 137031,
  ["Glyph of the Val'kyr"]     = 126094,
  ["Glyph of Shadowy Friends"] = 126745,
  ["Divine Star"]              = 110744,
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
  {'!Shadow Word: Death', 'equipped(144438) & !player.buff(Voidform) & player.spell(Mind Blast).cooldown > gcd', 'target'},
  {'!Shadow Word: Death', 'equipped(144438) & player.spell(Void Eruption).cooldown > gcd & player.spell(Mind Blast).cooldown > gcd & player.buff(Voidform)', 'target'},
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
  {'!Mindblast', '!player.spell(Void Eruption).cooldown == 0','target'},
}

local Emergency = {
  --Dispersion when SWD charges are 0 and VoiT is on CD and insanity below or equal to 20%.
  {'!Dispersion', 'player.spell(Shadow Word: Death).charges < 1 & !spell(Void Torrent).cooldown > 0 & player.insanity <= 20 & !talent(7,1) & !talent(7,2) & UI(dps_D)'},
  --Arcane Torrent if SWD on cd or not usable, dispersion is on CD and insanity is low
  {'!Arcane Torrent', 'UI(dps_at) & player.insanity <= 35 & {!spell(Shadow Word: Death).cooldown > 0 || !target.health <= 35} & !spell(Dispersion).cooldown > 0'},
  --Power Infusion if talent active and VF stacks are 70 or higher if SWD charges are 0 and insanity is 50% or below.
  {'!Power Infusion', 'talent(6,1) & player.buff(voidform).count >= 80 & spell(Shadow Word: Death).charges < 1 & player.insanity <= 60 & UI(dps_PI)'},
}

local cooldowns = {

    --Torrent on CD.
    {'!Void Torrent', 'player.spell(Void Eruption).cooldown > 0 & UI(dps_void) & player.buff(Voidform).count > 3 & set_bonus(T19) == 4', 'target'},
    {'!Void Torrent', 'UI(dps_void) & !set_bonus(T19) == 4', 'target'},
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target below or equal to 35% health.
  {'!Power Infusion', 'talent(6,1) & player.buff(Surrender to Madness) & player.buff(Voidform).count >= 50 & player.insanity >= 50 & !spell(Void Eruption).cooldown == 0 & !spell(Void Torrent).cooldown == 0 & !spell(Dispersion).cooldown == 0 & UI(dps_PI)', 'player'},
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target below or equal to 35% health.
  {'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(Voidform).count >= UI(dps_PIspin1) & target.health <= 35 & UI(dps_PI)', 'player'},
  --Power infusion if talent is active, not in S2M when VF stacks are above or equal to UI value and checked if target above or 35% health.
  {'Power Infusion', 'talent(6,1) & !player.buff(Surrender to Madness) & player.buff(Voidform).count >= UI(dps_PIspin2) & target.health > 35 & UI(dps_PI)', 'player'},
  --Mindbender if talent is active on CD in S2M.
  {'!Mindbender', 'talent(6,3) & player.buff(Surrender to Madness)'},
  --Mind Bender if talent is active and not in S2M if VF stacks are above 5.
  {'!Mindbender', 'talent(6,3) & !player.buff(Surrender to Madness) & player.buff(Voidform).count >= UI(dps_SFspin) & UI(dps_fiend)', 'target'},
  --Shadowfiend if Void Bolt is on CD and VF stacks are above 10 when Power Infusion talent is not active.
  {'!Shadowfiend', '!player.spell(Void Eruption).cooldown == 0 & player.buff(Voidform).count >= UI(dps_SFspin) & !talent(6,1) & UI(dps_fiend)', 'target'},
  --Shadowfiend if PI and above 40% insanity.
  {'!Shadowfiend', 'player.buff(Power Infusion) & player.buff(Voidform).count >= UI(dps_SFspin) & UI(dps_fiend)'},
}

local AOE = {
  {{
    {'Shadow Word: Pain', '{!debuff(Shadow Word: Pain) & toggle(AOE) & distance <= 40 & combat & {player.moving||{!player.buff(Twist of Fate) & health <= 35 & talent(1,1)}}}', 'enemies'},
    {'Vampiric Touch', '{ttd >= 7 & toggle(AOE) & distance <= 40 & combat & !player.lastcast(Vampiric Touch) & {!debuff(Vampiric Touch)||{!debuff(Shadow Word: Pain) & talent(6,2)}}}', 'enemies'},
    {'Shadow Word: Pain', '!debuff(Shadow Word: Pain) & !talent(6,2) & toggle(AOE) & distance <= 40 & combat', 'enemies'},
  },'player.buff(Voidform) & !player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0'},
  {{
    {'Shadow Word: Pain', '{!debuff(Shadow Word: Pain) & toggle(AOE) & distance <= 40 & combat & infront & {player.moving||{!player.buff(Twist of Fate) & health <= 35 & talent(1,1)}}}', 'enemies'},
    {'Vampiric Touch', '{ttd >= 7 & toggle(AOE) & infront & distance <= 40 & combat & !player.lastcast(Vampiric Touch) & {!debuff(Vampiric Touch)||{!debuff(Shadow Word: Pain) & talent(6,2)}}}', 'enemies'},
    {'Shadow Word: Pain', '!debuff(Shadow Word: Pain) & !talent(6,2) & toggle(AOE) & distance <= 40 & infront & combat', 'enemies'},
  },'!player.buff(Voidform) & !player.insanity == 100'},
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
  {'Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & !player.lastcast(Vampiric Touch)','target'},
  --Mind Blast if player is channeling Mind Flay.
  {'!Mind Blast', 'player.channeling(Mind Flay)','target'},
  {'Mind Blast', 'equipped(Mangaza\'s Madness) & target.debuff(Vampiric Touch) & target.debuff(Shadow Word: Pain)'},
  --Mind Blast on CD.
  {'Mind Blast', '!equipped(Mangaza\'s Madness)','target'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'Shadow Word: Pain', '{target.debuff(Shadow Word: Pain).duration < 3 & !talent(6,2)} || {!target.debuff(Shadow Word: Pain) & !talent(6,2)}','target'},
  {'Vampiric Touch', '{debuff(Vampiric Touch).duration <= 3 & !player.lastcast(Vampiric Touch)} || {!debuff(Vampiric Touch) & !player.lastcast(Vampiric Touch)} || {{!debuff(Shadow Word: Pain)} & talent(6,2)}','target'},
  --Mind Flay if Mind Blast is on cooldown
  {'Mind Flay', nil,'target'},
}

local lotv = {
  {{
    {'!Shadow Word: Death', '!player.spell(Void Eruption).cooldown == 0 & player.moving', 'target'},
    {'!Shadow Word: Death', '{!player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 & player.spell(Shadow Word: Death).charges > 1} || {!player.channeling(Mind Blast) & !player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 }', 'target'},
  {'!Shadow Word: Death', '!player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 & !player.channeling(Void Eruption)', 'target'},
  }, '!target.area(10).enemies >= 4 & advanced'},
  {{
    {'!Shadow Word: Death', '!player.spell(Void Eruption).cooldown == 0 & player.moving', 'target'},
    {'!Shadow Word: Death', '{!player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 & player.spell(Shadow Word: Death).charges > 1} || {!player.channeling(Mind Blast) & !player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 }', 'target'},
    {'!Shadow Word: Death', '!player.spell(Mind Blast).cooldown == 0 & !player.spell(Void Eruption).cooldown == 0 & !player.channeling(Void Eruption)', 'target'},
  }, '!advanced'},
  --Dispersion if VF stacks are above or equal to UI value and checked and SWD charges are 0 and if insanity is below 20% and Target Health is below or equal to 35% health.
  {'!Dispersion', 'player.buff(Voidform).count >= UI(dps_Dspin) & UI(dps_D) & spell(Shadow Word: Death).charges < 1 & player.insanity <= 30 & target.health <= 35 & !player.spell(Void Torrent).cooldown == 0','target'},
  --Dispersion if VF stacks are above or equal to UI value and checked and if insanity is below 20% and Target Health is above 35% health.
  {'!Dispersion', 'player.buff(Voidform).count >= UI(dps_D2spin) & UI(dps_D) & !player.buff(Surrender to Madness) & player.insanity <= 30 & target.health > 35 & !player.spell(Void Torrent).cooldown == 0','target'},
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
  {'!Vampiric Touch', '!target.debuff(Shadow Word: Pain) & talent(6,2) & !player.lastcast(Vampiric Touch)','target'},
  --Shadow Word: Pain if target debuff duration is below 3 seconds OR if target has no SWP.
  {'Shadow Word: Pain', '{target.debuff(Shadow Word: Pain).duration < 3 & !talent(6,2)} || {!target.debuff(Shadow Word: Pain) & !talent(6,2)} || {moving & !target.debuff(Shadow Word: Pain)}','target'},
  --Vampiric Touch if target debuff duration is below 3 seconds OR if target has no Vampiric Touch.
  {'!Vampiric Touch', '{target.debuff(Vampiric Touch).duration <= 3 & !player.lastcast(Vampiric Touch)} || {!target.debuff(Vampiric Touch) & !player.lastcast(Vampiric Touch)} || {{target.debuff(Shadow Word: Pain).duration <= 1.3 || !target.debuff(Shadow Word: Pain)} & talent(6,2) & !player.lastcast(Vampiric Touch)}','target'},
  --Mind Flay if Dots are up and VB and MB are on CD.
  {'Mind Flay', '!player.spell(Mind Blast).cooldown == 0','target'},
}


local inCombat = {
  {'Shadowform', '!player.buff(Voidform) & !player.buff(Shadowform) & !player.lastcast(Shadowform)', 'player'},
  {Movement, '!player.buff(Voidform || {player.buff Voidform & !spell(Void Eruption).cooldown == 0}'},
  {Surrender},
  {'Mind Bomb', 'toggle(abc) & talent(7,2) & target.area(8).enemies >= 3 & {!player.buff(Surrender To Madness) || spell(Shadow Crash).cooldown == 0 & player.buff(Voidform)}'},
  {Mythic, 'partycheck == 2 & UI(myth_fel)'},
  {Emergency},
  {Potions},
  {Survival, 'player.health < 100 & !player.buff(Surrender to Madness)'},
  {Support, '!player.buff(Surrender to Madness) '},
  {cooldowns, 'player.buff(Voidform) & toggle(cooldowns)'},
  {Zeks},
  {Insight, 'player.buff(Shadowy Insight) & {{talent(7,1) & !player.insanity >= 65} || {talent(7,3) ||talent(7,2) & !player.insanity == 100}} || {player.moving & !player.buff(Surrender to Madness)}'},
  {Keybinds},
  {Trinkets, ''},
  {Interrupts, 'toggle(interrupts) & target.interruptAt(70) & target.infront & target.range <= 30'},
  {AOE, 'toggle(AOE) & range <= 40'},
  {lotv, 'player.buff(Voidform)'},
  {ST, "!player.buff(Voidform)"},
  {'Mind Flay', nil,'target'},
}

local outCombat = {
  -- Potion of Prolonged Power usage before pull if enabled in UI.
  {'#142117', 'pull_timer < 4 & UI(s_pull)'},
  -- Mind Blast before Pull.
  {'8092', 'pull_timer <= 1.2 & UI(pull_MB)'},
  {'Shadowform', '!player.buff(Shadowform) & !player.lastcast(Shadowform)','player'},
  --No Body and Soul from Class Hall.
  {Movement, '!player.buff(Body and Soul) & !inareaid == 1040'},
}

NeP.CR:Add(258, {
  name = '|cff6c00ff [Yobleed]|r Priest - |cff6c00ffShadow|r',
  ic = {{inCombat, '!player.channeling(Void Torrent)'}},
  ooc = outCombat,
  gui = GUI,
  load = exeOnLoad,
  ids = spell_ids
})
