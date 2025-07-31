-- LilKarenWatcher Addon for WoW 1.12
local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_CHANNEL")
frame:RegisterEvent("CHAT_MSG_SAY")
frame:RegisterEvent("CHAT_MSG_YELL")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_PARTY")
frame:RegisterEvent("CHAT_MSG_RAID")
frame:RegisterEvent("CHAT_MSG_SYSTEM")
frame:RegisterEvent("CHAT_MSG_COMBAT_LOG")

-- Check for LilKaren in visible players
local function checkForLilKaren()
    for i = 1, GetNumRaidMembers() do
        local name = GetRaidRosterInfo(i)
        if name and string.lower(name) == "lilkaren" then
            SendChatMessage("Spotted LilKaren! 👀", "SAY")
            break
        end
    end
    for i = 1, GetNumPartyMembers() do
        local name = UnitName("party"..i)
        if name and string.lower(name) == "lilkaren" then
            SendChatMessage("Hey LilKaren, fancy seeing you here!", "SAY")
            break
        end
    end
end

-- Hook into zone update and targeting
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "CHAT_MSG_SYSTEM" or event == "CHAT_MSG_COMBAT_LOG" then
        checkForLilKaren()
    end
end)
