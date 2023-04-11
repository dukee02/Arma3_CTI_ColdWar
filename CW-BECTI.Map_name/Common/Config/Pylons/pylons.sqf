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

if(1042220 in _ownedDLCs && CTI_GM_DLC > 0) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
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
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_R27T";					//R-27T 				<Infrared homing. Locking radius: ±7.5° off-boresight. Range: 1.7km-22km>
	_c pushBack "rhs_mag_R27T_APU470";			//R-27T 				<Infrared homing. Locking radius: ±7.5° off-boresight. Range: 1.7km-22km>
	_c pushBack "rhs_mag_R27ET";				//R-27ET 				<Infrared homing. Locking radius: ±7.5° off-boresight. Range: 1.7km-26km>
	_c pushBack "rhs_mag_R27ET_APU470";			//R-27ET 				<Infrared homing. Locking radius: ±7.5° off-boresight. Range: 1.7km-26km>
	_c pushBack "rhs_mag_R60";					//R-60 					<Infrared homing. Locking radius: ±12° off-boresight. Range: 0.3km-5km>
	_c pushBack "rhs_mag_R60_APU60";			//R-60 					<Infrared homing. Locking radius: ±12° off-boresight. Range: 0.3km-5km>
	_c pushBack "rhs_mag_R60M";					//R-60M 				<Infrared homing. Locking radius: ±17° off-boresight. Range: 0.3km-8km>
	_c pushBack "rhs_mag_R60M_APU60";			//R-60M 				<Infrared homing. Locking radius: ±17° off-boresight. Range: 0.3km-8km>
	_c pushBack "rhs_mag_R73";					//R-73 					<Infrared homing. Locking radius: ±25° off-boresight. Range: 0.3km-8km>
	_c pushBack "rhs_mag_R73_APU73";			//R-73 					<Infrared homing. Locking radius: ±25° off-boresight. Range: 0.3km-8km>
	_c pushBack "rhs_mag_R73M";					//R-73M 				<Infrared homing. Locking radius: ±60° off-boresight. Range: 0.15km-8km>
	_c pushBack "rhs_mag_R73M_APU73";			//R-73M 				<Infrared homing. Locking radius: ±60° off-boresight. Range: 0.15km-8km>
	_c pushBack "rhs_mag_R74";					//R-74 					<Infrared homing missile with improved CM resistance. Locking radius: ±60° off-boresight. Range: 0.15km-8km>
	_c pushBack "rhs_mag_R74_APU73";			//R-74 					<Infrared homing missile with improved CM resistance. Locking radius: ±60° off-boresight. Range: 0.15km-8km>
	_c pushBack "rhs_mag_R74M2";				//R-74M2 				<Infrared homing. Locking radius: ±75° off-boresight. Range: 0.15km-8km>
	_c pushBack "rhs_mag_R74M2_int";			//R-74M2 				<Infrared homing. Locking radius: ±75° off-boresight. Range: 0.15km-8km>
	_c pushBack "rhs_mag_Sidewinder";			//AIM-9X 				<Sidewinder, IR-homing>
	_c pushBack "rhs_mag_aim9m";				//AIM-9M 				<Sidewinder, IR-homing>
	_c pushBack "rhs_mag_Sidewinder_int";		//AIM-9X 				<Sidewinder, IR-homing>
	_c pushBack "rhs_mag_aim9m_int";			//AIM-9M 				<Sidewinder, IR-homing>
	_c pushBack "rhs_mag_Sidewinder_2";			//AIM-9X (LAU-114/A) 	<×2 Sidewinder, IR-homing>
	_c pushBack "rhs_mag_aim9m_2";				//AIM-9M (LAU-114/A) 	<×2 Sidewinder, IR-homing>
	_c pushBack "rhs_mag_Sidewinder_heli";		//AIM-9M 				<Sidewinder, IR-homing>
	_c pushBack "rhs_mag_Sidewinder_heli_2";	//AIM-9M 				<Sidewinder, IR-homing>
	_c pushBack "rhs_mag_ATAS_2";				//ATAS 					<×2 Stinger, IR-homing>
	_c pushBack "rhs_mag_ATAS_AH64_2";			//ATAS 					<×2 Stinger, IR-homing>
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

if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_2Rnd_Igla_M";						//2x 9K38 Igla 				<Range: 800-4200 m <br/>Type: ground-air <br/>Used in: 9K32>
	_c pushBack "CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M";			//1x AIM-120 AMRAAM 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
	_c pushBack "CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M";			//2x AIM-120 AMRAAM 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
	_c pushBack "CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M";		//1x AIM-120 AMRAAM 		<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
};
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_aim120";				//AIM-120 				<Radar-homing, BVRAAM>
	_c pushBack "rhs_mag_aim120d";				//AIM-120D 				<Radar-homing, BVRAAM>
	_c pushBack "rhs_mag_aim120d_int";			//AIM-120D 				<Radar-homing, BVRAAM>
	_c pushBack "rhs_mag_aim120d_2_F22_l";		//AIM-120D (×2) 		<Radar-homing, BVRAAM>
	_c pushBack "rhs_mag_aim120d_2_F22_r";		//AIM-120D (×2) 		<Radar-homing, BVRAAM>
	_c pushBack "rhs_mag_R27R";					//R-27R 				<Active radar homing. Range: 2km-16km>
	_c pushBack "rhs_mag_R27R_APU470";			//R-27R 				<Active radar homing. Range: 2km-16km>
	_c pushBack "rhs_mag_R27ER";				//R-27ER 				<Active radar homing. Range: 2km-20km>
	_c pushBack "rhs_mag_R27ER_APU470";			//R-27ER 				<Active radar homing. Range: 2km-20km>
	_c pushBack "rhs_mag_R77";					//R-77 					<Active radar homing. Range: 2km-25km>
	_c pushBack "rhs_mag_R77_AKU170";			//R-77 					<Active radar homing. Range: 2km-25km>
	_c pushBack "rhs_mag_R77_AKU170_MIG29";		//R-77 					<Active radar homing. Range: 2km-25km>
	_c pushBack "rhs_mag_R77M";					//R-77M 				<Active radar homing missile with improved CM resistance. Range: 2km-25km>
	_c pushBack "rhs_mag_R77M_AKU170";			//R-77M 				<Active radar homing missile with improved CM resistance. Range: 2km-25km>
	_c pushBack "rhs_mag_R77M_AKU170_MIG29";	//R-77M 				<Active radar homing missile with improved CM resistance. Range: 2km-25km>
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

