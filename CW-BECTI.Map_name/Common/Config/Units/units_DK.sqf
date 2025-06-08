private ["_side", "_faction", "_sid", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

_side = _this;
_sid = "";
_building_time = 10;

switch (_side) do {
	case west: {/*_sid = "VIOC_B_";*/_faction = "West";};
	case east: {/*_sid = "VIOC_O_";*/_faction = "East";};
	case resistance: {/*_sid = "VIOC_I_";*/_faction = "Resistance";};
	default {_sid = "";_faction = "";};
};

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_DK.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
if(CTI_MAIN_ADDON == 0) then {//Level start
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>50): {50}; default {_time}};
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_dk_army_demolition_gvm95_90_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_assistant_gvm95_mg3_90_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_mg3_90_win", _sid];
			_c pushBack format["%1gm_dk_army_rifleman_gvm95_90_win", _sid];
			_c pushBack format["%1gm_dk_army_demolition_g3a4_84_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_assistant_g3a3_mg3_84_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_mg3_84_win", _sid];
			_c pushBack format["%1gm_dk_army_rifleman_g3a3_84_win", _sid];
		};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1gm_dk_army_crew_84_oli", _sid];
		_c pushBack format["%1gm_dk_army_demolition_g3a4_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_assistant_g3a3_mg3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_mg3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_rifleman_g3a3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_demolition_gvm95_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_assistant_gvm95_mg3_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_mg3_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_rifleman_gvm95_90_m84", _sid];
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		_price_unit = [CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _price_unit;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 5;	
		};
	};
	//Level 1
	_tech_level = _tech_level + 1;
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>50): {50}; default {_time}};
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_dk_army_antitank_assistant_gvm95_pzf84_90_win", _sid];
			_c pushBack format["%1gm_dk_army_antitank_gvm95_pzf84_90_win", _sid];
			_c pushBack format["%1gm_dk_army_antitank_assistant_g3a3_pzf84_84_win", _sid];
			_c pushBack format["%1gm_dk_army_antitank_g3a3_pzf84_84_win", _sid];
			_c pushBack format["%1gm_dk_army_medic_g3a3_84_win", _sid];
		};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1gm_dk_army_antitank_assistant_g3a3_pzf84_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_antitank_g3a3_pzf84_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_medic_g3a3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_antitank_assistant_gvm95_pzf84_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_antitank_gvm95_pzf84_90_m84", _sid];
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		_price_unit = [CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _price_unit;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 5;	
		};
	};
	//Level 2
	_tech_level = _tech_level + 1;
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>50): {50}; default {_time}};
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_dk_army_marksman_g3a3_90_win", _sid];
			_c pushBack format["%1gm_dk_army_squadleader_gvm95_p2a1_90_win", _sid];
			_c pushBack format["%1gm_dk_army_squadleader_g3a3_p2a1_84_win", _sid];
		};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1gm_dk_army_squadleader_g3a3_p2a1_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_marksman_g3a3_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_squadleader_gvm95_p2a1_90_m84", _sid];
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		_price_unit = [CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _price_unit;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_BARRACKS;
			_s pushBack "";
			_d pushBack 5;	
		};
	};
};


//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_tech_level = 0;
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time};};
	if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {		
		_c pushBack format["%1gm_ge_civ_typ1200", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
	};
	/*_tech_level = 0;
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/10);
		_t pushBack ((10*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
		
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/5);
		_t pushBack ((15*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
		
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
		
		//_u pushBack "";		//repairtruck	
	};
	//Level 1
	_tech_level = _tech_level + 1;
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
		
		_c pushBack format["%1", _sid];					//medic
		_p pushBack '';
		_n pushBack (format ["5t Mobile Respawn - Range %1 m",CTI_RESPAWN_MOBILE_RANGE]);
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((20*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;
		
		//_u pushBack "";		//ammotruck
		//_u pushBack "";		//fueltruck
	};
	//Level 2
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;			
	};
	//Level 3
	_tech_level = 3;
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
	};*/
};


//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
if(CTI_MAIN_ADDON == 0) then {
	//Level 0
	_tech_level = 0;
	_time = (20*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<20): {20}; case (_time>600): {600}; default {_time}};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1gm_dk_army_m113a1dk_command", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;
		
		_c pushBack format["%1gm_dk_army_m113a1dk_engineer", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;
		
		_c pushBack format["%1gm_dk_army_m113a1dk_medic", _sid];						//medic
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'M113 Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'M113 Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "service-medic";
		_d pushBack 10;
		
		_c pushBack format["%1gm_dk_army_m113a1dk_apc", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;		
	};
	//Level 1
	_tech_level = _tech_level + 1;
	_time = (20*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<20): {20}; case (_time>600): {600}; default {_time}};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1gm_dk_army_m113a2dk", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;
	};
	//Level 2
	_tech_level = _tech_level + 1;
	_time = (20*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<20): {20}; case (_time>600): {600}; default {_time}};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		
		_c pushBack format["%1gm_dk_army_Leopard1a3", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;			
	};
};


//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*
if(CTI_MAIN_ADDON == 0) then {
	_tech_level = 0;
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;		
	};
	_tech_level = 1;
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;
		
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;
		
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack 'do28d2 Mobile Respawn';
		_o pushBack ((CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "service-medic";
		_d pushBack 10;
	};
	_tech_level = 2;
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack ((40*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;
	};
};*/


//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
if(CTI_MAIN_ADDON == 0) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time};};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active	
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1gm_dk_army_bpz2a0", _sid];							//Repair
		_p pushBack '';
		_n pushBack 'Bergepanzer';
		_o pushBack 2*(CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 10;
	};
};


//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*if(CTI_MAIN_ADDON == 0) then {
	//if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//};
		_c pushBack format["%1", _sid];					//Ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
		_d pushBack 10;	

		_c pushBack format["%1", _sid];					//Fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 10;	
	//};
};*/


//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_tech_level = 0;
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1B_Boat_Transport_01_F", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack 1000;
	_t pushBack ((30*CTI_ECONOMY_LEVEL_MULTI)/100);
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_NAVAL;
	_s pushBack "";
	_d pushBack 10;
};*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_DK.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";