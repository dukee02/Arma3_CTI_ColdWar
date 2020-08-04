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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_POL.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

private _tech_level_no_upgrade_inv = 1;
private _tech_level = 0;

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.

if(CTI_MAIN_ADDON == 0) then {
	//Level start	
	if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_pl_army_rifleman_akm_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antitank_akm_rpg7_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antitank_assistant_akm_rpg7_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_demolition_akm_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1gm_pl_army_rifleman_akm_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antitank_akm_rpg7_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antitank_assistant_akm_rpg7_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_demolition_akm_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
		};
		
		_c pushBack format["%1gm_pl_army_rifleman_akm_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_antitank_akm_rpg7_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_antitank_assistant_akm_rpg7_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_demolition_akm_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_crew_pm_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_crew_pm63_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((5*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
	//Level 1
	_tech_level = 1;
	if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_pl_army_machinegunner_rpk_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_machinegunner_pk_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_machinegunner_assistant_akm_pk_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_engineer_akm_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_medic_akm_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_paratrooper_pm63_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
		};
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_pl_army_machinegunner_rpk_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_machinegunner_pk_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_machinegunner_assistant_akm_pk_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_engineer_akm_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_medic_akm_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_paratrooper_pm63_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
		};
		
		_c pushBack format["%1gm_pl_army_machinegunner_rpk_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_machinegunner_pk_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_machinegunner_assistant_akm_pk_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_engineer_akm_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_medic_akm_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_paratrooper_pm63_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_airforce_pilot_pm_80_gry", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
	//Level 2
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_pl_army_marksman_svd_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_squadleader_akm_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_officer_pm_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antitank_akm_fagot_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antiair_akm_9k32m_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			
			_c pushBack format["%1gm_pl_army_sf_antiair_pm63_9k32m_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_antitank_akmn_fagot_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_antitank_akmn_rpg7_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_demolition_pm63_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_engineer_pm63_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_machinegunner_rpk_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_marksman_svd_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_rifleman_akmn_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_rifleman_pm63_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_sf_squadleader_akmn_80_win", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1gm_pl_army_marksman_svd_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_squadleader_akm_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_officer_pm_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antitank_akm_fagot_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
			
			_c pushBack format["%1gm_pl_army_antiair_akm_9k32m_80_autumn_moro", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
			_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 0;
		};
		
		_c pushBack format["%1gm_pl_army_marksman_svd_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_squadleader_akm_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_officer_pm_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_antitank_akm_fagot_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_antiair_akm_9k32m_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
			
		_c pushBack format["%1gm_pl_army_sf_antiair_pm63_9k32m_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_antitank_akmn_fagot_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_antitank_akmn_rpg7_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_demolition_pm63_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_engineer_pm63_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_machinegunner_rpk_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_marksman_svd_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_rifleman_akmn_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_rifleman_pm63_80_moro", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
			
		_c pushBack format["%1gm_pl_army_sf_squadleader_akmn_80_moro", _sid];
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

_tech_level = 0;
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {		
		_c pushBack format["%1gm_gc_civ_p601", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
	};
	
	//Level 1 if RHS is not active, else Level 2	
	//_tech_level = _tech_level + 1;
	if(CTI_RHS_ADDON > 0) then { _tech_level = 2; } else { _tech_level = 1; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		
		_c pushBack format["%1gm_pl_army_ural375d_medic", _sid];
		_p pushBack '';
		_n pushBack (format ["Ural Mobile Respawn - Range %1 m",CTI_RESPAWN_MOBILE_RANGE]);
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_ural4320_cargo", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		//_u pushBack "gm_pl_army_ural4320_reammo";		//Ammotruck
		//_u pushBack "gm_pl_army_ural375d_refuel";		//Fueltruck
		//_u pushBack "gm_pl_army_ural4320_repair";		//Repairtruck
	};	
	
	//Level 1
	_tech_level = 1;
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		_c pushBack format["%1gm_pl_army_brdm2", _sid];				//MG + 2cm
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
	};
	
	//Level 2
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		
		_c pushBack format["%1gm_gc_army_btr60pa", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_gc_army_btr60pu12", _sid];					//HQ
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
	};
	
	//Level 3
	_tech_level = 3;
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
		_c pushBack format["%1gm_pl_army_ot64a", _sid];					//MG + 2cm
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
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
if(CTI_MAIN_ADDON == 0) then {
	//Start
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		
		_c pushBack format["%1gm_pl_army_bmp1sp2", _sid];			
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
		
		_c pushBack format["%1gm_pl_army_zsu234v1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_pt76b", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_t55", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		
		_c pushBack format["%1gm_pl_army_t55a", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_army_t55ak", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((50*CTI_ECONOMY_LEVEL_MULTI)/100);
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
_tech_level = 0;
if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1gm_pl_airforce_mi2ch", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_airforce_mi2p", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_airforce_mi2t", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 1;
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1gm_pl_airforce_mi2sr", _sid];//Medic
		_p pushBack '';
		_n pushBack ("Mi2sr Mobile Respawn");
		_o pushBack ((CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "service-medic";
		_d pushBack 0;	
		
		_c pushBack format["%1gm_pl_airforce_mi2us", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_airforce_mi2urn", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
	};
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1gm_pl_airforce_mi2urp", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_airforce_mi2urpg", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
		
		_c pushBack format["%1gm_pl_airforce_mi2urs", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((60*CTI_ECONOMY_LEVEL_MULTI)/100);
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
if(CTI_MAIN_ADDON == 0) then {
	
	_c pushBack format["%1gm_pl_army_ural4320_repair", _sid];					//Repairtruck
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
if(CTI_MAIN_ADDON == 0) then {	

	_c pushBack format["%1gm_pl_army_ural4320_reammo", _sid];					//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 0;	

	_c pushBack format["%1gm_pl_army_ural375d_refuel", _sid];					//Fueltruck
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
/*_tech_level = 0;
_c pushBack 'O_Boat_Transport_01_F';
_p pushBack '';
_n pushBack '';
_o pushBack 1000;
_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_f pushBack CTI_FACTORY_NAVAL;
_s pushBack "";
_d pushBack 0;
*/
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_POL.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";