if(1042220 in _ownedDLCs && CTI_GM_DLC > 0) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "gm_1Rnd_maljutka_heat_9m14_pylon";		//9M14 				<HEAT 9M14<br />Rounds: 1<br />Used in: Maljutka>
	_c pushBack "gm_1Rnd_maljutka_heat_9m14m_pylon";	//9M14M 			<HEAT 9M14M<br />Rounds: 1<br />Used in: Maljutka>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_M";				//2x AGM-114K
	_c pushBack "CUP_PylonPod_4Rnd_AGM114K_Hellfire_II_M";				//4x AGM-114K
	_c pushBack "CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_Plane_M";		//2x AGM-114K

	_c pushBack "CUP_PylonPod_2Rnd_AT2_M";					//2x 9M17P Falanga-PV 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_4Rnd_Ataka_Empty_M";			//4x 9M120 Ataka 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_2Rnd_Ataka_M";				//2x 9M120 Ataka 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_2Rnd_AT6_M";					//2x 9M114 Shturm 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "rhs_mag_9M17_Mi24_2x";				//ATGM 9M17 			<>
	_c pushBack "rhs_mag_9M17p_Mi24_2x";			//ATGM 9M17P 			<>
	_c pushBack "rhs_mag_9m113_5_9P148_pylon";		//9M113 				<HEAT. 600 mm RHA penetration >
	_c pushBack "rhs_mag_9m133_pylon";				//9M133 				<Tandem HEAT. 1,000 mm RHA penetration >
	_c pushBack "rhs_mag_9m133f_pylon";				//9M133F 				<Thermobaric 10 kg TNT equivalent>
	_c pushBack "rhs_mag_9m1331_pylon";				//9M131-1 				<Tandem HEAT. 1,100 mm RHA penetration >
	_c pushBack "rhs_mag_9m133m2_pylon";			//9M133M-2 				<Tandem HEAT. 1,300 mm RHA penetration >
	_c pushBack "rhs_mag_9m133_spare_pylon";		//9M133 				<Tandem HEAT. 1,000 mm RHA penetration >
	_c pushBack "rhs_mag_9m133f_spare_pylon";		//9M133F 				<Thermobaric 10 kg TNT equivalent>
	_c pushBack "rhs_mag_9m1331_spare_pylon";		//9M131-1 				<Tandem HEAT. 1,100 mm RHA penetration >
	_c pushBack "rhs_mag_9m133m2_spare_pylon";		//9M133M-2 				<Tandem HEAT. 1,300 mm RHA penetration >
	_c pushBack "rhs_mag_9M114";					//9M114 				<>
	_c pushBack "rhs_mag_9M114_Mi24_2x";			//9M114 				<>
	_c pushBack "rhs_mag_9M114M_Mi24_2x";			//9M114M 				<>
	_c pushBack "rhs_mag_9M114F_Mi24_2x";			//9M114F 				<>
	_c pushBack "rhs_mag_9M114M1_Mi24_2x";			//9M114M1 				<>
	_c pushBack "rhs_mag_9M114M2_Mi24_2x";			//9M114M2 				<>
	_c pushBack "rhs_mag_9m120";					//9M120 				<>
	_c pushBack "rhs_mag_9M120_Mi24_2x";			//9M120 				<>
	_c pushBack "rhs_mag_9M120_Mi28_8x";			//9M120 				<>
	_c pushBack "rhs_mag_9M120_8";					//9M120 				<>
	_c pushBack "rhs_mag_9M120_16";					//9M120 				<>
	_c pushBack "rhs_mag_9m120m";					//9M120M 				<>
	_c pushBack "rhs_mag_9M120M_Mi24_2x";			//9M120M 				<>
	_c pushBack "rhs_mag_9M120M_Mi28_8x";			//9M120M 				<>
	_c pushBack "rhs_mag_9M120m_8";					//9M120M 				<>
	_c pushBack "rhs_mag_9M120m_16";				//9M120M 				<>
	_c pushBack "rhs_mag_9m120f";					//9M120F HE 			<>
	_c pushBack "rhs_mag_9M120F_Mi24_2x";			//9M120F HE 			<>
	_c pushBack "rhs_mag_9M120f_Mi28_8x";			//9M120F HE 			<>
	_c pushBack "rhs_mag_9M120f_8";					//9M120F HE 			<>
	_c pushBack "rhs_mag_9M120f_16";				//9M120F HE 			<>
	_c pushBack "rhs_mag_9M120O_Mi24_2x";			//9M120O Proximity 		<>
	_c pushBack "rhs_mag_9M120O_Mi28_8x";			//9M120O Proximity 		<>
	_c pushBack "rhs_mag_apu6_9m127m_ka52";			//9M127M 				<>
	_c pushBack "rhs_mag_DAGR_4";					//DAGR 					<×4 Laser-homing 70mm rockets>
	_c pushBack "rhs_mag_DAGR_8";					//DAGR (M310) 			<×8 Laser-homing 70mm rockets>
	_c pushBack "rhs_mag_DAGR_16";					//DAGR (M299) 			<×16 Laser-homing 70mm rockets>
	_c pushBack "rhs_mag_DAGR_4_plane";				//DAGR 					<×4 Laser-homing 70mm rockets>
	_c pushBack "rhs_mag_DAGR_8_plane";				//DAGR (M310) 			<×8 Laser-homing 70mm rockets>
	
	_c pushBack "rhs_mag_AGM114K";					//AGM-114K 				<Hellfire, Laser-homing >
	_c pushBack "rhs_mag_AGM114K_2";				//AGM-114K (M310) 		<×2 Hellfire, Laser-homing >
	_c pushBack "rhs_mag_AGM114K_4";				//AGM-114K (M299) 		<×4 Hellfire, Laser-homing >
	_c pushBack "rhs_mag_AGM114M";					//AGM-114M 				<HE/FRAG Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114M_2";				//AGM-114M (M310) 		<×2 HE/FRAG Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114M_4";				//AGM-114M (M299) 		<×4 HE/FRAG Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114N";					//AGM-114N 				<Thermobaric Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114N_2";				//AGM-114N (M310) 		<×2 Thermobaric Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114N_4";				//AGM-114N (M299) 		<×4 Thermobaric Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114K_plane";			//AGM-114K 				<Hellfire, Laser-homing >
	_c pushBack "rhs_mag_AGM114K_2_plane";			//AGM-114K (M310) 		<×2 Hellfire, Laser-homing >
	_c pushBack "rhs_mag_AGM114M_plane";			//AGM-114M 				<HE/FRAG Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114M_2_plane";			//AGM-114M (M310) 		<×2 HE/FRAG Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114N_plane";			//AGM-114N 				<Thermobaric Hellfire, Laser-homing>
	_c pushBack "rhs_mag_AGM114N_2_plane";			//AGM-114N (M310) 		<×2 Thermobaric Hellfire, Laser-homing>
	//items with errors
	//_c pushBack "rhs_mag_agm65";			//AGM-65 <>
	//_c pushBack "rhs_mag_agm65_x3";			//AGM-65 x3 <>
	//_c pushBack "rhs_mag_9m120o";			//9M120O Proximity <>
	//_c pushBack "rhs_mag_mi24_empty";		//Empty Shelf <>
	//_c pushBack "rhs_mag_bm21_base";		//<>
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

