private ["_c", "_d", "_m", "_u", "_upgrade_levels_east", "_upgrade_levels_west", "_cntstart", "_cntend"];

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels_east = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", east];
if (isNil "_upgrade_levels_east") then { 
	_upgrade_levels_east = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};
_upgrade_levels_west = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", west];
if (isNil "_upgrade_levels_west") then { 
	_upgrade_levels_west = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};

_c = []; //--- Classname
_d = []; //--- Cathegory
_m = []; //--- Max amount per vehicle.
_u = []; //--- Upgrade level needed.    0 1 2 3...

_ownedDLCs = getDLCs 1;

//*********************************************************************************************************************************************
//														air-to-air missile																	  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
_tech_level = 1;

_c pushBack "PylonMissile_1Rnd_AAA_missiles";			//ASRAAM 			<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_1Rnd_AAA_missiles";				//ASRAAM 			<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_BIM9X_x1";			//BIM 9X AA x1 		<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_Missile_BIM9X_x1";				//BIM 9X AA x1 		<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_Missile_BIM9X_x2";				//BIM 9X AA x2 		<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_AA_R73_x1";			//R73 SR AA x1 		<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_1Rnd_Missile_AA_04_F";		//Falchion-22 		<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_1Rnd_Missile_AA_04_F";			//Falchion-22 		<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_1Rnd_Missile_AA_03_F";		//Sahr-3 			<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_1Rnd_Missile_AA_03_F";			//Sahr-3 			<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>

if(1042220 in _ownedDLCs) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "gm_2rnd_72mm_he_9m32m_gad";					//9M32M 					<HE 9M32M<br />Rounds: 2<br />Used in: Strela-2>
	_c pushBack "gm_2rnd_72mm_he_9m32m_gad_mi2_left";			//9M32M 					<HE 9M32M<br />Rounds: 2<br />Used in: Strela-2>
	_c pushBack "gm_2rnd_72mm_he_9m32m_gad_mi2_right";			//9M32M 					<HE 9M32M<br />Rounds: 2<br />Used in: Strela-2>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M";		//1x AIM-9L Sidewinder 		<AIM-9L Sidewinder missile>
	_c pushBack "CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M";	//1x AIM-9L Sidewinder 		<AIM-9L Sidewinder missile>
	_c pushBack "CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M";	//2x AIM-9L Sidewinder 		<AIM-9L Sidewinder missile>
	_c pushBack "CUP_PylonPod_1Rnd_R73_Vympel";					//1x R-73 Vympel 			<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
};
if(CTI_BW_ADDON > 0) then {
	_c pushBack "Pylonweapon_2Rnd_Fliegerfaust";			//Fliegerfaust 2 Stinger
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-air";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*2****************************************************************************
_tech_level = 2;

_c pushBack "PylonMissile_1Rnd_GAA_missiles";			//Zephyr 			<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_1Rnd_GAA_missiles";				//Zephyr 			<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_AMRAAM_C_x1";			//AMRAAM C AA x1 	<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_Missile_AMRAAM_C_x1";			//AMRAAM C AA x1 	<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_Missile_AMRAAM_C_x2";			//AMRAAM C AA x2 	<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_AMRAAM_D_x1";			//AMRAAM D AA x1 	<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_AMRAAM_D_INT_x1";		//AMRAAM D AA x1 	<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_Missile_AMRAAM_D_x1";			//AMRAAM D AA x1 	<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonRack_Missile_AMRAAM_D_x2";			//AMRAAM D AA x2 	<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_AA_R77_x1";			//R77 MR AA x1 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_AA_R77_INT_x1";		//R77 MR AA x1 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>

if(1042220 in _ownedDLCs) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "CUP_PylonPod_2Rnd_Igla_M";						//2x 9K38 Igla 				<Range: 800-4200 m <br/>Type: ground-air <br/>Used in: 9K32>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M";			//1x AIM-120 AMRAAM 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
	_c pushBack "CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M";			//2x AIM-120 AMRAAM 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
	_c pushBack "CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M";		//1x AIM-120 AMRAAM 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
};
if(CTI_CWR3_ADDON > 0) then {
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-air";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_AA) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_AA, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_AA) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_AA, (_tech_level)];
};

//*********************************************************************************************************************************************
//														air-to-surface missile																  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
_tech_level = 1;

_c pushBack "PylonRack_12Rnd_PG_missiles";				//DAGR 				<Short-range, laser/infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonMissile_1Rnd_LG_scalpel";				//Scalpel 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
_c pushBack "PylonRack_1Rnd_LG_scalpel";				//Scalpel 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
_c pushBack "PylonRack_3Rnd_LG_scalpel";				//Scalpel 3x 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
_c pushBack "PylonRack_4Rnd_LG_scalpel";				//Scalpel 4x 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>

