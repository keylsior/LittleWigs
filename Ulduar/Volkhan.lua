----------------------------------
--      Module Declaration      --
----------------------------------

local boss = BB["Volkhan"]
local mod = BigWigs:New(boss, tonumber(("$Revision$"):sub(12, -3)))
if not mod then return end
mod.partycontent = true
mod.otherMenu = "Ulduar"
mod.zonename = BZ["Halls of Lightning"]
mod.enabletrigger = boss
mod.guid = 28587
mod.toggleoptions = {"stomp", "stompBar", "bosskill"}

--------------------------------
--        Localization        --
--------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

L:RegisterTranslations("enUS", function() return --@localization(locale="enUS", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("deDE", function() return --@localization(locale="deDE", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("esES", function() return --@localization(locale="esES", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("esMX", function() return --@localization(locale="esMX", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("frFR", function() return --@localization(locale="frFR", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("koKR", function() return --@localization(locale="koKR", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("ruRU", function() return --@localization(locale="ruRU", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("zhCN", function() return --@localization(locale="zhCN", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

L:RegisterTranslations("zhTW", function() return --@localization(locale="zhTW", namespace="Ulduar/Volkhan", format="lua_table", handle-unlocalized="ignore")@
end )

----------------------------------
--        Initialization        --
----------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_CAST_START", "Stomp", 52237, 59529)
	self:AddCombatListener("UNIT_DIED", "BossDeath")
end

----------------------------------
--        Event Handlers        --
----------------------------------

function mod:Stomp(_, spellId, _, _, spellName)
	if self.db.profile.stomp then
		self:IfMessage(L["stomp_message"], "Urgent", spellId)
	end
	if self.db.profile.stompBar then
		self:Bar(spellName, 3, spellId)
	end
end