if(1042220 in _ownedDLCs && CTI_GM_DLC > 0) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "gm_1Rnd_hot_heat_dm72";				//DM72 				<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_hot_heat_dm72_blk";			//DM72 (Black) 		<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_hot_heat_dm72_red";			//DM72 (Red) 		<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_hot_heat_dm72_yel";			//DM72 (Yellow) 	<HEAT DM72<br />Rounds: 1<br />Used in: HATGM 1>
	_c pushBack "gm_1Rnd_hot_heat_dm102";				//DM102 			<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_blk";			//DM102 (Black) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_red";			//DM102 (Red) 		<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2
	_c pushBack "gm_1Rnd_hot_heat_dm102_yel";			//DM102 (Yellow) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_hornetarrow";	//DM102 (Arrow) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
	_c pushBack "gm_1Rnd_hot_heat_dm102_hornet";		//DM102 (Hornet) 	<HEAT DM102<br />Rounds: 1<br />Used in: HATGM 2>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_2Rnd_AGM114L_Hellfire_II_M";				//2x AGM-114L
	_c pushBack "CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M";				//4x AGM-114L
	_c pushBack "CUP_PylonPod_2Rnd_AGM114L_Hellfire_II_Plane_M";		//2x AGM-114L
	_c pushBack "CUP_PylonPod_1Rnd_AGM65_Maverick_M";		//1x AGM-65 Maverick
	_c pushBack "CUP_PylonPod_3Rnd_AGM65_Maverick_M";		//3x AGM-65 Maverick

	_c pushBack "CUP_PylonPod_6Rnd_Vikhr_M";							//6x 9K121 Vikhr 	<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "CUP_PylonPod_1Rnd_Kh29_M";								//1x Kh-29L 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
};
if(CTI_BW_ADDON > 0) then {
	_c pushBack "Pylonweapon_4Rnd_PARS";					//PARS 3 LR
};
if(CTI_BWADD_ADDON > 0) then {
	_c pushBack "sfp_hot1_6x_mag";							//HOT	(HATGM)
};
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_AGM114L";					//AGM-114L 				<Longbow Hellfire, Radar-homing>
	_c pushBack "rhs_mag_AGM114L_2";				//AGM-114L (M310)		<×2 Longbow Hellfire, Radar-homing>
	_c pushBack "rhs_mag_AGM114L_4";				//AGM-114L (M299) 		<×4 Longbow Hellfire, Radar-homing>
	_c pushBack "rhs_mag_AGM114L_plane";			//AGM-114L 				<Longbow Hellfire, Radar-homing>
	_c pushBack "rhs_mag_AGM114L_2_plane";			//AGM-114L (M310) 		<×2 Longbow Hellfire, Radar-homing>

	_c pushBack "rhs_mag_kh25";						//Kh-25 				<Semi-active laser seeker. Range: 2km-10km>
	_c pushBack "rhs_mag_kh25ML";					//Kh-25ML 				<Semi-active laser seeker. Range: 2km-10km>
	_c pushBack "rhs_mag_kh25MA";					//Kh-25MA 				<Active radar homing. Requires radar. Range: 1.5km-10km>
	_c pushBack "rhs_mag_kh25MTP";					//Kh-25MTP 				<IR-guided version which is fitted with automatic optical homing to a distinguishable object indicated by the pilot in the cockpit. Range: 1.5km-9km>
	_c pushBack "rhs_mag_kh25MP";					//Kh-25MP 				<Anti radiation missile. Range: 1.5km-10km>
	_c pushBack "rhs_mag_kh25_apu68_mig29";			//Kh-25 				<Semi-active laser seeker. Range: 2km-10km>
	_c pushBack "rhs_mag_kh25ML_apu68_mig29";		//Kh-25ML 				<Semi-active laser seeker. Range: 2km-10km>
	_c pushBack "rhs_mag_kh25MT_apu68_mig29";		//Kh-25MT 				<TV-guided version which is fitted with automatic optical homing to a distinguishable object indicated by the pilot in the cockpit. Range: 1.5km-8km>
	_c pushBack "rhs_mag_kh25MTP_apu68_mig29";		//Kh-25MTP 				<IR-guided version which is fitted with automatic optical homing to a distinguishable object indicated by the pilot in the cockpit. Range: 1.5km-9km>
	_c pushBack "rhs_mag_kh25MP_apu68_mig29";		//Kh-25MP 				<Anti radiation missile. Range: 1.5km-10km>
	_c pushBack "rhs_mag_kh29l";					//Kh-29L 				<Semi-active laser seeker. Range: 1.5km-10km>
	_c pushBack "rhs_mag_kh29ML";					//Kh-29ML 				<Semi-active laser seeker. Range: 1.5km-10km>
	_c pushBack "rhs_mag_kh29D";					//Kh-29D 				<IR-guided version which is fitted with automatic optical homing to a distinguishable object indicated by the pilot in the cockpit. Range: 1.5km-9km>
	_c pushBack "rhs_mag_kh29MP";					//Kh-29MP 				<Active radar homing. Requires radar. Range: 1.5km-9km>
	_c pushBack "rhs_mag_kh29l_aku58_mig29";		//Kh-29L 				<Semi-active laser seeker. Range: 1.5km-10km>
	_c pushBack "rhs_mag_kh29ML_aku58_mig29";		//Kh-29ML 				<Semi-active laser seeker. Range: 1.5km-10km>
	_c pushBack "rhs_mag_kh29MP_aku58_mig29";		//Kh-29MP 				<Semi-active laser seeker. Range: 1.5km-10km>
	_c pushBack "rhs_mag_Kh38mle";					//Kh-38MLE 				<Laser guided. Range: 1km-8km.>
	_c pushBack "rhs_mag_Kh38mle_int";				//Kh-38MLE 				<Laser guided. Range: 1km-8km.>
	_c pushBack "rhs_mag_Kh38mae";					//Kh-38MAE 				<Active radar homing. Range: 1km-10km.>
	_c pushBack "rhs_mag_Kh38mae_int";				//Kh-38MAE 				<Active radar homing. Range: 1km-10km.>
	_c pushBack "rhs_mag_Kh38mte";					//Kh-38MTE 				<IR guided. Range: 1km-10km.>
	_c pushBack "rhs_mag_Kh38mte_int";				//Kh-38MTE 				<IR guided. Range: 1km-10km.>
	_c pushBack "rhs_mag_kh55sh";					//Kh-55Sh HE (camo) 	<High explosive>
	_c pushBack "rhs_mag_kh55sh_6";					//Kh-55Sh HE (camo) 	<High explosive>
	_c pushBack "rhs_mag_kh55sh_nocamo";			//Kh-55Sh HE 			<High explosive>
	_c pushBack "rhs_mag_kh55sh_nocamo_6";			//Kh-55Sh HE 			<High explosive>
	_c pushBack "rhs_mag_agm65d";					//AGM-65D 				<IR-guided Maverick>
	_c pushBack "rhs_mag_agm65d_3";					//AGM-65D (LAU-88/A) 	<×3 IR-guided Maverick>
	_c pushBack "rhs_mag_agm65e";					//AGM-65E 				<Laser-guided Maverick>
	_c pushBack "rhs_mag_agm65e_3";					//AGM-65E (LAU-88/A) 	<×3 Laser-guided Maverick>
	_c pushBack "rhs_mag_agm65f";					//AGM-65F 				<IR-guided Anti-Ship Maverick>
	_c pushBack "rhs_mag_agm65f_3";					//AGM-65F (LAU-88/A) 	<×3 IR-guided Anti-Ship Maverick>
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

