local _ = ...
local NeP = NeP

local setsTable = {
  ["DEATH KNIGHT"] = {
    ["T19"] = {
      138355, --Dreadwyrm Crown
      138349, --Dreadwyrm Breastplate
      138361, --Dreadwyrm Shoulderguards
      138352, --Dreadwyrm Gauntlets
      138358, --Dreadwyrm Legplates
      138364, --Dreadwyrm Greatcloak
    },
  },
  ["DEMON HUNTER"] = {
    ["T19"] = {
      138378, --Mask of Second Sight
      138376, --Tunic of Second Sight
      138380, --Shoulderguards of Second Sight
      138377, --Gloves of Second Sight
      138379, --Legwraps of Second Sight
      138375, --Cape of Second Sight
    },
  },
  ["DRUID"] = {
    ["T19"] = {
      138330, --Hood of the Astral Warden
      138324, --Robe of the Astral Warden
      138336, --Mantle of the Astral Warden
      138327, --Gloves of the Astral Warden
      138333, --Leggings of the Astral Warden
      138366, --Cloak of the Astral Warden
    },
  },
  ["HUNTER"] = {
    ["T19"] = {
      138342, --Eagletalon Cowl
      138339, --Eagletalon Tunic
      138347, --Eagletalon Spaulders
      138340, --Eagletalon Gauntlets
      138344, --Eagletalon Legchains
      138368, --Eagletalon Cloak
    },
  },
  ["MAGE"] = {
    ["T19"] = {
      138312, --Hood of Everburning Knowledge
      138318, --Robe of Everburning Knowledge
      138321, --Mantle of Everburning Knowledge
      138309, --Gloves of Everburning Knowledge
      138315, --Leggings of Everburning Knowledge
      138365, --Cloak of Everburning Knowledge
    },
  },
  ["MONK"] = {
    ["T19"] = {
      138331, --Hood of Enveloped Dissonance
      138325, --Tunic of Enveloped Dissonance
      138337, --Pauldrons of Enveloped Dissonance
      138328, --Gloves of Enveloped Dissonance
      138334, --Leggings of Enveloped Dissonance
      138367, --Cloak of Enveloped Dissonance
    },
  },
  ["PALADIN"] = {
    ["T19"] = {
      138356, --Helmet of the Highlord
      138350, --Breastplate of the Highlord
      138362, --Pauldrons of the Highlord
      138353, --Gauntlets of the Highlord
      138359, --Legplates of the Highlord
      138369, --Greatmantle of the Highlord
    },
  },
  ["PRIEST"] = {
    ["T19"] = {
      138313, --Purifier's Gorget
      138319, --Purifier's Cassock
      138322, --Purifier's Mantle
      138310, --Purifier's Gloves
      138316, --Purifier's Leggings
      138370, --Purifier's Drape
    },
    ["T20"] = {
      147163, --Shawl of Blind Absolution
      147164, --Gloves of Blind Absolution
      147165, --Hood of Blind Absolution
      147166, --Leggings of Blind Absolution
      147167, --Robes of Blind Absolution
      147168, --Mantle of Blind Absolution
    },
  },
  ["ROGUE"] = {
    ["T19"] = {
      138332, --Doomblade Cowl
      138326, --Doomblade Tunic
      138338, --Doomblade Spaulders
      138329, --Doomblade Gauntlets
      138335, --Doomblade Pants
      138371, --Doomblade Shadowwrap
    },
  },
  ["SHAMAN"] = {
    ["T19"] = {
      138343, --Helm of Shackled Elements
      138346, --Raiment of Shackled Elements
      138348, --Pauldrons of Shackled Elements
      138341, --Gauntlets of Shackled Elements
      138345, --Leggings of Shackled Elements
      138372, --Cloak of Shackled Elements
    },
  },
  ["WARLOCK"] = {
    ["T19"] = {
      138314, --Eyes of Azj'Aqir
      138320, --Finery of Azj'Aqir
      138323, --Pauldrons of Azj'Aqir
      138311, --Clutch of Azj'Aqir
      138317, --Leggings of Azj'Aqir
      138373, --Cloak of Azj'Aqir
    },
  },
  ["WARRIOR"] = {
    ["T19"] = {
      138357, --Warhelm of the Obsidian Aspect
      138351, --Chestplate of the Obsidian Aspect
      138363, --Shoulderplates of the Obsidian Aspect
      138354, --Gauntlets of the Obsidian Aspect
      138360, --Legplates of the Obsidian Aspect
      138374, --Greatcloak of the Obsidian Aspect
    },
  },
}

--{'set_bonus(T19)=2||set_bonus(T19)>=4'}
--/dump NeP.DSL:Get('set_bonus')('player', 'T20')
NeP.DSL:Register("set_bonus", function(_, set)
local class = select(2,UnitClass('player'))
local pieces = setsTable[class][set] or {}
local counter = 0
for _, itemID in ipairs(pieces) do
  if IsEquippedItem(itemID) then
    counter = counter + 1
  --print(counter)
  end
end
return counter
end)


----------------------------------------------------------------------------------
-----------------------------------RAID-------------------------------------------
----------------------------------------------------------------------------------
-- partycheck= 1 (SOLO), partycheck= 2 (PARTY), partycheck= 3 (RAID)
NeP.DSL:Register('partycheck', function()
  return IsInRaid() and 3 or IsInGroup() and 2 or 1
end)

----------------------------------------------------------------------------------
-----------------------------------AREA RECOGNITION-------------------------------------------
----------------------------------------------------------------------------------
--  inareaid = ID
--/dump NeP.DSL:Get('inareaid')()
NeP.DSL:Register('inareaid', function()
    return GetCurrentMapAreaID()
end)
