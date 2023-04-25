private ["_faction", "_side"];

_side = _this;
_faction = "West";
if (_side isEqualTo east) then {
	_faction = "East";
};

//--- Templates (Those lines can be generated in the RPT on purchase by uncommenting the diag_log in Events_UI_GearMenu.sqf >> "onPurchase").
_t = [];

// Vanilla templates
//deactivated for the moment, maybe will come back later
//if (_side isEqualTo west) then {		//West Gear
//_t = _t 	+ [[[["arifle_SPAR_01_blk_F",[],["30Rnd_556x45_Stanag_Tracer_Yellow"]]],[["U_B_T_Soldier_F",["Medikit","Medikit"]],["V_BandollierB_rgr",["HandGrenade","HandGrenade"]],["B_AssaultPack_mcamo",["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"]]],["H_HelmetB_light",""],[[],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
//} else {								//East Gear
//_t = _t 	+ [[[["arifle_CTAR_blk_F",[],["30Rnd_580x42_Mag_Tracer_F"]]],[["U_O_CombatUniform_ocamo",["Medikit","Medikit"]],["V_BandollierB_cbr", ["HandGrenade","HandGrenade"]],["B_AssaultPack_ocamo", ["30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_Tracer_F"]]],["H_HelmetO_ocamo",""],[[],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
//};