if(CTI_CWR3_ADDON > 0) then {
	_c pushBack "cwr3_4rnd_tow2_proxy";									//BGM-71C TOW
};
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_agm65b";					//AGM-65B 				<TV-guided Maverick>
	_c pushBack "rhs_mag_agm65b_3";					//AGM-65B (LAU-88/A) 	<×3 TV-guided Maverick>
	_c pushBack "rhs_mag_agm65h";					//AGM-65H 				<Improved TV-guided Maverick>
	_c pushBack "rhs_mag_agm65h_3";					//AGM-65H (LAU-88/A) 	<×3 Improved TV-guided Maverick>
	_c pushBack "rhs_mag_kh29T_aku58_mig29";		//Kh-29T 				<TV-guided version which is fitted with automatic optical homing to a distinguishable object indicated by the pilot in the cockpit. Range: 1.5km-9km>
	_c pushBack "rhs_mag_kh29T";					//Kh-29T 				<TV-guided version which is fitted with automatic optical homing to a distinguishable object indicated by the pilot in the cockpit. Range: 1.5km-9km>
	_c pushBack "rhs_mag_kh25MT";					//Kh-25MT 				<TV-guided version which is fitted with automatic optical homing to a distinguishable object indicated by the pilot in the cockpit. Range: 1.5km-8km>
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};

if(CTI_RHS_ADDON > 0) then {
	//*****************************************************LEVEL*4****************************************************************************
	_tech_level = 3;

	_c pushBack "rhs_mag_kh55sm";					//Kh-55SM Nuke (camo) 	<Tactical nuke>
	_c pushBack "rhs_mag_kh55sm_6";					//Kh-55SM Nuke (camo) 	<Tactical nuke>
	_c pushBack "rhs_mag_kh55sm_nocamo";			//Kh-55SM Nuke 			<Tactical nuke>
	_c pushBack "rhs_mag_kh55sm_nocamo_6";			//Kh-55SM Nuke 			<Tactical nuke>

	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "air-to-surface";
		_m pushBack 100;
		_u pushBack _tech_level;
	};
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

_c pushBack "PylonRack_7Rnd_Rocket_04_HE_F";				//Shrieker 7x HE 					<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_7Rnd_Rocket_04_AP_F";				//Shrieker 7x AP 					<Unguided rockets with high-explosive anti-tank warhead>
_c pushBack "PylonRack_12Rnd_missiles";						//DAR 								<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_19Rnd_Rocket_Skyfire";				//Skyfire 19x 						<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_20Rnd_Rocket_03_HE_F";				//Tratnyr 20x HE 					<Unguided rockets with high-explosive warhead>
_c pushBack "PylonRack_20Rnd_Rocket_03_AP_F";				//Tratnyr 20x AP 					<Unguided rockets with high-explosive anti-tank warhead>

