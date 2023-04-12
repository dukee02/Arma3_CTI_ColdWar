private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_REDD.sqf", format["setting up factory units for side %1, loading base units -> %2", _side, _setupBaseUnits]] call CTI_CO_FNC_Log;};

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid], []], 
		[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid], []]
	]];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid], []], 
		[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid], []]
	]];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid], []], 
		[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid], []]
	]];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_REDD.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
