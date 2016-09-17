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
			name = "Automatically |cffe6cc80Accept|r chosen invitations, respond |cffe6cc80OK|r to chosen dialogs, etc.",
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
			name = "LFGListInviteDialog",
			desc = "Automatically Accept and Acknowledge LFGListInviteDialog",
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
			name = "LFDRoleCheckPopupAcceptButton",
			desc = "Automatically click LFDRoleCheckPopupAcceptButton OnShow",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.LFDRoleCheckPopupAcceptButton end,
			set = function(_, v) Aye.db.global.AutoOK.LFDRoleCheckPopupAcceptButton = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description17 = {
			order = 17,
			type = "description",
			name = "Auto |cffe6cc80Accept role|r on LFD Role Check Pupup.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if your role does not change.|r",
		},
		DisableTypeDELETEtoConfirm = {
			order = 19,
			name = "Disable \"Type DELETE into the field to confirm.\"",
			desc = "Automatically disables \"Type DELETE into the field to confirm.\" confirmation.",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.DisableTypeDELETEtoConfirm end,
			set = function(_, v)
				Aye.db.global.AutoOK.DisableTypeDELETEtoConfirm = v;
				Aye.modules.AutoOK.CheckTypeDELETEtoConfirm();
			end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description20 = {
			order = 20,
			type = "description",
			name = "|cffe6cc80Disable|r \"Type DELETE into the field to confirm.\" confirmation.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if you always read carefully what item are you destroying.|r"
			,
		},
		CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL = {
			order = 22,
			name = "CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL",
			desc = "Automatically click CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL OnShow",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL end,
			set = function(_, v) Aye.db.global.AutoOK.CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description23 = {
			order = 23,
			type = "description",
			name = "Auto |cffe6cc80Accept|r selling items that |cff9d9d9d\"will make it non-tradeable, even if you buy it back\"|r.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if you always read carefully what item are you selling.|r"
			,
		},
		cameraDistanceMaxFactor = {
			order = 25,
			name = "Set Camera Distance Max Factor to Maximum",
			desc = "Automatically Set cameraDistanceMaxFactor CVAR to Maximum (2.6)",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.cameraDistanceMaxFactor end,
			set = function(_, v) Aye.db.global.AutoOK.cameraDistanceMaxFactor = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description26 = {
			order = 26,
			type = "description",
			name = "Automatically set |cffe6cc80cameraDistanceMaxFactor|r CVAR to |cffe6cc802.6|r (max).\n"
				.. "This allows to Zoom Out Camera to maximum allowed distance."
			,
		},
		TALKINGHEAD_REQUESTED = {
			order = 28,
			name = "Remove Talking Head",
			desc = "Automatically remove Talking Head",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.TALKINGHEAD_REQUESTED end,
			set = function(_, v) Aye.db.global.AutoOK.TALKINGHEAD_REQUESTED = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description29 = {
			order = 29,
			type = "description",
			name = "Automatically remove Talking Head Frame and it's talking sound.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if you never ever want to see nor hear Talking Head Frames.|r"
			,
		},
		LFGListApplicationDialog = {
			order = 31,
			name = "LFGListApplicationDialog",
			desc = "Automatically accept LFGListApplicationDialog, leaving empty description",
			type = "toggle",
			width = "full",
			get = function() return Aye.db.global.AutoOK.LFGListApplicationDialog end,
			set = function(_, v) Aye.db.global.AutoOK.LFGListApplicationDialog = v end,
			disabled = function() return not Aye.db.global.AutoOK.enable end,
		},
		description32 = {
			order = 32,
			type = "description",
			name = "Auto |cffe6cc80Accept application|r to custom group, leaving empty description.\n"
				.. "|cffe6cc80Recommendation|r|cff9d9d9d: Enable only if your never describe your custom group applications.|r",
		},
	},
};