if(1042220 in _ownedDLCs && CTI_GM_DLC > 0) then {		//Arma 3 Creator DLC: Global Mobilization - Cold War Germany
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_grn";			//S-5 (Green) 						<HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_bge";			//S-5 (Beige) 						<HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_gry";			//S-5 (Grey) 						<HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_blu";			//S-5 (Blue) 						<HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_he_s5_mars2_oli";			//S-5 (Olive) 						<HE S-5<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_grn";			//S-5K (Green) 						<HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_bge";			//S-5K (Beige) 						<HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_gry";			//S-5K (Grey) 						<HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_blu";			//S-5K (Blue) 						<HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_heat_s5k_mars2_oli";			//S-5K (Olive) 						<HEAT S-5K<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_grn";		//S-5-O (Green) 					<Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_bge";		//S-5-O (Beige) 					<Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_gry";		//S-5-O (Grey) 						<Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_blu";		//S-5-O (Blue) 						<Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
	_c pushBack "gm_16rnd_55mm_illum_s5O_mars2_oli";		//S-5-O (Olive) 					<Illum S-5-O<br />Rounds: 16<br />Used in: S-5, MARS-2>
};
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_PylonPod_7Rnd_Rocket_FFAR_M";			//7x Hydra LAU-68D/A
	_c pushBack "CUP_PylonPod_19Rnd_Rocket_FFAR_M";			//19x Hydra LAU-130A
	_c pushBack "CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M";	//19x Hydra LAU-130A
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_FAT_M";			//19x CRV7 FAT 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_HE_M";				//19x CRV7 HE 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_KEP_M";			//19x CRV7 KEP 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_12Rnd_CRV7_FAT_M";			//12x CRV7 FAT 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_12Rnd_CRV7_HE_M";				//12x CRV7 HE 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_12Rnd_CRV7_KEP_M";			//12x CRV7 KEP 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_FAT_plane_M";		//19x CRV7 FAT 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_HE_plane_M";		//19x CRV7 HE 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_19Rnd_CRV7_KEP_plane_M";		//19x CRV7 KEP 						<CRV7 Flechette Anti-Tank Rocket>
	_c pushBack "CUP_PylonPod_16Rnd_S5_plane_M";			//16x S5 Rocket 					<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_32Rnd_S5_plane_M";			//32x S5 UB32 Pod 					<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_7Rnd_S5_M";					//7x S5 Rocket 						<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_16Rnd_S5_M";					//16x S5 UB16 Pod 					<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_32Rnd_S5_M";					//32x S5 UB32 Pod 					<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8_M";					//20x S8 Rocket 					<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8_CCIP_M";				//20x S8 Rocket (CCIP) 				<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8N_M";					//20x S8 Rocket 					<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8N_CCIP_M";			//20x S8 Rocket (CCIP) 				<Unguided rockets with high-explosive warhead>
	_c pushBack "CUP_PylonPod_20Rnd_S8_plane_M";			//20x S8 Rocket 					<Unguided rockets with high-explosive warhead>
};
if(CTI_BW_ADDON > 0) then {
	_c pushBack "Pylonweapon_19Rnd_FZRockets";				//FZ71
};
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_m21of_1";							//M-21OF 							<High explosive 18,4kg warhead. 20km range> BM-21
	_c pushBack "rhs_mag_9m28f_1";							//9M28F 							<High explosive fragmentation 21kg warhead. 15km range>
	_c pushBack "rhs_mag_9m28k_1";							//9M28K 							<Cluster AT mine munition. Deploys 3 PTM-3 mines. 13km range>
	_c pushBack "rhs_mag_9m218_1";							//9M218 							<Cluster HEAT munition. Deploys 45 HEAT elements with penetration ability up to 160mm. 30km range>
	_c pushBack "rhs_mag_9m521_1";							//9M521 							<High explosive fragmentation extended range 21kg warhead. 40km range>
	_c pushBack "rhs_mag_9m522_1";							//9M522 							<High explosive fragmentation extended range 25kg warhead. 37km range>
	_c pushBack "rhs_mag_m26_6";							//M26 								<227mm rocket, ×161 M77 DPICM>
	_c pushBack "rhs_mag_m26a1_6";							//M26A1 							<227mm rocket, ×130 M85 DPICM>
	_c pushBack "rhs_mag_m30_6";							//M30 								<227mm rocket, GPS/INS, ×101 M85 DPICM>
	_c pushBack "rhs_mag_m31_6";							//M31 								<227mm rocket, GPS/INS, 200lb HE warhead>
	_c pushBack "rhs_mag_mgm140a_1";						//MGM-140A (M39) 					<ATacMS Block I, ×234 M74 APAM>
	_c pushBack "rhs_mag_mgm140b_1";						//MGM-140B (M39A1) 					<ATacMS Block IA, GPS/INS, ×69 M74 APAM>
	_c pushBack "rhs_mag_mgm164_block2_1";					//MGM-164A 							<ATacMS Block II, GPS/INS, ×13 Guided BAT>
	_c pushBack "rhs_mag_mgm164_block4_1";					//MGM-168 							<ATacMS Block IVA, GPS/INS, 500lb HE warhead>
	_c pushBack "rhs_mag_mgm168_block4_1";					//MGM-168 							<ATacMS Block IVA, GPS/INS, 500lb HE warhead>

	_c pushBack "rhs_mag_ub16_s5";							//S-5 GP 							<General purpose>
	_c pushBack "rhs_mag_ub16_s5m1";						//S-5 M1 HE-FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub16_s5k1";						//S-5 K1 HEAT 						<General purpose>
	_c pushBack "rhs_mag_ub16_s5ko";						//S-5 KO HEAT/FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub16_ka52_s5";						//S-5 GP 							<General purpose>
	_c pushBack "rhs_mag_ub16_ka52_s5m1";					//S-5 M1 HE-FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub16_ka52_s5k1";					//S-5 K1 HEAT 						<General purpose>
	_c pushBack "rhs_mag_ub16_ka52_s5ko";					//S-5 KO HEAT/FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub16_bd3_umk2a_s5";				//S-5 GP 							<General purpose>
	_c pushBack "rhs_mag_ub16_bd3_umk2a_s5m1";				//S-5 M1 HE-FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub16_bd3_umk2a_s5k1";				//S-5 K1 HEAT 						<General purpose>
	_c pushBack "rhs_mag_ub16_bd3_umk2a_s5ko";				//S-5 KO HEAT/FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub32_s5";							//S-5 GP 							<General purpose>
	_c pushBack "rhs_mag_ub32_s5m1";						//S-5 M1 HE-FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub32_s5k1";						//S-5 K1 HEAT 						<General purpose>
	_c pushBack "rhs_mag_ub32_s5ko";						//S-5 KO HEAT/FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub32_ka52_s5";						//S-5 GP 							<General purpose>
	_c pushBack "rhs_mag_ub32_ka52_s5m1";					//S-5 M1 HE-FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub32_ka52_s5k1";					//S-5 K1 HEAT 						<General purpose>
	_c pushBack "rhs_mag_ub32_ka52_s5ko";					//S-5 KO HEAT/FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub32_bd3_umk2a_s5";				//S-5 GP 							<General purpose>
	_c pushBack "rhs_mag_ub32_bd3_umk2a_s5m1";				//S-5 M1 HE-FRAG 					<General purpose>
	_c pushBack "rhs_mag_ub32_bd3_umk2a_s5k1";				//S-5 K1 HEAT 						<General purpose>
	_c pushBack "rhs_mag_ub32_bd3_umk2a_s5ko";				//S-5 KO HEAT/FRAG 					<General purpose>
	_c pushBack "rhs_mag_b8m1_s8kom";						//S-8 KOM HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8m1_s8df";						//S-8 DF FAE 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8m1_s8t";							//S-8 T HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8m1_bd3_umk2a_s8kom";				//S-8 KOM HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8m1_bd3_umk2a_s8df";				//S-8 DF FAE 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8m1_bd3_umk2a_s8t";				//S-8 T HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8v20a_s8kom";						//S-8 KOM HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8v20a_s8df";						//S-8 DF FAE 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8v20a_s8t";						//S-8 T HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8v20a_ka52_s8kom";				//S-8 KOM HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8v20a_ka52_s8df";					//S-8 DF FAE 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b8v20a_ka52_s8t";					//S-8 T HEAT 						<HEAT (Penetration: 350mm RHA)>
	_c pushBack "rhs_mag_b13l_s13b";						//S-13 B HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_s13d";						//S-13 D FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_s13df";						//S-13 DF FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_s13t";						//S-13 T HEAT 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_s13of";						//S-13 OF HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_bd3_umk2a_s13b";				//S-13 B HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_bd3_umk2a_s13d";				//S-13 D FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_bd3_umk2a_s13df";				//S-13 DF FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_bd3_umk2a_s13t";				//S-13 T HEAT 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l_bd3_umk2a_s13of";				//S-13 OF HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_s13b";						//S-13 B HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_s13d";						//S-13 D FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_s13df";						//S-13 DF FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_s13t";						//S-13 T HEAT 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_s13of";						//S-13 OF HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_ka52_s13b";					//S-13 B HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_ka52_s13d";					//S-13 D FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_ka52_s13df";					//S-13 DF FAE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_ka52_s13t";					//S-13 T HEAT 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_b13l1_ka52_s13of";					//S-13 OF HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_apu68m3_s24";						//S-24 HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_apu68m3_s24b";						//S-24 B HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_apu68_bd3_umk2a_s24";				//S-24 HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_apu68_bd3_umk2a_s24b";				//S-24 B HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_M151_7";							//M151 Hydra (M260) 				<×7 10lb HE Hydra>
	_c pushBack "rhs_mag_M151_7_green";						//M151 Hydra (LAU-68) 				<×7 10lb HE Hydra>
	_c pushBack "rhs_mag_M151_19";							//M151 Hydra (M261) 				<×19 10lb HE Hydra>
	_c pushBack "rhs_mag_M151_19_green";					//M151 Hydra (LAU-61) 				<×19 10lb HE Hydra>
	_c pushBack "rhs_mag_M229_7";							//M229 Hydra (M260) 				<×7 17lb HE Hydra>
	_c pushBack "rhs_mag_M229_7_green";						//M229 Hydra (LAU-68) 				<×7 10lb HE Hydra>
	_c pushBack "rhs_mag_M229_19";							//M229 Hydra (M261) 				<×19 17lb HE Hydra>
	_c pushBack "rhs_mag_M229_19_green";					//M229 Hydra (LAU-61) 				<×19 10lb HE Hydra>
	_c pushBack "rhs_mag_M257_7";							//M257 Hydra (M260) 				<×7 ILLUM Hydra>
	_c pushBack "rhs_mag_M257_7_green";						//M257 Hydra (LAU-68) 				<×7 ILLUM Hydra>
	_c pushBack "rhs_mag_FFAR_7_USAF";						//M151 FFAR (LAU-68) 				<×7 10lb HE FFAR>
	_c pushBack "rhs_mag_FFAR_21_USAF_LAU68_3";				//M151 FFAR (BRU-42 + LAU-68) 		<×21 10lb HEDP FFAR>
	_c pushBack "rhs_mag_FFAR_19_USAF";						//M151 FFAR (LAU-61) 				<×19 10lb HE FFAR>
	_c pushBack "rhs_mag_FFAR_57_USAF_LAU61_3";				//M151 FFAR (BRU-42 + LAU-61) 		<×57 10lb HE FFAR>
	_c pushBack "rhs_mag_M151_7_USAF_LAU131";				//M151 Hydra (LAU-131) 				<×7 10lb HE Hydra>
	_c pushBack "rhs_mag_M151_21_USAF_LAU131_3";			//M151 Hydra (BRU-42 + LAU-131) 	<×21 10lb HE Hydra>
	_c pushBack "rhs_mag_M257_7_USAF_LAU131";				//M257 Hydra (LAU-131) 				<×7 ILLUM Hydra>
	_c pushBack "rhs_mag_o25l_s25o";						//S-25O HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_o25l_s25of";						//S-25OF HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_o25l_s25l";						//S-25L HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_o25l_s25ld";						//S-25LD HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_usk_a_o25l_s25o";				//S-25O HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_usk_a_o25l_s25of";				//S-25OF HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_usk_a_o25l_s25l";				//S-25L HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_usk_a_o25l_s25ld";				//S-25LD HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_umk2a_o25l_s25o";				//S-25O HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_umk2a_o25l_s25of";				//S-25OF HE 						<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_umk2a_o25l_s25l";				//S-25L HE 							<Obstacle penetration/HE>
	_c pushBack "rhs_mag_bd3_umk2a_o25l_s25ld";				//S-25LD HE 						<Obstacle penetration/HE>
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
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_fab100";						//FAB-100 				<>
	_c pushBack "rhs_mag_fab100_ka52";					//FAB-100 				<>
	_c pushBack "rhs_mag_fab100_bd3_umk2a";				//FAB-100 				<>
	_c pushBack "rhs_mag_fab100_MBD3_U4T";				//FAB-100 MBD3-U4T 		<>
	_c pushBack "rhs_mag_fab100_MBD3_U6";				//FAB-100 MBD3-U6 		<>
	_c pushBack "rhs_mag_fab250";						//FAB-250 				<>
	_c pushBack "rhs_mag_fab250_2";						//FAB-250 				<>
	_c pushBack "rhs_mag_fab250_4";						//FAB-250 				<>
	_c pushBack "rhs_mag_fab250_ka52";					//FAB-250 				<>
	_c pushBack "rhs_mag_fab250_bd3_umk2a";				//FAB-250 				<>
	_c pushBack "rhs_mag_fab250_m62";					//FAB-250-M62 			<>
	_c pushBack "rhs_mag_fab250_m62_ka52";				//FAB-250-M62 			<>
	_c pushBack "rhs_mag_fab250_m62_bd3_umk2a";			//FAB-250-M62 			<>
	_c pushBack "rhs_mag_ofab250";						//OFAB-250 				<>
	_c pushBack "rhs_mag_ofab250_ka52";					//OFAB-250 				<>
	_c pushBack "rhs_mag_ofab250_bd3_umk2a";			//OFAB-250 				<>
	_c pushBack "rhs_mag_kab250";						//KAB-250 				<>
	_c pushBack "rhs_mag_kab250_int";					//KAB-250 				<>
	_c pushBack "rhs_mag_rbk250_ao1";					//RBK-250 AO-1 			<>
	_c pushBack "rhs_mag_rbk250_ao1_ka52";				//RBK-250 AO-1 			<>
	_c pushBack "rhs_mag_rbk250_ao1_bd3_umk2a";			//RBK-250 AO-1 			<>
	_c pushBack "rhs_mag_rbk250_ptab25";				//RBK-250 PTAB-2.5 		<>
	_c pushBack "rhs_mag_rbk250_ptab25_ka52";			//RBK-250 PTAB-2.5 		<>
	_c pushBack "rhs_mag_rbk250_ptab25_bd3_umk2a";		//RBK-250 PTAB-2.5 		<>
	_c pushBack "rhs_mag_rbk250_zab25t";				//RBK-250 ZAB-2.5T 		<>
	_c pushBack "rhs_mag_rbk250_zab25t_ka52";			//RBK-250 ZAB-2.5T 		<>
	_c pushBack "rhs_mag_rbk250_zab25t_bd3_umk2a";		//RBK-250 ZAB-2.5T 		<>
	_c pushBack "rhs_mag_fab500";						//FAB-500-M62 			<>
	_c pushBack "rhs_mag_fab500_bd3_usk_a";				//FAB-500-M62 			<>
	_c pushBack "rhs_mag_fab500_bd3_umk2a";				//FAB-500-M62 			<>
	_c pushBack "rhs_mag_fab500_ka52";					//FAB-500-M62 			<>
	_c pushBack "rhs_mag_fab500_m54";					//FAB-500-M54 			<>
	_c pushBack "rhs_mag_fab500_m54_bd3_usk_a";			//FAB-500-M54 			<>
	_c pushBack "rhs_mag_fab500_m54_bd3_umk2a";			//FAB-500-M54 			<>
	_c pushBack "rhs_mag_fab500_m54_ka52";				//FAB-500-M54 			<>
	_c pushBack "rhs_mag_kab500";						//KAB-500L 				<>
	_c pushBack "rhs_mag_kab500_bd3_umk2a";				//KAB-500L 				<>
	_c pushBack "rhs_mag_kab500LK";						//KAB-500LK 			<>
	_c pushBack "rhs_mag_kab500LK_bd3_umk2a";			//KAB-500LK 			<>
	_c pushBack "rhs_mag_kab500kr";						//KAB-500KR 			<>
	_c pushBack "rhs_mag_kab500kr_bd3_umk2a";			//KAB-500KR 			<>
	_c pushBack "rhs_mag_kab500od";						//KAB-500OD 			<>
	_c pushBack "rhs_mag_kab500od_bd3_umk2a";			//KAB-500OD 			<>
	_c pushBack "rhs_mag_rbk500_ao25";					//RBK-500 AO-2.5 		<>
	_c pushBack "rhs_mag_rbk500_ao25_bd3_usk_a";		//RBK-500 AO-2.5 		<>
	_c pushBack "rhs_mag_rbk500_ao25_bd3_umk2a";		//RBK-500 AO-2.5 		<>
	_c pushBack "rhs_mag_rbk500_ao25_ka52";				//RBK-500 AO-2.5 		<>
	_c pushBack "rhs_mag_rbk500_ofab50";				//RBK-500 OFAB-50 		<>
	_c pushBack "rhs_mag_rbk500_ofab50_bd3_usk_a";		//RBK-500 OFAB-50 		<>
	_c pushBack "rhs_mag_rbk500_ofab50_bd3_umk2a";		//RBK-500 OFAB-50 		<>
	_c pushBack "rhs_mag_rbk500_ofab50_ka52";			//RBK-500 OFAB-50 		<>
	_c pushBack "rhs_mag_rbk500_spbed";					//RBK-500 SPBE-D 		<>
	_c pushBack "rhs_mag_rbk500_spbed_bd3_usk_a";		//RBK-500 SPBE-D 		<>
	_c pushBack "rhs_mag_rbk500_spbed_bd3_umk2a";		//RBK-500 SPBE-D 		<>
	_c pushBack "rhs_mag_rbk500_spbed_ka52";			//RBK-500 SPBE-D 		<>
	_c pushBack "rhs_mag_rbk500_ptab1m";				//RBK-500 PTAB-1M 		<>
	_c pushBack "rhs_mag_rbk500_ptab1m_bd3_usk_a";		//RBK-500 PTAB-1M 		<>
	_c pushBack "rhs_mag_rbk500_ptab1m_bd3_umk2a";		//RBK-500 PTAB-1M 		<>
	_c pushBack "rhs_mag_rbk500_ptab1m_ka52";			//RBK-500 PTAB-1M 		<>
	_c pushBack "rhs_mag_rbk500_zab25t";				//RBK-500 ZAB-2.5T 		<>
	_c pushBack "rhs_mag_rbk500_zab25t_bd3_usk_a";		//RBK-500 ZAB-2.5T 		<>
	_c pushBack "rhs_mag_rbk500_zab25t_bd3_umk2a";		//RBK-500 ZAB-2.5T 		<>
	_c pushBack "rhs_mag_rbk500_zab25t_ka52";			//RBK-500 ZAB-2.5T 		<>
	_c pushBack "rhs_mag_kmgu2_ao25";					//KMGU-2 AO-2.5RT 		<>
	_c pushBack "rhs_mag_kmgu2_ao25_bd3_umk2a";			//KMGU-2 AO-2.5RT 		<>
	_c pushBack "rhs_mag_kmgu2_ao25_ka52";				//KMGU-2 AO-2.5RT 		<>
	_c pushBack "rhs_mag_kmgu2_ptab1m";					//KMGU-2 PTAB-1M 		<>
	_c pushBack "rhs_mag_kmgu2_ptab1m_bd3_umk2a";		//KMGU-2 PTAB-1M 		<>
	_c pushBack "rhs_mag_kmgu2_ptab1m_ka52";			//KMGU-2 PTAB-1M 		<>
	_c pushBack "rhs_mag_kmgu2_pfm1";					//KMGU-2 PFM-1 			<>
	_c pushBack "rhs_mag_kmgu2_pfm1_bd3_umk2a";			//KMGU-2 PFM-1 			<>
	_c pushBack "rhs_mag_kmgu2_pfm1_ka52";				//KMGU-2 PFM-1 			<>
	_c pushBack "rhs_mag_kmgu2_ptm1";					//KMGU-2 PTM-1 			<>
	_c pushBack "rhs_mag_kmgu2_ptm1_bd3_umk2a";			//KMGU-2 PTM-1 			<>
	_c pushBack "rhs_mag_kmgu2_ptm1_ka52";				//KMGU-2 PTM-1 			<>
	_c pushBack "rhs_mag_mk82";							//Mk82 					<500lb bomb>
	_c pushBack "rhs_mag_mk82_3";						//Mk82 (BRU-42) 		<×3 500lb bomb>
	_c pushBack "rhs_mag_gbu12";						//GBU-12 				<500lb Paveway II>
	_c pushBack "rhs_mag_cbu87";						//CBU-87 				<SUU-65/B Dispenser (×101 BLU-97B/B CEM)>
	_c pushBack "rhs_mag_cbu87_3";						//CBU-87 (BRU-42) 		<×3 SUU-65/B Dispenser (×101 BLU-97B/B CEM)>
	_c pushBack "rhs_mag_cbu89";						//CBU-89 				<SUU-64/B Dispenser (×71 BLU-91/B AT & ×22 BLU-92/B APERS mines)>
	_c pushBack "rhs_mag_cbu89_3";						//CBU-89 (BRU-42) 		<×3 SUU-64/B Dispenser (×71 BLU-91/B AT & ×22 BLU-92/B APERS mines)>
	_c pushBack "rhs_mag_cbu100";						//CBU-100 				<SUU-76/B Dispenser (×123 Mk 118 HEAT)>
	_c pushBack "rhs_mag_cbu100_3";						//CBU-100 (BRU-42) 		<×3 SUU-76/B Dispenser (×123 Mk 118 HEAT)>
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
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_gbu32";						//GBU-32 				<1000lb JDAM>
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