if(1042220 in _ownedDLCs) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "gm_1Rnd_hot_heat_dm72";				//DM72 				<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_hot_heat_dm72_blk";			//DM72 (Black) 		<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_hot_heat_dm72_red";			//DM72 (Red) 		<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_hot_heat_dm72_yel";			//DM72 (Yellow) 	<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_maljutka_heat_9m14_pylon";		//9M14 				<HEAT 9M14<br />Rounds: 1<br />Used in: Maljutka>
	_c pushBack "gm_1Rnd_maljutka_heat_9m14m_pylon";	//9M14M 			<HEAT 9M14M<br />Rounds: 1<br />Used in: Maljutka>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_1Rnd_AGM65_Maverick_M";		//1x AGM-65 Maverick
	_c pushBack "CUP_PylonPod_3Rnd_AGM65_Maverick_M";		//3x AGM-65 Maverick

	_c pushBack "CUP_PylonPod_2Rnd_AT2_M";					//2x 9M17P Falanga-PV 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_4Rnd_Ataka_Empty_M";			//4x 9M120 Ataka 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_2Rnd_Ataka_M";				//2x 9M120 Ataka 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_2Rnd_AT6_M";					//2x 9M114 Shturm 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*2****************************************************************************
_tech_level = 2;

_c pushBack "PylonRack_1Rnd_Missile_AGM_02_F";			//Macer 			<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonRack_3Rnd_Missile_AGM_02_F";			//Macer 3x 			<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonMissile_Missile_AGM_02_x1";			//Macer II AGM x1 	<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonMissile_Missile_AGM_02_x2";			//Macer II AGM x2 	<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonRack_Missile_AGM_02_x1";				//Macer II AGM x1 	<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonRack_Missile_AGM_02_x2";				//Macer II AGM x2 	<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonRack_1Rnd_Missile_AGM_01_F";			//Sharur 			<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonMissile_Missile_AGM_KH25_x1";			//KH25 AGM x1 		<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
_c pushBack "PylonMissile_Missile_AGM_KH25_INT_x1";		//KH25 AGM x1 		<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>

if(1042220 in _ownedDLCs) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "gm_1Rnd_hot_heat_dm102";				//DM102 			<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_blk";			//DM102 (Black) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_red";			//DM102 (Red) 		<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2
	_c pushBack "gm_1Rnd_hot_heat_dm102_yel";			//DM102 (Yellow) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_hornetarrow";	//DM102 (Arrow) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_hornet";		//DM102 (Hornet) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_M";				//2x AGM-114K
	_c pushBack "CUP_PylonPod_4Rnd_AGM114K_Hellfire_II_M";				//4x AGM-114K
	_c pushBack "CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_Plane_M";		//2x AGM-114K

	_c pushBack "CUP_PylonPod_6Rnd_Vikhr_M";							//6x 9K121 Vikhr 	<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_1Rnd_Kh29_M";								//1x Kh-29L 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
};
if(CTI_BW_ADDON > 0) then {
	_c pushBack "Pylonweapon_4Rnd_PARS";					//PARS 3 LR
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*3****************************************************************************
_tech_level = 3;

_c pushBack "PylonMissile_Missile_KH58_x1";								//KH58 ARM x1 		<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_KH58_INT_x1";							//KH58 ARM x1 		<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
_c pushBack "PylonRack_Missile_HARM_x1";								//AGM-88C HARM x1 	<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_HARM_x1";								//AGM-88C HARM x1 	<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
_c pushBack "PylonMissile_Missile_HARM_INT_x1";							//AGM-88C HARM x1 	<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>

if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_2Rnd_AGM114L_Hellfire_II_M";				//2x AGM-114L
	_c pushBack "CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M";				//4x AGM-114L
	_c pushBack "CUP_PylonPod_2Rnd_AGM114L_Hellfire_II_Plane_M";		//2x AGM-114L
};
if(CTI_CWR3_ADDON > 0) then {
	_c pushBack "cwr3_4rnd_tow2_proxy";									//BGM-71C TOW
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_AT) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_AT, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_AT) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_AT, (_tech_level)];
};

//*********************************************************************************************************************************************
//														Unguided rockets																	  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
_tech_level = 1;

