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
		header11 = {
			order = 11,
			type = "header",
			name = "\"Auto OK\" options",
		},
		LFGListInviteDialog = {
			order = 13,
			name = "LFGListInviteDialog.AcknowledgeButton",
			desc = "Automatically click LFGListInviteDialog.AcknowledgeButton OnShow",
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
	},
};