//*******************************************************************************************************************************************
//														weapon pod																		  	*
//*******************************************************************************************************************************************
_tech_level = 0;

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
if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_mag_upk23_ofz";					//UPK-23-250 OFZ 									<>
	_c pushBack "rhs_mag_upk23_ofzt";					//UPK-23-250 OFZT 									<>
	_c pushBack "rhs_mag_upk23_btz";					//UPK-23-250 BZT 									<>
	_c pushBack "rhs_mag_upk23_mixed";					//UPK-23-250 Mixed 									<>
	_c pushBack "rhs_mag_upk23_ka52_ofz";				//UPK-23-250 OFZ 									<>
	_c pushBack "rhs_mag_upk23_ka52_ofzt";				//UPK-23-250 OFZT 									<>
	_c pushBack "rhs_mag_upk23_ka52_btz";				//UPK-23-250 BZT 									<>
	_c pushBack "rhs_mag_upk23_ka52_mixed";				//UPK-23-250 Mixed 									<>
	_c pushBack "rhsusf_mag_gau19_melb_right";			//GAU-19/A 											<×1300 12.7×99mm M962 (SLAP-T)>
	_c pushBack "rhsusf_mag_gau19_melb_left";			//GAU-19/A 											<×1300 12.7×99mm M962 (SLAP-T)>
	_c pushBack "rhs_mag_m134_pylon_3000";				//M134 												<×3000 7.62×51mm M61/M62 (AP/T)>
	_c pushBack "rhs_mag_zt3_4";						//ZT3 Ingwe 										<>
	_c pushBack "rhs_mag_zt6_4";						//ZT6 Mokopa 										<>
	_c pushBack "rhs_mag_zpl20_hei";					//20x139mm High-Explosive Indenciary 				<>
	_c pushBack "rhs_mag_zpl20_apit";					//20x139mm Armor-Piercing Incendary Traced 			<>
	_c pushBack "rhs_mag_zpl20_mixed";					//20x139mm Mixed 									<>
	//items with errors
	//_c pushBack "rhs_mag_gau19_air_base";				//GAU-19/A <×1300 12.7×99mm M962 (SLAP-T)>
	//_c pushBack "rhs_mag_m134_pylon_base";				//M134 <>
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