_c pushBack "PylonRack_7Rnd_Rocket_04_HE_F";			//Shrieker 7x HE 	<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_7Rnd_Rocket_04_AP_F";			//Shrieker 7x AP 	<Unguided rockets with high-explosive anti-tank warhead>
_c pushBack "PylonRack_12Rnd_missiles";					//DAR 				<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_19Rnd_Rocket_Skyfire";			//Skyfire 19x 		<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_20Rnd_Rocket_03_HE_F";			//Tratnyr 20x HE 	<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_20Rnd_Rocket_03_AP_F";			//Tratnyr 20x AP 	<Unguided rockets with high-explosive anti-tank warhead>

if(1042220 in _ownedDLCs) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_grn";			//S-5 (Green) <HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_bge";			//S-5 (Beige) <HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_gry";			//S-5 (Grey) <HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_blu";			//S-5 (Blue) <HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_oli";			//S-5 (Olive) <HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_grn";			//S-5K (Green) <HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_bge";			//S-5K (Beige) <HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_gry";			//S-5K (Grey) <HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_blu";			//S-5K (Blue) <HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_oli";			//S-5K (Olive) <HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_grn";			//S-5-O (Green) <Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_bge";			//S-5-O (Beige) <Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_gry";			//S-5-O (Grey) <Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_blu";			//S-5-O (Blue) <Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_oli";			//S-5-O (Olive) <Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_7Rnd_Rocket_FFAR_M";		//7x Hydra LAU-68D/A
	_c pushBack "CUP_PylonPod_19Rnd_Rocket_FFAR_M";		//19x Hydra LAU-130A
	_c pushBack "CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M";		//19x Hydra LAU-130A
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_FAT_M";		//19x CRV7 FAT <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_HE_M";		//19x CRV7 HE <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_KEP_M";		//19x CRV7 KEP <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_12Rnd_CRV7_FAT_M";		//12x CRV7 FAT <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_12Rnd_CRV7_HE_M";		//12x CRV7 HE <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_12Rnd_CRV7_KEP_M";		//12x CRV7 KEP <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_FAT_plane_M";		//19x CRV7 FAT <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_HE_plane_M";		//19x CRV7 HE <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_KEP_plane_M";		//19x CRV7 KEP <CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_16Rnd_S5_plane_M";		//16x S5 Rocket <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_32Rnd_S5_plane_M";		//32x S5 UB32 Pod <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_7Rnd_S5_M";		//7x S5 Rocket <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_16Rnd_S5_M";		//16x S5 UB16 Pod <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_32Rnd_S5_M";		//32x S5 UB32 Pod <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8_M";		//20x S8 Rocket <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8_CCIP_M";		//20x S8 Rocket (CCIP) <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8N_M";		//20x S8 Rocket <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8N_CCIP_M";		//20x S8 Rocket (CCIP) <Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8_plane_M";		//20x S8 Rocket <Unguided rockets with high-explosive warhead>
};
if(CTI_BW_ADDON > 0) then {
	_c pushBack "Pylonweapon_19Rnd_FZRockets";				//FZ71
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};

//*********************************************************************************************************************************************
//														bomb																				  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
_tech_level = 1;

_c pushBack "PylonMissile_1Rnd_Mk82_F";					//Mk82 					<500lb, high-explosive, unguided bomb>
_c pushBack "PylonMissile_1Rnd_Bomb_04_F";				//GBU-12 				<500lb, high-explosive, laser-guided bomb>
_c pushBack "PylonMissile_Bomb_GBU12_x1";				//GBU 12 LGB x1 		<500lb, high-explosive, laser-guided bomb>
_c pushBack "PylonRack_Bomb_GBU12_x2";					//GBU 12 LGB x2 		<500lb, high-explosive, laser-guided bomb>
_c pushBack "PylonRack_4Rnd_BombDemine_01_F";			//Demining Charge <500 g, Crovex water-gel, special-purpose demining explosive>
_c pushBack "PylonRack_4Rnd_BombDemine_01_Dummy_F";		//Demining Charge (Dummy) <Non-lethal pyrotechnic charge for demonstration purposes>

if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_1Rnd_Mk82_M";				//1x Mk82
	_c pushBack "CUP_PylonPod_2Rnd_Mk82_M";				//2x Mk82
	_c pushBack "CUP_PylonPod_3Rnd_Mk82_M";				//3x Mk82
	_c pushBack "CUP_PylonPod_1Rnd_GBU12_M";			//1x GBU-12 Paveway II
	_c pushBack "CUP_PylonPod_2Rnd_GBU12_M";			//2x GBU-12 Paveway II
	_c pushBack "CUP_PylonPod_3Rnd_GBU12_M";			//3x GBU-12 Paveway II
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*2****************************************************************************
_tech_level = 2;

