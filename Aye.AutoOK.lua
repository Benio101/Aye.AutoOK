local Aye = Aye;
if not Aye.addModule("Aye.AutoOK") then return end;

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

-- PopUp OnShow
-- selling items that "will make it non-tradeable, even if you buy it back"
hooksecurefunc("StaticPopup_Show", function(self)
	if self == "CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL" then
		if
				Aye.db.global.AutoOK.enable
			and	Aye.db.global.AutoOK.CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL
		then
			StaticPopup1Button1:Click();
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