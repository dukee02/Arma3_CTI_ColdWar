/*
format["%1<vanilla_unitname>", _sid] gets used later 4 the upcomming sidepatch
format["%1", _sid]; - 4 copy paste
*/
_side = _this;
_faction = "";
_sid = "";

if(_side == west) then {
	//_sid = "VIOC_B_";
	_faction = "West";
} else {
	if(_side == east) then {
		//_sid = "VIOC_O_";
		_faction = "East";
	} else {
		//_sid = "VIOC_I_";
		_faction = "Resistance";
	};
};

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

private _tech_level_no_upgrade_inv = 1;
private _tech_level = 0;

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
if(CTI_CUP_ADDON > 0) then {
	//VDV_EMR = green camo - VDV = brown camo
	//Level 0 (Level 3 with CW)
	if(CTI_MAIN_ADDON == 0) then { _tech_level = 3; } else { _tech_level = 0; };
	if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1CUP_O_RU_Soldier_AR_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_Light_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Crew_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_Saiga_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_GL_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_AT_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Explosive_Specialist_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		
		_c pushBack format["%1CUP_O_RU_Soldier_AR_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_Light_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Crew_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_Saiga_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_GL_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_AT_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Explosive_Specialist_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
	
	//Level 1 (Level 4 with CW)
	_tech_level = _tech_level+1;
	if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1CUP_O_RU_Soldier_AA_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_MG_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Engineer_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Medic_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Spotter_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Officer_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Pilot_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;

		
		_c pushBack format["%1CUP_O_RU_Soldier_AA_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_MG_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Engineer_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;	
		
		_c pushBack format["%1CUP_O_RU_Medic_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;	
		
		_c pushBack format["%1CUP_O_RU_Spotter_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Officer_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Pilot_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
	
	//Level 2 (Level 5 with CW)
	_tech_level = _tech_level+1;
	if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Sniper_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Sniper_KSVK_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_SL_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_TL_VDV_EMR", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Sniper_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Sniper_KSVK_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Commander_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_SL_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_RU_Soldier_TL_VDV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
	
};

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
if(CTI_CUP_ADDON == 1) then {
	_tech_level = 0;
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_UAZ_Unarmed_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_UAZ_Open_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_UAZ_AMB_RU", _sid];			//Medic
		_p pushBack '';
		_n pushBack (format ["UAZ Mobile Respawn - Range %1 m",CTI_RESPAWN_MOBILE_RANGE]);
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 0;
	};
	_tech_level = 1;
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_UAZ_AGS30_RU", _sid];					//GMG
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_UAZ_MG_RU", _sid];						//MG
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_UAZ_SPG9_RU", _sid];					//SPG (AT)
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_UAZ_METIS_RU", _sid];					//Metris (ATGM)
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BRDM2_RUS", _sid];					//MG + 2cm
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BRDM2_ATGM_RUS", _sid];				//4x ATGM
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BRDM2_HQ_RUS", _sid];				//MG
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;				
	};
	
	if(CTI_RHS_ADDON > 0) then { _tech_level = 2; } else { _tech_level = 1; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_Ural_Open_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Ural_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Ural_Empty_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Ural_ZU23_RU", _sid];				//Flak
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BM21_RU", _sid];					//Artytruck
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;		
		
		//_u pushBack "CUP_O_Ural_Reammo_RU";			//Ammotruck
		//_u pushBack "CUP_O_Ural_Refuel_RU";			//Fueltruck
		//_u pushBack "CUP_O_Ural_Repair_RU";			//Repairtruck
	};
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CUP_O_BTR60_Winter_RU", _sid];			//2cm + MG
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "";
			_d pushBack 0;
		};
		
		_c pushBack format["%1CUP_O_BTR60_RU", _sid];						//2cm + MG
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BTR60_Green_RU", _sid];					//2cm + MG
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid];				//MG front + rear
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid];				//GMG + rear MG
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid];				//3cm Cannon
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_GAZ_Vodnik_MedEvac_RU", _sid];		//Medic
		_p pushBack '';
		_n pushBack (format ["GAZ-Vodnik Mobile Respawn - Range %1 m",CTI_RESPAWN_MOBILE_RANGE]);
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 0;
	};
	_tech_level = 3;
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_Kamaz_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Kamaz_Open_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		//_u pushBack "CUP_O_Kamaz_Reammo_RU";			//Ammotruck
		//_u pushBack "CUP_O_Kamaz_Refuel_RU";			//Fueltruck
		//_u pushBack "CUP_O_Kamaz_Repair_RU";			//Repairtruck
	};
	
	if(CTI_RHS_ADDON > 0) then { _tech_level = 5; } else { _tech_level = 3; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_BTR90_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BTR90_HQ_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
	};

};

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
//Level 0
_tech_level = 0;
if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_BMP2_RU", _sid];				//2cm + Metris(ATGM)
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;			
	};
	_tech_level = 1;
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_BMP2_AMB_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BMP_HQ_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CUP_O_MTLB_pk_Winter_RU", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 0;
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CUP_O_MTLB_pk_Green_RU", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 0;
		};
		_c pushBack format["%1CUP_O_MTLB_pk_WDL_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_BMP3_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 3;
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_T72_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 4;
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_2S6_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((70*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_2S6M_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((70*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 5;
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_T90_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((80*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};

};

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
if(CTI_CUP_ADDON > 0) then {
	_tech_level = 0;
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_Mi8_VIV_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Mi8_medevac_RU", _sid];					//Medic
		_p pushBack '';
		_n pushBack (format ["Mi8 Mobile Respawn - Range %1 m",CTI_RESPAWN_MOBILE_RANGE]);
		_o pushBack ((CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "service-medic";
		_d pushBack 0;		
	};
	_tech_level = 1;
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_Mi8_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_Mi24_P_Dynamic_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Mi24_V_Dynamic_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Su25_Dyn_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;		
	};
	_tech_level = 3;
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_Ka50_DL_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((70*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_Ka60_Grey_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((70*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1CUP_O_SU34_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((70*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 4;
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		
		_c pushBack format["%1CUP_O_Ka52_RU", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((80*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
	};
};

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
if(CTI_CUP_ADDON > 0) then {
		
	_c pushBack format["%1CUP_O_Ural_Repair_RU", _sid];				//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 0;
	
	if(CTI_MAIN_ADDON == 1) then {
		_c pushBack format["CTI_Salvager_%1", _faction];
		_p pushBack '';
		_n pushBack 'Salvager Truck';
		_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack [format["%1CUP_O_Ural_Empty_RU", _sid],"salvager"];
		_d pushBack 0;
			
		_c pushBack format["CTI_Salvager_Independent_%1", _faction];
		_p pushBack '';
		_n pushBack 'Salvager Truck';
		_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack [format["%1CUP_O_Ural_Empty_RU", _sid],"salvager-independent"];
		_d pushBack 0;		
	};

	_tech_level = 3;	
	_c pushBack format["%1CUP_O_Kamaz_Repair_RU", _sid];			//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 0;
};

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_tech_level = 0;
if(CTI_CUP_ADDON > 0) then {

	_c pushBack format["%1CUP_O_Ural_Reammo_RU", _sid];					//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 0;	

	_c pushBack format["%1CUP_O_Ural_Refuel_RU", _sid];					//Fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 0;

	_tech_level = 3;
	_c pushBack format["%1CUP_O_Kamaz_Reammo_RU", _sid];			//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 0;	

	_c pushBack format["%1CUP_O_Kamaz_Refuel_RU", _sid];			//Fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 0;		
};

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;
/*_c pushBack 'O_Boat_Transport_01_F';
_p pushBack '';
_n pushBack '';
_o pushBack 1000;
_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_f pushBack CTI_FACTORY_NAVAL;
_s pushBack "";
_d pushBack 0;*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";