if(CTI_CWR3_ADDON >= 0) then {
	if (_side isEqualTo west) then {		//West Gear
		_t = _t 	+ [[[["CUP_arifle_M16A1",["","","",""],["CUP_30Rnd_556x45_Stanag"]]],[["cwr3_b_uniform_m81_woodland_early",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["cwr3_b_vest_alice_etool",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["",[]]],["cwr3_b_headgear_m1_woodland_army_early",""],[["", ""],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
	} else {								//East Gear
		switch(CTI_CAMO_ACTIVATION) do {
			case 2;
			case 4: {//desert/urban camo active
				_t = _t 	+ [[[["CUP_arifle_AK74",["","","",""],["CUP_30Rnd_545x39_AK_M"]],["",[],[""]],["",[],[""]]],[["cwr3_o_uniform_m1969",["firstaidkit","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],["cwr3_o_vest_beltkit_ak74",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],["",[]]],["cwr3_o_headgear_ssh68",""],[["", "binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			default {//main camo active
				_t = _t 	+ [[[["CUP_arifle_AK74",["","","",""],["CUP_30Rnd_545x39_AK_M"]],["",[],[""]],["",[],[""]]],[["cwr3_o_uniform_klmk_1957_birch_v1",["firstaidkit","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],["cwr3_o_vest_beltkit_ak74",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],["",[]]],["cwr3_o_headgear_ssh68",""],[["", "binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
		};
	};
};
if(CTI_CUP_ADDON > 0) then {
	if (_side isEqualTo west) then {		//West Gear
		//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
		switch(CTI_CAMO_ACTIVATION) do {
			//case 1: {};
			case 2: {//Desert
				_t = _t 	+ [[[["CUP_arifle_M4A3_black",["","CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top",""],["CUP_30Rnd_556x45_Stanag"]]],[["CUP_U_B_USMC_MCCUU_des_gloves",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["CUP_V_B_Eagle_SPC_Patrol",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["",[]]],["CUP_H_LWHv2_MARPAT_des_cov_fr",""],[["", "CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			case 3: {//Jungle
				_t = _t 	+ [[[["CUP_arifle_M4A3_black",["","CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top",""],["CUP_30Rnd_556x45_Stanag"]]],[["CUP_U_B_USMC_MCCUU_gloves",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["CUP_V_B_Eagle_SPC_Patrol",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["",[]]],["CUP_H_LWHv2_MARPAT_cov_fr",""],[["", "CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			case 4: {//Urban US
				_t = _t 	+ [[[["CUP_arifle_M4A3_black",["","CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top",""],["CUP_30Rnd_556x45_Stanag"]]],[["CUP_U_B_USArmy_ACU_Kneepad_Gloves_UCP",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["CUP_V_B_IOTV_UCP_Rifleman_USArmy",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["",[]]],["CUP_H_USArmy_HelmetACH_UCP",""],[["", "CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			//case 5: {};
			case 6: {//multi light
				_t = _t 	+ [[[["CUP_arifle_M4A3_black",["","CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top",""],["CUP_30Rnd_556x45_Stanag"]]],[["CUP_U_B_USArmy_ACU_Gloves_OCP",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["CUP_V_B_IOTV_OCP_Rifleman_Deltoid_USArmy",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["",[]]],["CUP_H_USArmy_HelmetACH_OCP",""],[["", "CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			default {//multi dark
				_t = _t 	+ [[[["CUP_arifle_M4A3_black",["","CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top",""],["CUP_30Rnd_556x45_Stanag"]]],[["CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["CUP_V_B_IOTV_OEFCP_Rifleman_USArmy",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["",[]]],["CUP_H_USArmy_HelmetACH_OEFCP",""],[["", "CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
		};
	} else {								//East Gear
		//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {
				};
			case 2: {
				_t = _t 	+ [[[["CUP_arifle_AK12_black",["","CUP_optic_1P87_RIS","",""],["CUP_30Rnd_545x39_AK12_M"]],["",[],[""]],["",[],[""]]],[["CUP_U_O_RUS_Ratnik_Desert",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["",[]]],["CUP_H_RUS_6B47_v2_GogglesUp_Desert",""],[["", "binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			case 3: {
				_t = _t 	+ [[[["CUP_arifle_AK12_black",["","CUP_optic_1P87_RIS","",""],["CUP_30Rnd_545x39_AK12_M"]],["",[],[""]],["",[],[""]]],[["CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_gloves_pads",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["",[]]],["CUP_H_RUS_6B47_v2_GogglesUp_Summer",""],[["", "binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			case 4: {
				_t = _t 	+ [[[["CUP_arifle_AK12_black",["","CUP_optic_1P87_RIS","",""],["CUP_30Rnd_545x39_AK12_M"]],["",[],[""]],["",[],[""]]],[["CUP_U_O_RUS_Ratnik_Autumn",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["",[]]],["CUP_H_RUS_6B47_v2_GogglesUp_Summer",""],[["", "binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			//case 5: {};
			case 6: {
				_t = _t 	+ [[[["CUP_arifle_AK12_black",["","CUP_optic_1P87_RIS","",""],["CUP_30Rnd_545x39_AK12_M"]],["",[],[""]],["",[],[""]]],[["CUP_U_O_RUS_Ratnik_BeigeDigital",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["",[]]],["CUP_H_RUS_6B47_v2_GogglesUp_BeigeDigital",""],[["", "binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			default {
				_t = _t 	+ [[[["CUP_arifle_AK12_black",["","CUP_optic_1P87_RIS","",""],["CUP_30Rnd_545x39_AK12_M"]],["",[],[""]],["",[],[""]]],[["CUP_U_O_RUS_Ratnik_Summer",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],["",[]]],["CUP_H_RUS_6B47_v2_GogglesUp_Summer",""],[["", "binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
		};
	};
};


/*
_t = _t 	+ [
	[
		[
			["arifle_SPAR_01_blk_F",[],["30Rnd_556x45_Stanag_Tracer_Yellow"]],
			["",[],[""]],
			["",[],[""]]
		],
		[
			["U_B_T_Soldier_F",["firstaidkit","firstaidkit"]],
			["V_BandollierB_rgr",["MiniGrenade","HandGrenade"]],
			["B_AssaultPack_mcamo",["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"]]
		],
		["H_HelmetB_light",""],
		[
			["", "binocular"],
			["itemmap","","itemradio","ItemCompass","ItemWatch"]
		]
	]
];
*/

[_faction, _t] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Template_Set.sqf"; 	