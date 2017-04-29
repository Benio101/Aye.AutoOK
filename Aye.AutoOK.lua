local Aye = Aye;
if not Aye.addModule("Aye.AutoOK") then return end;

-- LFGListInviteDialog
--
-- PopUp OnShow
-- LFG rules showing after joining some LFG groups
LFGListInviteDialog.AcknowledgeButton:HookScript("OnShow", function(self)
	if
			Aye.db.global.AutoOK.enable
		and	Aye.db.global.AutoOK.LFGListInviteDialog
	then
		self:Click();
	end;
end);

-- LFDRoleCheckPopupAcceptButton
--
-- PopUp OnShow
-- LFD Role Check
LFDRoleCheckPopupAcceptButton:HookScript("OnShow", function(self)
	if
			Aye.db.global.AutoOK.enable
		and	Aye.db.global.AutoOK.LFDRoleCheckPopupAcceptButton
	then
		self:Click();
	end;
end);
--
-- PopUp OnShow
-- LFG invite popup
LFGInvitePopupAcceptButton:HookScript("OnShow", function(self)
	if
			Aye.db.global.AutoOK.enable
		and	Aye.db.global.AutoOK.LFDRoleCheckPopupAcceptButton
	then
		self:Click();
	end;
end);

-- LFGListApplicationDialog
--
-- PopUp OnShow
-- LFG Appplication info
LFGListApplicationDialog.SignUpButton:HookScript("OnShow", function(self)
	if
			Aye.db.global.AutoOK.enable
		and	Aye.db.global.AutoOK.LFGListApplicationDialog
	then
		self:Click();
	end;
end);

-- CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL
--
-- PopUp OnShow
-- selling items that "will make it non-tradeable, even if you buy it back"
hooksecurefunc("StaticPopup_Show", function(self)
	if self == "CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL" then
		if
				Aye.db.global.AutoOK.enable
			and	Aye.db.global.AutoOK.CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL
		then
			local popup = StaticPopup_Visible("CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL");
			_G[popup .."Button1"]:Click();
		end;
	end;
end);

-- LFGDungeonReadyDialogLeaveQueueButton
--
-- PopUp OnShow
-- LFG group formed
LFGDungeonReadyDialogLeaveQueueButton:HookScript("OnShow", function(self)
	if
			Aye.db.global.AutoOK.enable
		and	Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton
	then
		local _, id, typeID, subtypeID, name, _, _, _, _, _, _, isLeader = GetLFGProposal();
		if
			-- skip non-LFR group invites
				typeID		== TYPEID_DUNGEON
			and	subtypeID	== LFG_SUBTYPEID_RAID
			
			-- skip encounters with only 1 boss
			and	id ~= 1289	-- Rift of Aln			-- Xavius
			and	id ~= 1293	-- Betrayer's Rise		-- Gul'dan
			and	id ~= 1497	-- Deceiver's Fall		-- Kil'jaeden
			
			-- must be a leader
			and	not isLeader
		then
			-- Note about skipped invitations
			if Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton_desc then
				print("|cff9d9d9d[|r|cffe6cc80Aye|r|cff9d9d9d]|r Skipped invitation to |cff9d9d9d\"|r|cffe6cc80" ..name .."|r|cff9d9d9d\"|r group, because not chosen as leader.");
			end;
			
			-- leave queue
			self:Click();
			
			-- requeue
			if Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton_openFrame then
				if PVEFrame:IsShown() then PVEFrame_ToggleFrame() end;
				PVEFrame_ToggleFrame("GroupFinderFrame", RaidFinderFrame);
				
				RaidFinderQueueFrame_SetRaid(id);
				RaidFinderQueueFrameRoleButtonLeader.checkButton:SetChecked(true);
				
				-- cannot call, it's protected
				--RaidFinderFrameFindRaidButton:Click();
				--PVEFrame_ToggleFrame("GroupFinderFrame", RaidFinderFrame);
			end;
		end;
	end;
end);

Aye.modules.AutoOK.OnEnable = function()
	-- backup object
	Aye.modules.AutoOK.bak = {};
	Aye.modules.AutoOK.bak.StaticPopupDialogs = {};
	
	-- backup StaticPopupDialogs.DELETE_GOOD_ITEM and StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM
	Aye.modules.AutoOK.bak.StaticPopupDialogs.DELETE_GOOD_ITEM = StaticPopupDialogs.DELETE_GOOD_ITEM;
	Aye.modules.AutoOK.bak.StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM = StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM;
	
	-- check "Type DELETE into the field to confirm."
	Aye.modules.AutoOK.CheckTypeDELETEtoConfirm();
end;

-- DisableTypeDELETEtoConfirm
-- Either backup original StaticPopupDialogs or replace them with ones without "Type DELETE into the field to confirm." confirmation
--
-- @noparam
-- @noreturn
Aye.modules.AutoOK.CheckTypeDELETEtoConfirm = function()
	if
			Aye.db.global.AutoOK.enable
		and	Aye.db.global.AutoOK.DisableTypeDELETEtoConfirm
	then
		-- Disable "Type DELETE into the field to confirm." confirmation, replacing DELETE_GOOD_*ITEM with DELETE_*ITEM PopupDialogs
		StaticPopupDialogs.DELETE_GOOD_ITEM = StaticPopupDialogs.DELETE_ITEM;
		StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM = StaticPopupDialogs.DELETE_QUEST_ITEM;
	else
		-- backup StaticPopupDialogs.DELETE_GOOD_ITEM and StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM
		StaticPopupDialogs.DELETE_GOOD_ITEM = Aye.modules.AutoOK.bak.StaticPopupDialogs.DELETE_GOOD_ITEM;
		StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM = Aye.modules.AutoOK.bak.StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM;
	end;
end;

Aye.modules.AutoOK.events.ADDON_LOADED = function(addon)
	-- TALKINGHEAD_REQUESTED
	-- Remove Talking Head
	if
			Aye.db.global.AutoOK.enable
		and	Aye.db.global.AutoOK.TALKINGHEAD_REQUESTED
		and	addon == "Blizzard_TalkingHeadUI"
	then
		TalkingHeadFrame:UnregisterEvent("TALKINGHEAD_REQUESTED");
	end;
end;