local Aye = Aye;
if not Aye.load then return end;

Aye.options.args.AutoOK = {
	name = "Auto OK",
	type = "group",
	args = {
		header1 = {
			order = 1,
			type = "header",
			name = "Auto OK",
		},
		description2 = {
			order = 2,
			type = "description",
			name = "Automatically |cffe6cc80Accept|r chosen invitations, respond |cffe6cc80OK|r to chosen dialogs, etc.\n",
		},
		enable = {
			order = 3,
			name = "Enable",
			desc = "Enable \"Auto OK\" options at all",
			type = "toggle",
			get = function() return Aye.db.global.AutoOK.enable end,
			set = function(_, v)
				Aye.db.global.AutoOK.enable = v;
				Aye.modules.AutoOK.CheckTypeDELETEtoConfirm();
			end,
		},
		execute5 = {
			order = 5,
			type = "execute",
			name = "Disable & Reload",
			func = function() DisableAddOn("Aye.AutoOK"); ReloadUI(); end,
			hidden = function() return Aye.db.global.AutoOK.enable end,
		},
		description6 = {
			order = 6,
			type = "description",
			name = "This module is currently temporary |cff9d9d9ddisabled|r at will and should no longer work.\n"
				.. "|cff9d9d9dIf you wish to keep this module disabled, you should disable related addon completelly.\n"
				.. "You can always re–enable module by re–enabling related addon addon the same way.\n|r"
			,
			hidden = function() return Aye.db.global.AutoOK.enable end,
		},
		execute7 = {
			order = 7,
			type = "execute",
			name = "Default module settings",
			desc = "Reset settings of this module to default.\n\n|cff9d9d9dIf you wish to reset settings of all Aye modules instead, "
				.. "use \"Defaults\" options from left bottom corner of \"Interface\" window, then select \"These Settings\".|r"
			,
			func = function()
				Aye.db.global.AutoOK = CopyTable(Aye.default.global.AutoOK);
				Aye.libs.ConfigRegistry:NotifyChange("Aye");
			end,
			hidden = function() return not Aye.db.global.AutoOK.enable end,
		},
		header11 = {
			order = 11,
			type = "header",
			name = "\"Auto OK\" options",
		},
		LFGListInviteDialog = {
			order = 13,
			name = "|cffe6cc80Accept|r Group Invite",
			desc = "Automatically |cffe6cc80Accept|r and |cffe6cc80Acknowledge|r |cff9d9d9dLFGListInviteDialog|r",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.LFGListInviteDialog end,
			set = function(_, v) Aye.db.global.AutoOK.LFGListInviteDialog = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description14 = {
			order = 14,
			type = "description",
			name = "Auto |cffe6cc80Acknowledge|r and close popup with LFG rules showing after joining some LFG groups.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if you always acknowledge LFG rules before joining a group.|r"
			,
		},
		LFDRoleCheckPopupAcceptButton = {
			order = 16,
			name = "|cffe6cc80Accept|r Role",
			desc = "Automatically |cffe6cc80Accept Role|r by clicking |cff9d9d9dLFDRoleCheckPopupAcceptButton|r and |cff9d9d9dLFGInvitePopupAcceptButton|r buttons |cff9d9d9dOnShow|r",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.LFDRoleCheckPopupAcceptButton end,
			set = function(_, v) Aye.db.global.AutoOK.LFDRoleCheckPopupAcceptButton = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description17 = {
			order = 17,
			type = "description",
			name = "Auto |cffe6cc80Accept Role|r on Role Check Pupup.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if your role does not change.|r\n",
		},
		LFGListApplicationDialog = {
			order = 19,
			name = "|cffe6cc80Accept|r Premade Application",
			desc = "Automatically |cffe6cc80Accept|r Premade Application, clicking |cff9d9d9dLFGListApplicationDialog.SignUpButton|r button |cff9d9d9dOnShow|r, and leaving empty description",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.LFGListApplicationDialog end,
			set = function(_, v) Aye.db.global.AutoOK.LFGListApplicationDialog = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description20 = {
			order = 20,
			type = "description",
			name = "Auto |cffe6cc80Accept|r Premade Application to custom group, leaving empty description.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if your never describe your custom group applications.|r\n",
		},
		DisableTypeDELETEtoConfirm = {
			order = 41,
			name = "|cffe6cc80Disable|r |cff9d9d9d\"Type DELETE into the field to confirm.\"|r",
			desc = "Automatically |cffe6cc80Disable|r |cff9d9d9d\"Type DELETE into the field to confirm.\"|r confirmation.",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.DisableTypeDELETEtoConfirm end,
			set = function(_, v)
				Aye.db.global.AutoOK.DisableTypeDELETEtoConfirm = v;
				Aye.modules.AutoOK.CheckTypeDELETEtoConfirm();
			end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description42 = {
			order = 42,
			type = "description",
			name = "|cffe6cc80Disable|r |cff9d9d9d\"Type DELETE into the field to confirm.\"|r confirmation.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if you always read carefully what item are you destroying.|r\n"
			,
		},
		CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL = {
			order = 45,
			name = "|cffe6cc80Accept|r Selling tradable items",
			desc = "Automatically |cffe6cc80Accept|r Selling tradable items by clicking |cff9d9d9dCONFIRM_MERCHANT_TRADE_TIMER_REMOVAL|r button |cff9d9d9dOnShow|r",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL end,
			set = function(_, v) Aye.db.global.AutoOK.CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description46 = {
			order = 46,
			type = "description",
			name = "Auto |cffe6cc80Accept|r Selling items that |cff9d9d9d\"will make it non-tradeable, even if you buy it back\"|r.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if you always read carefully what item are you selling.|r\n"
			,
		},
		TALKINGHEAD_REQUESTED = {
			order = 61,
			name = "|cffe6cc80Remove|r Talking Head",
			desc = "Automatically |cffe6cc80Remove|r Talking Head",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.TALKINGHEAD_REQUESTED end,
			set = function(_, v)
				Aye.db.global.AutoOK.TALKINGHEAD_REQUESTED = v;
				
				-- Live update
				if Aye.db.global.AutoOK.TALKINGHEAD_REQUESTED then
					-- Disable Talking Head
					TalkingHeadFrame:UnregisterEvent("TALKINGHEAD_REQUESTED");
				else
					-- Enable Talking Head
					TalkingHeadFrame:RegisterEvent("TALKINGHEAD_REQUESTED");
				end;
			end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description62 = {
			order = 62,
			type = "description",
			name = "Automatically |cffe6cc80Remove|r Talking Head Frame and it's talking sound.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if you never want to see nor hear Talking Heads.|r\n"
			,
		},
		header81 = {
			order = 81,
			type = "header",
			name = "\"Auto Requeue\" options",
		},
		LFGDungeonReadyDialogLeaveQueueButton = {
			order = 83,
			name = "|cffe6cc80Decline|r LFR invitation if not leader",
			desc = "Automatically |cffe6cc80Decline|r LFG invitation if not chosen as leader",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton end,
			set = function(_, v) Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description84 = {
			order = 84,
			type = "description",
			name = "Auto |cffe6cc80Decline|r LFR Ready Dialog if not chosen as leader.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if want to always lead LFG PuG raids and never join into ongoing runs.|r"
				.. " |cffe6cc80WARNING!|r|cff9d9d9d Choosing this option can increase your queue time a lot.\n\n|r"
				.. "|cff9d9d9dThis works for LFR queues only, with the exception of fights with one boss only:\n"
				.. " • Rift of Aln (Xavius)\n • Betrayer's Rise (Gul'dan)\n • Deceiver's Fall (Kil'jaeden)\n\n|r"
				.. "|cffe6cc80Purpose|cff9d9d9d: Avoid joining over and over into ongoing groups (ex. from 2nd boss).|r"
			,
		},
		LFGDungeonReadyDialogLeaveQueueButton_desc = {
			order = 85,
			name = "Note about skipped LFR",
			desc = "|cff9d9d9d[|r|cffe6cc80Aye|r|cff9d9d9d]|r Skipped invitation to |cff9d9d9d\"|r|cffe6cc80Your Worst Nightmare|r|cff9d9d9d\"|r group, because not chosen as leader.",
			type = "toggle",
			get = function() return Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton_desc end,
			set = function(_, v) Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton_desc = v end,
			disabled = function() return
					not Aye.db.global.AutoOK.enable
				or	not Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton
			end,
		},
		LFGDungeonReadyDialogLeaveQueueButton_openFrame = {
			order = 86,
			name = "Open frame to requeue",
			desc = "Upon declining the queue, open LFR frame prepared to requeue, requiring you just to click the |cffe6cc80Find Group|r button again.\n\n"
				.. "|cff9d9d9dChoosing this option will always set |r|cffe6cc80Queue|r|cff9d9d9d window to last declined LFR encounter.|r"
			,
			type = "toggle",
			get = function() return Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton_openFrame end,
			set = function(_, v) Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton_openFrame = v end,
			disabled = function() return
					not Aye.db.global.AutoOK.enable
				or	not Aye.db.global.AutoOK.LFGDungeonReadyDialogLeaveQueueButton
			end,
		},
	},
};