_c pushBack "PylonMissile_1Rnd_Bomb_03_F";				//LOM-250G 				<565lb, high-explosive, laser-guided bomb>
_c pushBack "PylonMissile_Bomb_KAB250_x1";				//KAB 250 LGB x1 		<565lb, high-explosive, laser-guided bomb>
_c pushBack "PylonMissile_1Rnd_BombCluster_03_F";		//BL778 Cluster x1 		<580lb, laser-guided cluster bomb>
_c pushBack "PylonRack_2Rnd_BombCluster_03_F";			//BL778 Cluster x2 		<580lb, laser-guided cluster bomb>
_c pushBack "PylonMissile_1Rnd_BombCluster_01_F";		//CBU-85 Cluster x1 	<750lb, laser-guided cluster bomb>
_c pushBack "PylonRack_2Rnd_BombCluster_01_F";			//CBU-85 Cluster x2 	<750lb, laser-guided cluster bomb>
_c pushBack "PylonMissile_1Rnd_BombCluster_02_F";		//RBK-500F Cluster x1 	<1100lb, laser-guided cluster bomb>
_c pushBack "PylonMissile_1Rnd_BombCluster_02_cap_F";	//RBK-500F Cluster x1 	<1100lb, laser-guided cluster bomb>

if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_1Rnd_FAB250_M";				//1x FAB250
	_c pushBack "CUP_PylonPod_1Rnd_FAB250_plane_M";			//1x FAB-250
	_c pushBack "CUP_PylonPod_1Rnd_KAB250_M";				//1x KAB-250L
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*3****************************************************************************
_tech_level = 3;

_c pushBack "PylonRack_Bomb_SDB_x4";						//GBU SDB x4 				<250lb, high-explosive, infrared/laser-guided bomb>

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*4****************************************************************************
if(CTI_CWR3_ADDON > 0) then {
	_tech_level = 4;

	_c pushBack "cwr3_PylonMissile_1Rnd_B61";				//B-61 Nuclear Bomb 		<1kt, nuclear glide bomb>
	_c pushBack "cwr3_PylonMissile_1Rnd_RN28";				//RN-28 Nuclear Bomb 		<1kt, nuclear glide bomb>

	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "bomb";
		_m pushBack 1;
		_u pushBack _tech_level;
	};
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};

//*********************************************************************************************************************************************
//														weapon pod																		  *
//*********************************************************************************************************************************************

_c pushBack "PylonWeapon_2000Rnd_65x39_belt";		//Minigun 6.5 mm <6.5mm gatling gun>
_c pushBack "PylonWeapon_300Rnd_20mm_shells";		//Twin Cannon 20mm <20mm twin-cannon weapon pod>

if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_1200Rnd_TE1_Red_Tracer_GAU19L_M";					//GAU-19/A
	_c pushBack "CUP_PylonPod_1200Rnd_TE1_Red_Tracer_GAU19R_M";					//GAU-19/A
	_c pushBack "CUP_PylonWeapon_220Rnd_TE1_Red_Tracer_GAU22_M";				//GAU-22/A
	_c pushBack "CUP_PylonPod_2000Rnd_TE5_Red_Tracer_762x51_M134A_M";			//M134
	_c pushBack "CUP_PylonPod_1200Rnd_TE1_Red_Tracer_M621_20mm_HE_M";			//M621 Cannon Pod
	_c pushBack "CUP_PylonPod_1200Rnd_TE1_Red_Tracer_30x113mm_M789_HEDP_M";		//M230 Chaingun Pod
	_c pushBack "CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M";		//GSh-23L
};
if(CTI_BW_ADDON > 0) then {
	_c pushBack "Pylonweapon_400Rnd_127x99";				//HMP 400
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "weapon pod";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*********************************************************************************************************************************************
//														special-purpose																		  *
//*********************************************************************************************************************************************

if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_ANAAQ_28";			//1x AN/AAQ-28 					<Batteries for Laser Designator<br />Does not fit into NVG<br />Recycle after use.>
	_c pushBack "CUP_PylonPod_ALQ_131";				//1x AN/ALQ 131 Jammer Pod 		<>
	_c pushBack "CUP_PylonPod_CMFlare_Chaff";		//Flare-Chaff Launcher
	_c pushBack "CUP_PylonPod_CMFlare";				//Flare Launcher
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "special-purpose";
	_m pushBack 100;
	_u pushBack _tech_level;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["pylons declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_c, _d, _m, _u] call compile preprocessFileLineNumbers "Common\Config\pylons\Set_Pylons.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", east], _upgrade_levels_east];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["calculated upgrade levels for %1: [%2] ", east, _upgrade_levels_east]] call CTI_CO_FNC_Log};
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", west], _upgrade_levels_west];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["calculated upgrade levels for %1: [%2] ", west, _upgrade_levels_west]] call CTI_CO_FNC_Log};
