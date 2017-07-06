local Aye = Aye;
if not Aye.load then return end;

Aye.default.global.AutoOK = {
	enable = true,
	LFGListInviteDialog = false,
	
	-- enable by default for classes with only one role (3 Hunter, 4 Rogue, 8 Mage, 9 Warlock)
	LFDRoleCheckPopupAcceptButton = function()
		local _, _, classID = UnitClass("player");
		return classID %5 >=3;
	end,
	
	DisableTypeDELETEtoConfirm = true,
	CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL = false,
	LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS = true,
	TALKINGHEAD_REQUESTED = false,
	LFGListApplicationDialog = false,
	
	LFGDungeonReadyDialogLeaveQueueButton = false,
	LFGDungeonReadyDialogLeaveQueueButton_desc = true,
	LFGDungeonReadyDialogLeaveQueueButton_openFrame = true,
};