if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_ASO2_CMFlare_Chaff_Magazine";					//1x32 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_ASO2_CMFlare_Chaff_Magazine_x2";				//2x32 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_ASO2_CMFlare_Chaff_Magazine_x4";				//4x32 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_ASO2_CMFlare_Chaff_Magazine_x6";				//6x32 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_ASO2_CMFlare_Magazine";						//1x32 PPI-26 Flare 						<>
	_c pushBack "rhs_ASO2_CMFlare_Magazine_x2";						//2x32 PPI-26 Flare 						<>
	_c pushBack "rhs_ASO2_CMFlare_Magazine_x4";						//4x32 PPI-26 Flare 						<>
	_c pushBack "rhs_ASO2_CMFlare_Magazine_x6";						//6x32 PPI-26 Flare 						<>
	_c pushBack "rhs_BVP3026_CMFlare_Chaff_Magazine";				//1x30 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_BVP3026_CMFlare_Chaff_Magazine_x2";			//2x30 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_BVP3026_CMFlare_Magazine";						//1x30 PPI-26 Flare 						<>
	_c pushBack "rhs_BVP3026_CMFlare_Magazine_x2";					//2x30 PPI-26 Flare 						<>
	_c pushBack "rhs_UV26_CMFlare_Chaff_Magazine";					//1x32 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_UV26_CMFlare_Chaff_Magazine_x2";				//2x32 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_UV26_CMFlare_Chaff_Magazine_x4";				//4x32 PPI-26 Flare/PPR-26 Chaff 			<>
	_c pushBack "rhs_UV26_CMFlare_Magazine";						//1x32 PPI-26 Flare 						<>
	_c pushBack "rhs_UV26_CMFlare_Magazine_x2";						//2x32 PPI-26 Flare 						<>
	_c pushBack "rhs_UV26_CMFlare_Magazine_x4";						//4x32 PPI-26 Flare 						<>
	_c pushBack "rhsusf_M130_CMFlare_Chaff_Magazine";				//1x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_M130_CMFlare_Chaff_Magazine_x2";			//2x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_M130_CMFlare_Chaff_Magazine_x4";			//4x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_M130_CMFlare_Chaff_Magazine_x8";			//8x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_M130_CMFlare_Chaff_Magazine_x16";			//16x30 M206 Flare/RR-170 Chaff 			<>
	_c pushBack "rhsusf_M130_CMFlare_Magazine";						//1x30 M206 Flare 							<>
	_c pushBack "rhsusf_M130_CMFlare_Magazine_x2";					//2x30 M206 Flare 							<>
	_c pushBack "rhsusf_M130_CMFlare_Magazine_x4";					//4x30 M206 Flare 							<>
	_c pushBack "rhsusf_M130_CMFlare_Magazine_x8";					//8x30 M206 Flare 							<>
	_c pushBack "rhsusf_M130_CMFlare_Magazine_x16";					//16x30 M206 Flare 							<>
	_c pushBack "rhsusf_ANALE39_CMFlare_Chaff_Magazine";			//1x30 MJU-32 Flare/RR-144 Chaff 			<>
	_c pushBack "rhsusf_ANALE39_CMFlare_Chaff_Magazine_x2";			//2x30 MJU-32 Flare/RR-144 Chaff 			<>
	_c pushBack "rhsusf_ANALE39_CMFlare_Chaff_Magazine_x4";			//4x30 MJU-32 Flare/RR-144 Chaff 			<>
	_c pushBack "rhsusf_ANALE39_CMFlare_Magazine";					//1x30 MJU-32 Flare 						<>
	_c pushBack "rhsusf_ANALE39_CMFlare_Magazine_x2";				//2x30 MJU-32 Flare 						<>
	_c pushBack "rhsusf_ANALE39_CMFlare_Magazine_x4";				//4x30 MJU-32 Flare 						<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Chaff_Magazine";			//1x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2";			//2x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Chaff_Magazine_x4";			//4x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Chaff_Magazine_x8";			//8x30 M206 Flare/RR-170 Chaff 				<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16";		//16x30 M206 Flare/RR-170 Chaff 			<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Magazine";					//1x30 M206 Flare 							<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Magazine_x2";				//2x30 M206 Flare 							<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Magazine_x4";				//4x30 M206 Flare 							<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Magazine_x8";				//8x30 M206 Flare 							<>
	_c pushBack "rhsusf_ANALE40_CMFlare_Magazine_x16";				//16x30 M206 Flare 							<>
	_c pushBack "rhsusf_ANALE52_CMFlare_Chaff_Magazine";			//1x12 MJU-39 Flare/12 RR-170 Chaff 		<>
	_c pushBack "rhsusf_ANALE52_CMFlare_Chaff_Magazine_x2";			//2x12 MJU-39 Flare/24 RR-170 Chaff 		<>
	_c pushBack "rhsusf_ANALE52_CMFlare_Chaff_Magazine_x4";			//4x12 MJU-39 Flare/2x24 RR-170 Chaff 		<>
	_c pushBack "rhsusf_ANALE52_CMFlare_Magazine";					//1x12 MJU-39 Flare 						<>
	_c pushBack "rhsusf_ANALE52_CMFlare_Magazine_x2";				//2x12 MJU-39 Flare 						<>
	_c pushBack "rhsusf_ANALE52_CMFlare_Magazine_x4";				//4x12 MJU-39 Flare 						<>
	_c pushBack "rhsusf_ANALE52_CMFlare_Magazine_x6";				//6x12 MJU-39 Flare 						<>
	_c pushBack "rhs_mag_ANALQ131";									//AN/ALQ-131(V) 							<Electronic Countermeasures (ECM) Pod>

	//Fueltanks
	_c pushBack "rhs_mag_ptb1150_ptb";					//PTB-1150 					<>
	_c pushBack "rhs_mag_ptb1500";						//PTB-1500 					<>
	_c pushBack "rhs_mag_fueltank_UH60";				//Fuel Tank (empty) 		<>
	_c pushBack "rhs_mag_fueltank_UH60MEV";				//Fuel Tank (MEV) 			<>
	//items with errors
	//_c pushBack "rhs_mag_l159_fuelpod";					//Fuel Pod <>
	//_c pushBack "rhs_mag_l159_fuelpod_grey";			//Fuel Pod (Grey) <>
	
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
