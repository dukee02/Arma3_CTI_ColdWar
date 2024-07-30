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
if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_ASRAAM_x1";					//ASRAAM 			<Type: SR-AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_ASRAAM_WINGTIP";				//ASRAAM 			<Type: SR-AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_IRIS_T_x1";					//IRIS-T 			<Type: IRIS-T SR-AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_IRIS_T_WINGTIP";				//IRIS-T 			<Type: IRIS-T SR-AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
};
if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_9M38_Heli_4xmag";				//9K38 A-A (SA-18) x4 	<9K38 IR Anti-Air Guided Missile<br />'Igla' (NATO: SA-18 'Grouse') <br />Type: HE Anti-Air<br />Rounds: 4>
	_c pushBack "pook_9M38_Heli_2xmag";				//9K38 A-A (SA-18) x2 	<9K38 IR Anti-Air Guided Missile<br />'Igla' (NATO: SA-18 'Grouse') <br />Type: HE Anti-Air<br />Rounds: 2>
	_c pushBack "pook_mag_R3_AA";					//R-3 (AA-2) A-A 		<R-3 Infrared Homing Missile<br />R-3 (NATO: AA-2)<br />Type: Short-Range IR AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R3_AA_Wingtip";			//R-3 (AA-2) A-A 		<R-3 Infrared Homing Missile<br />R-3 (NATO: AA-2)<br />Type: Short-Range IR AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R60_AA";					//R-60 (AA-8) A-A 		<R-60 Infrared Homing Missile<br />R-60 (NATO: AA-8)<br />Type: Short-Range IR AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R60_AA_Wingtip";			//R-60 (AA-8) A-A 		<R-60 Infrared Homing Missile<br />R-60 (NATO: AA-8)<br />Type: Short-Range IR AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R60_x2_L";				//R-60 (AA-8) A-A x2 	<R-60 Infrared Homing Missile<br />R-60 (NATO: AA-8)<br />Type: Short-Range IR AAM<br />Rounds: 2>
	_c pushBack "pook_mag_R60_x2_R";				//R-60 (AA-8) A-A x2 	<R-60 Infrared Homing Missile<br />R-60 (NATO: AA-8)<br />Type: Short-Range IR AAM<br />Rounds: 2>
	_c pushBack "pook_mag_R73_AA";					//R-73 (AA-11) A-A 		<R-73 Infrared Homing Missile<br />R-73 (NATO: AA-11)<br />Type: Short-Range IR AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R73_AA_Wingtip";			//R-73 (AA-11) A-A 		<R-73 Infrared Homing Missile<br />R-73 (NATO: AA-11)<br />Type: Short-Range IR AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R73_x2_L";				//R-73 (AA-11) A-A x2 	<R-73 Infrared Homing Missile<br />R-73 (NATO: AA-11)<br />Type: Short-Range IR AAM<br />Rounds: 2>
	_c pushBack "pook_mag_R73_x2_R";				//R-73 (AA-11) A-A x2 	<R-73 Infrared Homing Missile<br />R-73 (NATO: AA-11)<br />Type: Short-Range IR AAM<br />Rounds: 2>
	_c pushBack "pook_mag_R23T_AA";					//R-23T (AA-7) A-A 		<R-23T Infrared Homing Missile<br />R-23T (NATO: AA-7T)<br />Type: Infrared-Homing Medium-Range AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R27T_AA";					//R-27T (AA-10 IR) A-A 	<R-27T Infrared Homing Missile<br />R-27T (NATO: AA-10T)<br />Type: Infrared-Homing Medium-Range AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R40T_AA";					//R-40T (AA-6) A-A 		<R-40T Infrared Homing Missile<br />R-40T (NATO: AA-6T)<br />Type: Infrared-Homing Extended-Range AAM<br />Rounds: 1<br />Used in: Mig-25, Mig-31>
};
if (isClass(configFile >> "CfgVehicles" >> "sab_f104_b")) then {
	_c pushBack "sab_milavi_1rnd_aim9x_mag";		//MA AAM AIM-9 x1 		<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_AIM9L_P_1rnd_M")) then {
	_c pushBack "FIR_AIM9L_P_1rnd_M";				//AIM-9L Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9L_P_1rnd_M_Tornado_AWS";	//AIM-9L Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_IRIS_T_P_1rnd_M";				//IRIS-T <Short-range,  IR guided, air-to-air missile>
	_c pushBack "FIR_IRIS_T_P_1rnd_M_Tornado_AWS";	//IRIS-T <Short-range,  IR guided, air-to-air missile>
	_c pushBack "FIR_AIM132_P_1rnd_M";				//AIM-132 ASRAAM <Short-range,  IR guided, air-to-air missile>
	_c pushBack "FIR_AIM132_P_1rnd_M_Tornado_AWS";	//AIM-132 ASRAAM <Short-range,  IR guided, air-to-air missile>
	_c pushBack "FIR_AIM9P_P_1rnd_M";				//AIM-9P Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9P_P_2rnd_M";				//AIM-9P Sidewinder x2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9H_P_1rnd_M";				//AIM-9H Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9H_LAU7_P_1rnd_M";			//AIM-9H Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9L_LAU138_P_1rnd_M";		//AIM-9L Sidewinder w/LAU-138 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9L_LAU115_P_1rnd_M";		//AIM-9L Sidewinder w/LAU-7 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9L_LAU115_P_2rnd_M";		//AIM-9L Sidewinder x 2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9L_P_2rnd_M";				//AIM-9L Sidewinder x2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9M_P_1rnd_M";				//AIM-9M Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9M_LAU138_P_1rnd_M";		//AIM-9M Sidewinder w/LAU-138 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9M_LAU115_P_1rnd_M";		//AIM-9M Sidewinder w/LAU-7 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9M_LAU115_P_2rnd_M";		//AIM-9M Sidewinder x 2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>		//wrong 'pylonWeapon' in magazine:'FIR_AIM9M_LAU115_P_2rnd_M' this magazine cannot be used in weapon'FIR_AIM9L'
	_c pushBack "FIR_AIM9M_P_2rnd_M";				//AIM-9M Sidewinder x2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9X_P_1rnd_M";				//AIM-9X Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9X_LAU115_P_1rnd_M";		//AIM-9X Sidewinder <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9X_P_2rnd_M";				//AIM-9X Sidewinder x 2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9X_LAU115_P_2rnd_M";		//AIM-9X Sidewinder x 2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9X_P_EWP_2rnd_M";			//(EWP)AIM-9X Sidewinder x2 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9X_P_F23A_3rnd_M";			//AIM-9X Sidewinder x 3 <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AIM9X_EWP_4rnd_M";				//AIM-9X Sidewinder x4 (EWP) <short-range, IR guided, Anti-air missile / the standard short-range air-to-air missile in Western countries. Don't laugh at the word 'short-distance'. You can die from rattlesnake's poison teeth.>
	_c pushBack "FIR_AAM3_P_1rnd_M";				//AAM-3 <Short-range,  IR guided, air-to-air missile>
	_c pushBack "FIR_AAM5_P_1rnd_M";				//AAM-5 <Short-range,  IR guided, air-to-air missile>

	_c pushBack "FIR_R60M_P_1rnd_M";				//R-60M <Short-range,  IR guided, air-to-air missile>
	_c pushBack "FIR_R73_P_1rnd_M";					//R-73 <Short-range,  IR guided, air-to-air missile>
	_c pushBack "FIR_R27ET_P_1rnd_M";				//R-27ET <Mid-range,  IR guided, air-to-air missile>
};
if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_missile_sa7b_mag_x2";				//9K32M Strela-2M (SA-7b) 		<>

	_c pushBack "vn_missile_aa2_mag_x1";				//K-15 (AA-2A) 					<K-2 (AA-2A Atoll) Air-to-air Infra-Red heat-seeking missile>
	_c pushBack "vn_missile_mig19_01_aa2_mag_x1";		//K-15 (AA-2A) 					<K-2 (AA-2A Atoll) Air-to-air Infra-Red heat-seeking missile>
	_c pushBack "vn_missile_aim9e_mag_x1";				//AIM-9E Sidewinder 			<AIM-9E Sidewinder Air-to-air Infra-Red heat-seeking missile>
	_c pushBack "vn_missile_f4_lau7_aim9e_mag_x2";		//2x AIM-9E Sidewinder 			<2x AIM-9E Sidewinder Air-to-air Infra-Red heat-seeking missile>
	_c pushBack "vn_missile_f100_lau7_aim9e_mag_x2";	//2x AIM-9E Sidewinder 			<2x AIM-9E Sidewinder Air-to-air Infra-Red heat-seeking missile>
	_c pushBack "vn_missile_f4_lau7_aim9x_mag_x2";		//BIM 9X AA x2 					<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
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

if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_AIM120_x1";					//AIM-120 MR-AAM 	<Type: AIM-120 Medium-Range AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_AIM120_Fuselage";				//AIM-120 MR-AAM 	<Type: AIM-120 Medium-Range AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_ASPIDE_x1";					//ASPIDE MR-AAM 	<Type: ASPIDE Medium-Range AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_ASPIDE_Fuselage";				//ASPIDE MR-AAM 	<Type: ASPIDE Medium-Range AAM<br />Rounds: 1x HE-Frag Proximity Warhead<br />Used in: EF-2000>
};

if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_mag_R23R_AA";					//R-23R (AA-7) A-A 			<R-23R Radar Homing Missile<br />R-23R (NATO: AA-7)<br />Type: Radar-Homing Medium-Range AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R27R_AA";					//R-27R (AA-10 RDR) A-A 	<R-27R Radar Homing Missile<br />R-27R (NATO: AA-10R)<br />Type: Radar-Homing Medium-Range AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R27R_AA_2x";				//R-27R (AA-10 RDR) A-A x2 	<R-27R Radar Homing Missile<br />R-27R (NATO: AA-10R)<br />Type: Radar-Homing Medium-Range AAM<br />Rounds: 2>
	_c pushBack "pook_mag_R40R_AA";					//R-40R (AA-6) A-A 			<R-40R Radar Homing Missile<br />R-40R (NATO: AA-6)<br />Type: Radar-Homing Extended-Range AAM<br />Rounds: 1<br />Used in: Mig-25, Mig-31>
	_c pushBack "pook_mag_R77R_AA";					//R-77R (AA-12) A-A 		<R-77R Radar Homing Missile<br />R-77R (NATO: AA-12)<br />Type: Radar-Homing Extended-Range AAM<br />Rounds: 1>
	_c pushBack "pook_mag_R77R_AA_2x";				//R-77R (AA-12) A-A x2 		<R-77R Radar Homing Missile<br />R-77R (NATO: AA-12)<br />Type: Radar-Homing Extended-Range AAM<br />Rounds: 2>
	_c pushBack "pook_mag_R33_AA";					//R-33 (AA-9) A-A 			<R-33 Radar-Homing Missile<br />R-33 (NATO: AA-9)<br />Type: Radar-Homing Extended-Range AAM<br />Rounds: 1<br /> Used in: Mig-31>
	_c pushBack "pook_mag_R33_AA_4x";				//R-33 (AA-9) A-A x4 		<R-33 Radar-Homing Missile<br />R-33 (NATO: AA-9)<br />Type: Radar-Homing Extended-Range AAM<br />Rounds: 4<br /> Used in: Mig-31>
	_c pushBack "pook_mag_R37M_AA";					//R-37M (AA-13) A-A 		<R-37 Radar-Homing Missile<br />R-37 (NATO: AA-13)<br />Type: Radar-Homing Extended-Range AAM<br />Rounds: 1<br /> Used in: Mig-31, Su-35>
	_c pushBack "pook_mag_R37M_AA_4x";				//R-37M (AA-13) A-A x4 		<R-37 Radar-Homing Missile<br />R-37 (NATO: AA-13)<br />Type: Radar-Homing Extended-Range AAM<br />Rounds: 4<br /> Used in: Mig-31>
};

if (isClass(configFile >> "CfgMagazines" >> "FIR_AIM120_P_1rnd_M")) then {
	_c pushBack "FIR_AIM120_P_1rnd_M";				//AIM-120C AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_P_1rnd_M_Tornado_AWS";	//AIM-120C AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120A_P_1rnd_M";				//AIM-120A AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120A_LAU115_P_1rnd_M";		//AIM-120A AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120A_LAU115_P_2rnd_M";		//AIM-120A AMRAAM x2 <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120B_P_1rnd_M";				//AIM-120B AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120B_LAU115_P_1rnd_M";		//AIM-120B AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_F15SE_P_1rnd_M";		//AIM-120C AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_LAU115_P_1rnd_M";		//AIM-120C AMRAAM <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_LAU115_P_2rnd_M";		//AIM-120C AMRAAM x2 (LAU-115C/A) <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_LAU115BA_P_2rnd_M";		//AIM-120C AMRAAM x2 (LAU-115B/A) <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_P_type1_2rnd_M";		//AIM-120 AMRAAM x2 <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_P_AMBER_2rnd_M";		//AIM-120 AMRAAM x2 (AMBER) <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_P_F22_Type1_2rnd_M";	//AIM-120 AMRAAM x2 <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_P_F22_Type2_2rnd_M";	//AIM-120 AMRAAM x2 / Fueltank <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_P_F23A_3rnd_M";			//AIM-120 AMRAAM x 3 <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_P_EWP_2rnd_M";			//(EWP)AIM-120 AMRAAM x2 <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_EWP_4rnd_M";			//AIM-120 AMRAAM x4 (EWP) <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM120_EWP_F14_4rnd_M";		//AIM-120 AMRAAM x4 (EWP) <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AAM4_P_1rnd_M";				//AAM-4 <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7_P_1rnd_M";				//AIM-7M Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7_2_P_1rnd_M";				//AIM-7M Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7_LAU115_P_1rnd_M";			//AIM-7M Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7_P_F14_U1_1rnd_M";			//AIM-7M Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7_P_F14_U2_1rnd_M";			//AIM-7M Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7_P_F14_U3_1rnd_M";			//AIM-7M Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7_P_F14_U4_1rnd_M";			//AIM-7M Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7F_P_1rnd_M";				//AIM-7F Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7F_2_P_1rnd_M";				//AIM-7F Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7F_LAU115_P_1rnd_M";		//AIM-7F Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7F_P_F14_U1_1rnd_M";		//AIM-7F Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7F_P_F14_U2_1rnd_M";		//AIM-7F Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7F_P_F14_U3_1rnd_M";		//AIM-7F Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7F_P_F14_U4_1rnd_M";		//AIM-7F Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7E_P_1rnd_M";				//AIM-7E-4 Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7E_2_P_1rnd_M";				//AIM-7E-3 Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7E_P_F14_U1_1rnd_M";		//AIM-7E-4 Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7E_P_F14_U2_1rnd_M";		//AIM-7E-4 Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7E_P_F14_U3_1rnd_M";		//AIM-7E-4 Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM7E_P_F14_U4_1rnd_M";		//AIM-7E-4 Sparrow <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_Skyflash_P_1rnd_M";			//Skyflash <Mid-range,  Radar guided, air-to-air missile>

	_c pushBack "FIR_R27ER_P_1rnd_M";				//R-27ER <Mid-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_R77_P_1rnd_M";					//R-77 <Mid-range,  Radar guided, air-to-air missile>
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_missile_aim7e2_mag_x1";				//AIM-7E Sparrow 				<AIM-7E Sparrow Air-to-air Radar-guided missile>
	
	_c pushBack "vn_missile_aim120c_mag_x1";			//AMRAAM C AA x1 				<Medium-range, radar-guided, air-to-air missile with high-explosive warhead>
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-air";
	_m pushBack 100;
	_u pushBack _tech_level;
};

if (isClass(configFile >> "CfgMagazines" >> "FIR_Meteor_P_1rnd_M")) then {
	//*****************************************************LEVEL*2****************************************************************************
	_tech_level = 2;

	_c pushBack "FIR_Meteor_P_1rnd_M";				//MBDA Meteor <Long-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_Meteor_P_1rnd_M_Tornado_AWS";	//MBDA Meteor <Long-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM54_P_1rnd_M";				//AIM-54C Phoenix <Extreme Long-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM54_LAU93_P_1rnd_M";			//AIM-54C Phoenix <Extreme Long-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM54A_P_1rnd_M";				//AIM-54A Phoenix <Extreme Long-range,  Radar guided, air-to-air missile>
	_c pushBack "FIR_AIM54A_LAU93_P_1rnd_M";		//AIM-54A Phoenix <Extreme Long-range,  Radar guided, air-to-air missile>

	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "air-to-air";
		_m pushBack 100;
		_u pushBack _tech_level;
	};
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
if(CTI_RHS_ADDON > 0) then {
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
if (isClass(configFile >> "CfgMagazines" >> "FIR_AGM65E_P_1rnd_M")) then {
	_c pushBack "FIR_Scalpel_P_1rnd_M";					//Scalpel LCDPB x1 			<LCDPB>
	_c pushBack "FIR_Scalpel_P_F15E_1rnd_M";			//Scalpel LCDPB x1 			<LCDPB>
	_c pushBack "FIR_Scalpel_P_F14_1rnd_M";				//Scalpel LCDPB x1 			<LCDPB>
	_c pushBack "FIR_Scalpel_P_2rnd_M";					//Scalpel LCDPB x2 			<LCDPB>
	_c pushBack "FIR_Scalpel_P_3rnd_M";					//Scalpel LCDPB x3 			<LCDPB>
	_c pushBack "Tornado_AWS_1Rnd_LG_scalpel";			//AGM-25 SCALPEL 			<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "Tornado_AWS_3Rnd_LG_scalpel";			//AGM-25 SCALPEL x3 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "Tornado_AWS_4Rnd_LG_scalpel";			//AGM-25 SCALPEL x4 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_Hydra_P_7rnd_M")) then {
	_c pushBack "FIR_APKWS_P_7rnd_M";				//APKWS M151 HE LAU-131 x 1 			<Laser-guided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_APKWS_P_19rnd_M";				//APKWS M151 HE LAU-61/A 				<Laser-guided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_APKWS_P_14rnd_M";				//APKWS M151 HE LAU-68FA x 2 			<Laser-guided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_APKWS_P_38rnd_M";				//APKWS M151 HE LAU-61/A x 2 			<Laser-guided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_APKWS_M247_P_7rnd_M";			//APKWS M247 HEAT LAU-131 x 1 			<Laser-guided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_APKWS_M247_P_19rnd_M";			//APKWS M247 HEAT LAU-61/A 				<Laser-guided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_APKWS_M247_P_14rnd_M";			//APKWS M247 HEAT LAU-68FA x 2 			<Laser-guided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_APKWS_M247_P_38rnd_M";			//APKWS M247 HEAT LAU-61/A x 2 			<Laser-guided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_APKWS_M282_P_7rnd_M";			//APKWS M282 MPP LAU-131 x 1 			<Laser-guided rocket, 2.75-inch, MPP>
	_c pushBack "FIR_APKWS_M282_P_19rnd_M";			//APKWS M282 MPP LAU-61/A 				<Laser-guided rocket, 2.75-inch, MPP>
	_c pushBack "FIR_APKWS_M282_P_14rnd_M";			//APKWS M282 MPP LAU-68FA x 2 			<Laser-guided rocket, 2.75-inch, MPP>
	_c pushBack "FIR_APKWS_M282_P_38rnd_M";			//APKWS M282 MPP LAU-61/A x 2 			<Laser-guided rocket, 2.75-inch, MPP>
	_c pushBack "FIR_Poniard_P_7rnd_M";				//Poniard LAU-131 x 1 					<IR-guided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_LZuni_P_4rnd_M";				//Laser Zuni LAU-10 x 1 				<Laser-guided rocket, 5-inch, HE>
	_c pushBack "FIR_LZuni_P_8rnd_M";				//Laser Zuni LAU-10 x 2 				<Laser-guided rocket, 5-inch, HE>

	_c pushBack "FIR_S8KOR_P_20rnd_M";				//S-8KOR x 20 			<laser-guided rocket, 80mm>
	_c pushBack "FIR_S25L_P_1rnd_M";				//S-25-L x 1 			<Laser-guided rocket, 340mm>
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_missile_agm45_mag_x1";				//AGM-45 Shrike 				<AGM-45 Shrike Air-to-ground radiation-seeking missile>
	_c pushBack "vn_missile_agm45_02_mag_x1";			//AGM-45 Shrike 				<AGM-45 Shrike Air-to-ground radiation-seeking missile>
	_c pushBack "vn_missile_agm45_03_mag_x1";			//AGM-45 Shrike 				<AGM-45 Shrike Air-to-ground radiation-seeking missile>
	_c pushBack "vn_missile_f4_out_agm45_mag_x1";		//AGM-45 Shrike 				<AGM-45 Shrike Air-to-ground radiation-seeking missile>
	_c pushBack "vn_missile_f4_in_agm45_mag_x1";		//AGM-45 Shrike 				<AGM-45 Shrike Air-to-ground radiation-seeking missile>
	_c pushBack "vn_missile_at3_mag_01_x1";				//9M14M Malyutka (AT-3) 		<9M14M Malyutka (AT-3) Anti-tank manually-guided HEAT missile>
	_c pushBack "vn_missile_agm12c_mag_01_x1";			//AGM-12C Bullpup 				<AGM-12C Bullpup Air-to-ground guided HE missile>
	_c pushBack "vn_missile_f4_in_agm12c_mag_x1";		//AGM-12C Bullpup 				<AGM-12C Bullpup Air-to-ground guided HE missile>
	_c pushBack "vn_missile_f4_out_agm12c_mag_x1";		//AGM-12C Bullpup 				<AGM-12C Bullpup Air-to-ground guided HE missile>
	_c pushBack "vn_missile_kh66_mag_01_x1";			//KH-66 						<KH-66 Air-to-ground guided HE missile>
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

if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_mag_9K120";				//9M120 HEAT (AT-9) x8 	<9K120 SACLOS AT Guided Missile (ATGM)<br />'Ataka' (NATO: AT-9 'Spiral-2')<br />HEAT<br />Rounds: 8>
	_c pushBack "pook_mag_9K120x4";				//9M120 HEAT (AT-9) x4 	<9K120 SACLOS AT Guided Missile (ATGM)<br />'Ataka' (NATO: AT-9 'Spiral-2')<br />HEAT<br />Rounds: 4>
	_c pushBack "pook_mag_9K120x2";				//9M120 HEAT (AT-9) x2 	<9K120 SACLOS AT Guided Missile (ATGM)<br />'Ataka' (NATO: AT-9 'Spiral-2')<br />HEAT<br />Rounds: 2>
	_c pushBack "pook_mag_9K120F";				//9M120 FAE (AT-9) x8 	<9K120 SACLOS MP Guided Missile<br />'Ataka' (NATO: AT-9 'Spiral-2')<br />Type: Thermobaric Fuel-Air Explosive (FAE)<br />Rounds: 8>
	_c pushBack "pook_mag_9K120Fx4";			//9M120 FAE (AT-9) x4 	<9K120 SACLOS MP Guided Missile<br />'Ataka' (NATO: AT-9 'Spiral-2')<br />Type: Thermobaric Fuel-Air Explosive (FAE)<br />Rounds: 4>
	_c pushBack "pook_mag_9K120Fx2";			//9M120 FAE (AT-9) x2 	<9K120 SACLOS MP Guided Missile<br />'Ataka' (NATO: AT-9 'Spiral-2')<br />Type: Thermobaric Fuel-Air Explosive (FAE)<br />Rounds: 2>
	_c pushBack "pook_mag_KH38_T";				//Kh-38_MTE (IR) 		<Type: Infrared Guided A-G Missile<br />Kh-38<br />Maximum Range: 12km<br />Rounds: 1>
	_c pushBack "pook_mag_KH25MTP";				//Kh-25 MTP (AS-10) 	<Type: IR Guided Missile<br />Kh-25MTP (NATO: AS-10I)<br />Maximum Range: 10km<br />Rounds: 1>"		//Strange convex component04 in pook_missilebox\kh25\fza_kh25mtp_fly.p3d:geometryFire
	_c pushBack "pook_mag_KH29D";				//Kh-29D (AS-14) 		<Type: IR Imaging Guided Missile<br />Kh-29D (NATO: AS-14D)<br />Maximum Range: 16km<br />Rounds: 1>
	_c pushBack "pook_mag_KH25ML";				//Kh-25 ML (AS-10) 		<Type: Laser Guided Missile<br />Kh-25ML (NATO: AS-10L)<br />Maximum Range: 10km<br />Rounds: 1>
	_c pushBack "pook_mag_KH29L";				//Kh-29L (AS-14) 		<Type: Laser Guided Missile<br />Kh-29L (NATO: AS-14L)<br />Maximum Range: 16km<br />Rounds: 1>
	_c pushBack "pook_mag_KH38_L";				//Kh-38_MLE (laser) 	<Type: Laser Guided A-G Missile<br />Kh-38<br />Maximum Range: 12km<br />Rounds: 1>
};
if (isClass(configFile >> "CfgVehicles" >> "sab_f104_b")) then {
	_c pushBack "sab_milavi_1rnd_maverick_mag";				//MA AGM 65 x1 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "sab_milavi_1rnd_exocet_mag";				//MA ASM AM.39 		<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "sab_milavi_1rnd_hellfire_mag";				//MA AGM 114 x1 	<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "sab_milavi_2rnd_hellfire_mag";				//MA AGM 114 x2 	<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
	_c pushBack "sab_milavi_4rnd_hellfire_mag";				//MA AGM 114 x4 	<Short-range, laser/infrared-guided, air-to-surface missile with tandem high-explosive anti-tank warhead>
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_AGM65E_P_1rnd_M")) then {
	_c pushBack "FIR_AGM65E_P_1rnd_M";					//AGM-65E Maverick x1 		<Air to surface missile , Laser guided>
	_c pushBack "FIR_AGM65E2_P_1rnd_M";					//AGM-65E2 Maverick x1 		<Air to surface missile , Laser guided>
	_c pushBack "FIR_AGM65L_P_1rnd_M";					//AGM-65L Maverick x1 		<Air to surface missile , Laser guided>
	_c pushBack "FIR_AGM123_P_1rnd_M";					//AGM-123 Skipper II 		<Air to ground missile, Laser guided>
	_c pushBack "FIR_AGM65D_P_1rnd_M";					//AGM-65D Maverick x1 		<Air to surface missile , IR-guided>
	_c pushBack "FIR_AGM65D_P_1rnd_M_Tornado_AWS";		//AGM-65D Maverick x1 		<Air to surface missile , IR-guided>
	_c pushBack "FIR_AGM65D_P_3rnd_M";					//AGM-65D Maverick x3 		<Air to surface missile , IR-guided>
	_c pushBack "FIR_AGM65D_P_3rnd_M_Tornado_AWS";		//AGM-65D Maverick x3 		<Air to surface missile , IR-guided>
	_c pushBack "FIR_AGM65D_P_2rnd_M";					//AGM-65D Maverick x2 		<Air to surface missile , IR-guided>
	_c pushBack "FIR_AGM65F_P_1rnd_M";					//AGM-65F Maverick x1 		<Air to surface missile , IR-guided>
	_c pushBack "FIR_AGM65G_P_1rnd_M";					//AGM-65G Maverick x1 		<Air to surface missile , IR-guided>
	_c pushBack "FIR_ASM2_P_1rnd_M";					//ASM-2 					<Anti-Ship missile , IR-guided>
	_c pushBack "FIR_AGM84H_P_1rnd_M";					//AGM-84H SLAM-ER 			<Cruise missile , GPS/IR Guided>
	_c pushBack "FIR_AGM84H_P_1rnd_M_Tornado_AWS";		//AGM-84H SLAM-ER 			<Cruise missile , GPS/IR Guided>
	_c pushBack "FIR_AGM84E_P_1rnd_M";					//AGM-84E SLAM 				<Cruise missile , GPS/IR Guided>
	_c pushBack "FIR_AGM84K_P_1rnd_M";					//AGM-84K SLAM-ER 			<Cruise missile , GPS/IR Guided>
	_c pushBack "FIR_AGM158B_P_1rnd_M";					//AGM-158B JASSM-ER 		<Cruise missile , GPS/IR Guided>

	_c pushBack "FIR_9K121_P_8rnd_M";					//9K121 Vikhr x 8 			<Anti-tank missile , laser-guided>
	_c pushBack "FIR_Kh29_P_1rnd_M";					//Kh-29L 					<Air to surface missile , Laser-guided>
	_c pushBack "FIR_Kh25ML_P_1rnd_M";					//Kh-25ML 					<Air to surface missile , laser-guided>
	_c pushBack "FIR_Kh25MTP_P_1rnd_M";					//Kh-25MTP 					<Air to surface missile , IR-guided>
	_c pushBack "FIR_Kh29D_P_1rnd_M";					//Kh-29D 					<Air to surface missile , IR-guided>
	_c pushBack "FIR_Kh25MS_P_1rnd_M";					//Kh-25MS 					<Air to surface missile , GLONASS guided>
};
if (isClass(configFile >> "CfgMagazines" >> "tu95_1Rnd_Kh65")) then {
	_c pushBack "tu95_1Rnd_Kh65";				//Kh-65 (AS-15) 			<Type: Tactical Air-Surface Missile (TASM)<br />Kh-65 NATO:('AS-15')<br />Rounds: 1<br />Warhead: HE>
	_c pushBack "tu95_2Rnd_Kh65";				//Kh-65 (AS-15) x2 			<Type: Tactical Air-Surface Missile (TASM)<br />Kh-65 NATO:('AS-15')<br />Rounds: 2<br />Warhead: HE>
	_c pushBack "tu95_3Rnd_Kh65";				//Kh-65 (AS-15) x3 			<Type: Tactical Air-Surface Missile (TASM)<br />Kh-65 NATO:('AS-15')<br />Rounds: 3<br />Warhead: HE>
	_c pushBack "tu95_6Rnd_Kh65";				//Kh-65 (AS-15) x6 			<Type: Tactical Air-Surface Missile (TASM)<br />Kh-65 NATO:('AS-15')<br />Rounds: 6<br />Warhead: HE>
	_c pushBack "tu95_1Rnd_Kh101";				//Kh-101 					<Type: Tactical Air-Surface Missile (TASM)<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu95_2Rnd_Kh101";				//Kh-101 (x2) 				<Type: Tactical Air-Surface Missile (TASM)<br />Rounds: 2<br />Warhead: HE-Penetrator>
	_c pushBack "tu95_6Rnd_Kh101";				//Kh-101 (x6) 				<Type: Tactical Air-Surface Missile (TASM)<br />Rounds: 6<br />Warhead: HE-Penetrator>
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_missile_agm88_rail_mag_x1";			//AGM-88C HARM x1 				<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
	_c pushBack "vn_missile_agm88_mag_x1";				//AGM-88C HARM x1 				<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
	_c pushBack "vn_missile_f4_out_agm88_mag_x1";		//AGM-88C HARM x1 				<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
	_c pushBack "vn_missile_f4_in_agm88_mag_x1";		//AGM-88C HARM x1 				<Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead>
	_c pushBack "vn_missile_agm65_rail_mag_x1";			//Macer II AGM x1 				<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
	_c pushBack "vn_missile_agm65_rail_mag_x2";			//Macer II AGM x2 				<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
	_c pushBack "vn_missile_agm65_rail_mag_x3";			//Macer II AGM x3 				<Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>
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
if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_AGM88_mag1x";					//AGM-88 ARM 			<Type: Anti-Radar Homing Missile<br />Homes in on SAM and AAA Radars<br />Rounds: 1x HE-Frag Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_SCALP_mag1x";					//SCALP-ER 				<Type: ER-CALCM<br />Extended-Range Conventional Air-Launched Cruise Missile<br />Rounds: 1x HE Penetrator Warhead<br />Used in: EF-2000>
};
if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_mag_KH38_G";				//Kh-38_MAE (GLONASS) 	<Type: GPS Guided Missile<br />Kh-38<br />Maximum Range: 12km<br />Rounds: 1>
	_c pushBack "pook_mag_KH25MSE";				//Kh-25 MSE (AS-10) 	<Type: GPS Guided Missile<br />Kh-25MSE (NATO: AS-10G)<br />Maximum Range: 10km<br />Rounds: 1>
	_c pushBack "pook_mag_KH23M";				//Kh-23 (AS-7) 			<Type: Radar Guided Missile<br />Kh-23M (NATO: AS-7)<br />Maximum Range: 9km<br />Rounds: 1>
	//_c pushBack "pook_mag_KH23Mx2_SU22";		//Kh-23 (AS-7) x2 		<Type: Radar Guided Missile<br />Kh-23M (NATO: AS-7)<br />Maximum Range: 9km<br />Rounds: 2>"		//wrong 'pylonWeapon' in magazine:'pook_mag_KH23Mx2_SU22' this magazine cannot be used in weapon'pook_AS7Launcher'
	_c pushBack "pook_mag_KH25MAE";				//Kh-25 MAE (AS-10) 	<Type: Radar Guided Missile<br />Kh-25MAE (NATO: AS-10R)<br />Maximum Range: 10km<br />Rounds: 1>"		//Strange convex component04 in pook_missilebox\kh25\fza_kh25mr_fly.p3d:geometryFire
	_c pushBack "pook_mag_KH59M";				//Kh-59M (AS-18) 		<Type: Radar Guided Missile<br />Kh-59M (NATO: AS-18)<br />Maximum Range: 115km<br />Rounds: 1<br />Requires APK-9 TGT Pod<br />for extended-range attacks>
	_c pushBack "pook_mag_KH59MK2";				//Kh-59MK2 (AS-22) 		<Type: Radar Guided Missile<br />Kh-59Mk2 (NATO: AS-22)<br />Maximum Range: 115km<br />Rounds: 1<br />For extended-range attacks>
	_c pushBack "pook_mag_KH31";				//Kh-31 (AS-17) 		<Type: Radar Guided Missile<br />Kh-31 (NATO: AS-17)<br />Maximum Range: 110km<br />Rounds: 1>
	_c pushBack "pook_mag_KH31x2";				//Kh-31 (AS-17) x2 		<Type: Radar Guided Missile<br />Kh-31 (NATO: AS-17)<br />Maximum Range: 110km<br />Rounds: 2>
	_c pushBack "pook_mag_KH35";				//Kh-35 (AS-20) 		<Type: Radar Guided Missile<br />Kh-35 (NATO: AS-20)<br />Maximum Range: 130km<br />Rounds: 1>"		//Strange convex component09 in pook_missilebox\kh35\kh35_fly.p3d:geometryFire
	_c pushBack "pook_mag_KH38_R";				//Kh-38_MAE (radar) 	<Type: Radar Guided Missile<br />Kh-38<br />Maximum Range: 12km<br />Rounds: 1>
	_c pushBack "pook_mag_KH61";				//Kh-61 				<Type: Radar Guided Long-Range Anti-Shipping Missile (LRASM)<br />Kh-61 'Onyks'<br />Maximum Range: 120km<br />Rounds: 1>"		//Strange convex component12 in pook_missilebox\kh61\s800_fly.p3d:geometryFire
	_c pushBack "pook_mag_KH58";				//Kh-58 (AS-11) 		<Type: Anti-Radar Homing Missile (ARM)<br />Kh-58 (NATO: AS-11)<br />Rounds: 1<br />Use L-081 'Fantasmagoria' or Vyuga-17 ARM Targeting Pods for extended-range targeting>"		//Strange convex component05 in pook_missilebox\kh58\kh58_fly.p3d:geometryFire
	_c pushBack "pook_mag_KH25MP";				//Kh-25MP (AS-12) 		<Type: Anti-Radar Homing Missile<br />Kh-25MP (NATO: AS-12)<br />Rounds: 1>
	_c pushBack "pook_mag_KH31P";				//Kh-31P (AS-17) 		<Type: Anti-Radar Homing Missile<br />Kh-31P (NATO: AS-17)<br />Rounds: 1>
	_c pushBack "pook_mag_KH31Px2";				//Kh-31P (AS-17) x2 	<Type: Anti-Radar Homing Missile<br />Kh-31P (NATO: AS-17)<br />Rounds: 2>
	_c pushBack "pook_mag_KH28";				//Kh-28 (AS-9) 			<Type: Anti-Radar Homing Missile<br />Kh-28 (NATO: AS-9)<br />Rounds: 1>
	_c pushBack "pook_mag_KH59";				//Kh-59 (AS-13) 		<Type: TV Guided Missile<br />Kh-59 (NATO: AS-13)<br />Maximum Range: 40km<br />Rounds: 1<br />Requires APK-9 TGT Pod<br />for extended-range attacks>
	_c pushBack "pook_mag_KH25MT";				//Kh-25 MT (AS-10) 		<Type: TV Guided Missile<br />Kh-25MT (NATO: AS-10T)<br />Maximum Range: 10km<br />Rounds: 1>"		//Strange convex component04 in pook_missilebox\kh25\fza_kh25mt_fly.p3d:geometryFire
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_AGM65H_P_1rnd_M")) then {
	_c pushBack "FIR_AGM65H_P_1rnd_M";					//AGM-65H Maverick x1 		<Air to surface missile , EO guided>
	_c pushBack "FIR_AGM65H_P_1rnd_M_Tornado_AWS";		//AGM-65H Maverick x1 		<Air to surface missile , EO guided>
	_c pushBack "FIR_AGM65H_P_3rnd_M";					//AGM-65H Maverick x3 		<Air to surface missile , EO guided>
	_c pushBack "FIR_AGM65H_P_3rnd_M_Tornado_AWS";		//AGM-65H Maverick x3 		<Air to surface missile , EO guided>
	_c pushBack "FIR_AGM65B_P_1rnd_M";					//AGM-65B Maverick x1 		<Air to surface missile , EO-TV guided>
	_c pushBack "FIR_AGM65B_P_2rnd_M";					//AGM-65B Maverick x2 		<Air to surface missile , EO-TV guided>
	_c pushBack "FIR_AGM65B_P_3rnd_M";					//AGM-65B Maverick x3 		<Air to surface missile , EO-TV guided>
	_c pushBack "FIR_AGM65H_P_2rnd_M";					//AGM-65H Maverick x2 		<Air to surface missile , EO guided>
	_c pushBack "FIR_AGM65K_P_1rnd_M";					//AGM-65K Maverick x1 		<Air to surface missile , EO guided>
	_c pushBack "FIR_AGM84D_P_1rnd_M";					//AGM-84D Harpoon 			<Air-to-ship/surface missile, Active radar guided. It's designed on destroying the ship, but also can use for destroying ground unit too.>
	_c pushBack "FIR_ASM1_P_1rnd_M";					//ASM-1 					<Anti-Ship missile , Active radar-guided>
	_c pushBack "FIR_Brimstone_std_P_3rnd_M";			//Brimstone x3 				<Air to surface missile , radar-guided>
	_c pushBack "FIR_Brimstone_type1_P_3rnd_M";			//Brimstone x3 				<Air to surface missile , radar-guided>
	_c pushBack "FIR_Brimstone_type2_P_3rnd_M";			//Brimstone x3 				<Air to surface missile , radar-guided>
	_c pushBack "FIR_Brimstone_DM_std_P_3rnd_M";		//Brimstone Dual-mode x3 	<Air to surface missile , radar/laser guided>
	_c pushBack "FIR_Brimstone_DM_type1_P_3rnd_M";		//Brimstone Dual-mode x3 	<Air to surface missile , radar/laser guided>
	_c pushBack "FIR_Brimstone_DM_type2_P_3rnd_M";		//Brimstone Dual-mode x3 	<Air to surface missile , radar/laser guided>
	_c pushBack "FIR_AGM88_P_1rnd_M";					//AGM-88 HARM 				<Anti-Radiation Missile>
	_c pushBack "FIR_AGM88_P_1rnd_M_Tornado_AWS";		//AGM-88 HARM 				<Anti-Radiation Missile>
	//ground to air?
	_c pushBack "FIR_RIM162_P_9rnd_M";					//RIM-162 ESSM x9 				<ESSM>	semi-active radar homing
	_c pushBack "FIR_RIM162_P_36rnd_M";					//RIM-162 ESSM x36 				<ESSM>	semi-active radar homing
	_c pushBack "FIR_SM2_BLK3C_P_9rnd_M";				//SM-2 Block IIIC Canisters x9 	<SM-2 Blk IIIC>
	_c pushBack "FIR_SM2_BLK4_P_9rnd_M";				//SM-2 Block IV Canisters x9 	<SM-2 Blk IV>

	_c pushBack "FIR_Kh29T_P_1rnd_M";					//Kh-29T 					<Air to surface missile , EO guided>
	_c pushBack "FIR_Kh25MT_P_1rnd_M";					//Kh-25MT 					<Air to surface missile , EO guided>
	_c pushBack "FIR_Kh25MPU_P_1rnd_M";					//Kh-25MPU 					<Anti-Radiation Missile>
	_c pushBack "FIR_CruiseMissile_01_P_9rnd_M";			//Cruise Missile HE 	<Long-range, data link guided, surface-to-surface missile with high-explosive warhead>
	_c pushBack "FIR_CruiseMissile_01_Cluster_P_9rnd_M";	//Cruise Missile Cluster <Long-range, data link guided, surface-to-surface missile with cluster munitions>
};
if (isClass(configFile >> "CfgMagazines" >> "tu95_1Rnd_3M80")) then {
	_c pushBack "tu95_1Rnd_3M80";				//Kh-41 (3M80) Moskit ASM 	<Type: Long-Range Anti-Shipping Missile (LRASM)<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu95_1Rnd_Kh22";				//Kh-22 (AS-4) ASM 			<Type: Long-Range Anti-Shipping Missile (LRASM)<br />Kh-22 NATO:('AS-4')<br />Rounds: 1<br />Warhead: HE-Penetrator>		//Strange convex component01 in pook_tu16\wep\kh22_fly.p3d:geometry
	_c pushBack "tu22_1Rnd_Kh22";				//Kh-22 (AS-4) ASM 			<Type: Long-Range Anti-Shipping Missile (LRASM)<br />Kh-22 NATO:('AS-4')<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu22_1Rnd_Kh22_CL";			//Kh-22 (AS-4) ASM 			<Type: Long-Range Anti-Shipping Missile (LRASM)<br />Kh-22 NATO:('AS-4')<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu95_1Rnd_Kh32";				//Kh-32 ASM 				<Type: Extended Long-Range Anti-Shipping Missile (LRASM)<br />Kh-32 NATO:('AS-4')<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu22_1Rnd_Kh32";				//Kh-32 ASM 				<Type: Extended Long-Range Anti-Shipping Missile (LRASM)<br />Kh-32 NATO:('AS-4')<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu22_1Rnd_Kh32_CL";			//Kh-32 ASM 				<Type: Extended Long-Range Anti-Shipping Missile (LRASM)<br />Kh-32 NATO:('AS-4')<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu95_1Rnd_Kh15S";				//Kh-15/S (AS-16) HE 		<Type: Long-Range Air-Surface Guided Missile (LRAGM)<br />Kh-15S NATO:('AS-16')<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu95_6Rnd_Kh15S";				//Kh-15/S (AS-16) HE x6 	<Type: Long-Range Air-Surface Guided Missile (LRAGM)<br />Kh-15S NATO:('AS-16')<br />Rounds: 6<br />Warhead: HE-Penetrator>
	_c pushBack "tu160_12Rnd_Kh15S";			//Kh-15/S (AS-16) HE x12 	<Type: Long-Range Air-Surface Guided Missile (LRAGM)<br />Kh-15S NATO:('AS-16')<br />Rounds: 12<br />Warhead: HE-Penetrator>
	_c pushBack "tu95_1Rnd_Kh15P";				//Kh-15/P (AS-16) ARM 		<Type: Long-Range Anti-Radiation Missile (LRARM)<br />Kh-15P NATO:('AS-16')<br />Rounds: 1x Radar Homing Missile<br />Warhead: HE-Fragmentation>
	_c pushBack "tu95_6Rnd_Kh15P";				//Kh-15/P (AS-16) ARM x6 	<Type: Long-Range Anti-Radiation Missile (LRARM)<br />Kh-15P NATO:('AS-16')<br />Rounds: 6x Radar Homing Missiles<br />Warhead: HE-Fragmentation>
	_c pushBack "tu160_12Rnd_Kh15P";			//Kh-15/P (AS-16) ARM x12 	<Type: Long-Range Anti-Radiation Missile (LRARM)<br />Kh-15P NATO:('AS-16')<br />Rounds: 12x Radar Homing Missiles<br />Warhead: HE-Fragmentation>
	_c pushBack "tu16_1Rnd_KSR2";				//KSR-2 (AS-5) ASM 			<Type: Long-Range Anti-Shipping Missile (LRASM)<br />KSR-2 NATO:('AS-5')<br />Rounds: 1<br />Warhead: HE-Penetrator>
	_c pushBack "tu16_1Rnd_K10";				//K-10 (AS-2) ASM 			<Type: Long-Range Anti-Shipping Missile (LRASM)<br />K-10 NATO:('AS-2')<br />Rounds: 1<br />Warhead: HE-Penetrator>
};
if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_Brimstone_mag3x";				//Brimstone-AGM x3 		<Type: Radar-Guided AGM <br />Rounds: 3x HE-AT Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_Brimstone_mag2x";				//Brimstone-AGM x2 		<Type: Radar-Guided AGM <br />Rounds: 2x HE-AT Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_BrimstoneDM_mag3x";			//Brimstone-DM-AGM x3 	<Type: Dual-Mode Radar\Laser-Guided AGM<br />Rounds: 3x HE-AT Warhead<br />Used in: EF-2000>
	_c pushBack "EF2K_BrimstoneDM_mag2x";			//Brimstone-DM-AGM x2 	<Type: Dual-Mode Radar\Laser-Guided AGM<br />Rounds: 2x HE-AT Warhead<br />Used in: EF-2000>
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*4****************************************************************************
if(CTI_RHS_ADDON > 0) then {
	_tech_level = 4;

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

if (isClass(configFile >> "CfgMagazines" >> "tu95_1Rnd_Kh55")) then {
	_tech_level = 4;

	_c pushBack "tu95_1Rnd_Kh55";				//Kh-55 (AS-15) 			<Type: Air-Launched Cruise Missile (ALCM)<br />Kh-55 NATO:('AS-15')<br />Rounds: 1<br />Warhead: Nuclear 200kt>
	_c pushBack "tu95_6Rnd_Kh55";				//Kh-55 (AS-15) x6 			<Type: Air-Launched Cruise Missile (ALCM)<br />Kh-65 NATO:('AS-15')<br />Rounds: 6<br />Warhead: Nuclear 200kt>
	//_c pushBack "tu95_sonobuoy_24xmag";			//RGB-N Sonobuoy (x24) 		<Type: Air-Launched Sonobuoy<br />Range: 3nm<br />Lifespan: 2 minutes>"		//wrong 'pylonWeapon' in magazine:'tu95_sonobuoy_24xmag' this magazine cannot be used in weapon'tu95bomblauncher'
	//_c pushBack "tu95_sonobuoy_12xmag";			//RGB-N Sonobuoy (x12) 		<Type: Air-Launched Sonobuoy<br />Range: 3nm<br />Lifespan: 2 minutes>"		//wrong 'pylonWeapon' in magazine:'tu95_sonobuoy_12xmag' this magazine cannot be used in weapon'tu95bomblauncher'
	//_c pushBack "tu95_sonobuoy_6xmag";			//RGB-N Sonobuoy (x6) 		<Type: Air-Launched Sonobuoy<br />Range: 3nm<br />Lifespan: 2 minutes>"		//wrong 'pylonWeapon' in magazine:'tu95_sonobuoy_6xmag' this magazine cannot be used in weapon'tu95bomblauncher'
	//_c pushBack "tu95_sonobuoy_4xmag";			//RGB-N Sonobuoy (x4) 		<Type: Air-Launched Sonobuoy<br />Range: 3nm<br />Lifespan: 2 minutes>"		//wrong 'pylonWeapon' in magazine:'tu95_sonobuoy_4xmag' this magazine cannot be used in weapon'tu95bomblauncher'
	//_c pushBack "tu95_sonobuoy_2xmag";			//RGB-N Sonobuoy (x2) 		<Type: Air-Launched Sonobuoy<br />Range: 3nm<br />Lifespan: 2 minutes>"		//wrong 'pylonWeapon' in magazine:'tu95_sonobuoy_2xmag' this magazine cannot be used in weapon'tu95bomblauncher'
	//_c pushBack "tu95_sonobuoy_1xmag";			//RGB-N Sonobuoy 			<Type: Air-Launched Sonobuoy<br />Range: 3nm<br />Lifespan: 2 minutes>"		//wrong 'pylonWeapon' in magazine:'tu95_sonobuoy_1xmag' this magazine cannot be used in weapon'tu95bomblauncher'

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
if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_68mm_HE_x18";			//68mm RKT HE x18 <Type: Rocket Pod<br />Rounds: 18x 2.7-inch HE-Frag Rockets<br />90 lb.<br />Used in: EF-2000>
	_c pushBack "EF2K_68mm_SMK_x5";			//68mm Smoke Rocket x5 <Type: Rocket Pod<br />Rounds: 18x 2.7-inch HE-Frag Rockets<br />90 lb.<br />Used in: EF-2000>
};
if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_80mm_HE_x18";			//S-8 80mm HE x18 			<Type: S-8 80mm Rocket Pod<br />Rounds: 18<br />High Explosive warhead>
	_c pushBack "pook_80mm_SMK_x5";			//S-8 80mm Smoke x5 		<Type: S-8 80mm Rocket Pod SMOKE MARKERS - White<br />Rounds: 5<br />Smoke Marker warhead>
	_c pushBack "pook_80mm_SMK_O_x5";		//S-8 80mm Smoke Orange x5 	<Type: S-8 80mm Rocket Pod SMOKE MARKERS - Orange<br />Rounds: 5<br />Smoke Marker warhead>
	_c pushBack "pook_80mm_SMK_P_x5";		//S-8 80mm Smoke Purple x5 	<Type: S-8 80mm Rocket Pod SMOKE MARKERS - Purple<br />Rounds: 5<br />Smoke Marker warhead>
	_c pushBack "pook_122mm_HE_x5";			//S-13 122mm Rockets HE x5 	<Type: S-13 HE 122mm Rocket Pod<br />Rounds: 5<br />High Explosive warhead>
	_c pushBack "pook_S24_x1";				//S-24 HE x1 				<Type: S-24 240mm Rocket<br />Rounds: 1<br />High Explosive warhead>
	_c pushBack "pook_S25_Ox1";				//S-25_O HE-Frag x1 		<Type: S-25-O 340mm HE-Frag Rocket<br />Rounds: 1<br />Anti-personnel blast-fragmentation warhead>		//Strange convex component10 in pook_missilebox\rockets\s25_o_fly.p3d:geometry
	_c pushBack "pook_S25_Ox2";				//S-25_O HE-Frag x2 		<Type: S-25-O 340mm HE-Frag Rocket<br />Rounds: 2<br />Anti-personnel blast-fragmentation warhead>
	_c pushBack "pook_S25_OFMx1";			//S-25_OFM HE x1 			<Type: S-25-OFM 340mm HE Rocket<br />Rounds: 1<br />HE penetrator warhead>
	_c pushBack "pook_S25_OFMx2";			//S-25_OFM HE x2 			<Type: S-25-OFM 340mm HE Rocket<br />Rounds: 2<br />HE penetrator warhead>
	_c pushBack "pook_S25_Lx1";				//S-25_L HE x1 				<Type: S-25-L 340mm HE Rocket<br />Laser Guided Targeting<br /><br />Rounds: 1<br />HE penetrator warhead>
	_c pushBack "pook_S25_Lx2";				//S-25_L HE x2 				<Type: S-25-L 340mm HE Rocket<br />Laser Guided Targeting<br /><br />Rounds: 2<br />HE penetrator warhead>
};
if (isClass(configFile >> "CfgVehicles" >> "sab_f104_b")) then {
	_c pushBack "sab_milavi_4rnd_zuni_mag";			//MA RKT Zuni x4 	<Unguided rockets with high-explosive warhead>
	_c pushBack "sab_milavi_7rnd_hydra_mag";		//MA RKT Hydra x7 	<Unguided rockets with high-explosive warhead>
};
if (isClass(configFile >> "CfgMagazines" >> "PylonRack_Rocket_S8_JS_SU35_x20")) then {
	_c pushBack "PylonRack_Rocket_S8_JS_SU35_x20";	//S8 HE x20 <Unguided rockets with high-explosive warhead>
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_CRV7_P_19rnd_M")) then {
	_c pushBack "FIR_CRV7_P_19rnd_M";				//CRV7 x 19 							<unguided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_Hydra_P_7rnd_M";				//Hydra 70 M151 HE LAU-131 x 1 			<unguided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_Hydra_P_19rnd_M";				//Hydra 70 M151 HE LAU-3 				<unguided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_Hydra_LAU130_P_19rnd_M";		//Hydra 70 M151 HE LAU-61/A 			<unguided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_Hydra_P_21rnd_M";				//Hydra 70 M151 HE LAU-131 x 3 			<unguided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_Hydra_P_14rnd_M";				//Hydra 70 M151 HE LAU-68FA x 2 		<unguided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_Hydra_P_38rnd_M";				//Hydra 70 M151 HE LAU-61/A x 2 		<unguided rocket, 2.75-inch, HEPD>
	_c pushBack "FIR_Hydra_M229_P_7rnd_M";			//Hydra 70 M229 HE LAU-131 x 1 			<unguided rocket, 2.75-inch, HE>
	_c pushBack "FIR_Hydra_M229_P_19rnd_M";			//Hydra 70 M229 HE LAU-61/A 			<unguided rocket, 2.75-inch, HE>
	_c pushBack "FIR_Hydra_M229_P_14rnd_M";			//Hydra 70 M229 HE LAU-68FA x 2 		<unguided rocket, 2.75-inch, HE>
	_c pushBack "FIR_Hydra_M229_P_38rnd_M";			//Hydra 70 M229 HE LAU-61/A x 2 		<unguided rocket, 2.75-inch, HE>
	_c pushBack "FIR_Hydra_M247_P_7rnd_M";			//Hydra 70 M247 HEAT LAU-131 x 1 		<unguided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_Hydra_M247_P_19rnd_M";			//Hydra 70 M247 HEAT LAU-61/A 			<unguided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_Hydra_M247_P_14rnd_M";			//Hydra 70 M247 HEAT LAU-68FA x 2 		<unguided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_Hydra_M247_P_38rnd_M";			//Hydra 70 M247 HEAT LAU-61/A x 2 		<unguided rocket, 2.75-inch, HEAT>
	_c pushBack "FIR_Hydra_M257_P_7rnd_M";			//Hydra 70 M257 FLARE LAU-131 x 1 		<unguided rocket, 2.75-inch, FLARE>
	_c pushBack "FIR_Hydra_M278_P_7rnd_M";			//Hydra 70 M278 IR FLARE LAU-131 x 1 	<unguided rocket, 2.75-inch, IR FLARE>
	_c pushBack "FIR_Hydra_M261_P_7rnd_M";			//Hydra 70 M261 MPSM LAU-131 x 1 		<unguided rocket, 2.75-inch, HE Cluster>
	_c pushBack "FIR_Hydra_M261_P_19rnd_M";			//Hydra 70 M261 MPSM LAU-61/A 			<unguided rocket, 2.75-inch, HE Cluster>
	_c pushBack "FIR_Hydra_M261_P_14rnd_M";			//Hydra 70 M261 MPSM LAU-68FA x 2 		<unguided rocket, 2.75-inch, HE Cluster>
	_c pushBack "FIR_Hydra_M261_P_38rnd_M";			//Hydra 70 M261 MPSM LAU-61/A x 2 		<unguided rocket, 2.75-inch, HE Cluster>
	_c pushBack "FIR_Hydra_M282_P_7rnd_M";			//Hydra 70 M282 MPP LAU-131 x 1 		<unguided rocket, 2.75-inch, Penetrator>
	_c pushBack "FIR_Hydra_M282_P_19rnd_M";			//Hydra 70 M282 MPP LAU-61/A 			<unguided rocket, 2.75-inch, Penetrator>
	_c pushBack "FIR_Hydra_M282_P_14rnd_M";			//Hydra 70 M282 MPP LAU-68FA x 2 		<unguided rocket, 2.75-inch, Penetrator>
	_c pushBack "FIR_Hydra_M282_P_38rnd_M";			//Hydra 70 M282 MPP LAU-61/A x 2 		<unguided rocket, 2.75-inch, Penetrator>
	_c pushBack "FIR_Hydra_WDU4_P_7rnd_M";			//Hydra 70 WDU-4/A APERS LAU-131 x 1 	<unguided rocket, 2.75-inch, APERS>
	_c pushBack "FIR_Hydra_WDU4_P_19rnd_M";			//Hydra 70 WDU-4/A APERS LAU-61/A 		<unguided rocket, 2.75-inch, APERS>
	_c pushBack "FIR_Hydra_WDU4_P_14rnd_M";			//Hydra 70 WDU-4/A APERS LAU-68FA x 2 	<unguided rocket, 2.75-inch, APERS>
	_c pushBack "FIR_Hydra_WDU4_P_38rnd_M";			//Hydra 70 WDU-4/A APERS LAU-61/A x 2 	<unguided rocket, 2.75-inch, APERS>
	_c pushBack "FIR_Hydra_WP_P_7rnd_M";			//Hydra 70 M156 WP LAU-131 x 1 			<unguided rocket, 2.75-inch, WP Smoke>
	_c pushBack "FIR_Hydra_WP_P_21rnd_M";			//Hydra 70 M156 WP LAU-131 x 3 			<unguided rocket, 2.75-inch, WP Smoke>
	_c pushBack "FIR_Hydra_M259_P_7rnd_M";			//Hydra 70 M259 WP LAU-131 x 1 			<unguided rocket, 2.75-inch, WP Smoke>
	_c pushBack "FIR_Hydra_Smoke_P_7rnd_M";			//Hydra 70 M264 RP LAU-131 x 1 			<unguided rocket, 2.75-inch, RP Smoke>
	_c pushBack "FIR_Hydra_Smoke_P_21rnd_M";		//Hydra 70 M264 RP LAU-131 x 3 			<unguided rocket, 2.75-inch, RP Smoke>
	_c pushBack "FIR_Zuni_P_4rnd_M";				//Zuni Mk24 MOD 1 HE LAU-10 x 1 		<un-guided rocket, 5-inch, HE>
	_c pushBack "FIR_Zuni_P_8rnd_M";				//Zuni Mk24 MOD 1 HE LAU-10 x 2 		<un-guided rocket, 5-inch, HE>
	_c pushBack "FIR_Zuni_Fairing_P_4rnd_M";		//Zuni Mk24 MOD 1 HE LAU-10 x 1(Fairing) <un-guided rocket, 5-inch, HE>
	_c pushBack "FIR_Zuni_Fairing_P_8rnd_M";		//Zuni Mk24 MOD 1 HE LAU-10 x 2(Fairing) <un-guided rocket, 5-inch, HE>
	_c pushBack "FIR_Zuni_F14_P_4rnd_M";			//Zuni Mk24 MOD 1 HE LAU-10 x 1 		<un-guided rocket, 5-inch, HE>
	_c pushBack "FIR_Zuni_Mk32_P_4rnd_M";			//Zuni Mk32 MOD 0 HEAT LAU-10 x 1 		<un-guided rocket, 5-inch, HEAT>
	_c pushBack "FIR_Zuni_Mk32_P_8rnd_M";			//Zuni Mk32 MOD 0 HEAT LAU-10 x 2 		<un-guided rocket, 5-inch, HEAT>
	_c pushBack "FIR_Zuni_Fairing_Mk32_P_4rnd_M";	//Zuni Mk32 MOD 0 HEAT LAU-10 x 1(Fairing) <un-guided rocket, 5-inch, HEAT>
	_c pushBack "FIR_Zuni_Fairing_Mk32_P_8rnd_M";	//Zuni Mk32 MOD 0 HEAT LAU-10 x 2(Fairing) <un-guided rocket, 5-inch, HEAT>
	_c pushBack "FIR_Zuni_Mk32_F14_P_4rnd_M";		//Zuni Mk32 MOD 0 HEAT LAU-10 x 1 		<un-guided rocket, 5-inch, HEAT>

	_c pushBack "FIR_S8KOM_P_20rnd_M";				//S-8KOM x 20 			<unguided rocket, 80mm>
	_c pushBack "FIR_S8S_P_20rnd_M";				//S-8S x 20 			<unguided rocket, 80mm, APERS>
	_c pushBack "FIR_S8TsM_P_20rnd_M";				//S-8TsM x 20 Smoke 	<unguided rocket, 80mm Smoke>
	_c pushBack "FIR_S13_P_5rnd_M";					//S-13 x 5 				<unguided rocket, 122mm>
	_c pushBack "FIR_S25OF_P_1rnd_M";				//S-25-OF x 1 			<unguided rocket, 340mm, HE Frag>
	_c pushBack "FIR_S25OFM_P_1rnd_M";				//S-25-OFM x 1 			<unguided rocket, 340mm, Penetrator>
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_rocket_s5_heat_x16";								//16x S-5KO 57mm HE/FRAG 		<16x S-5KO 57mm unguided rockets with high-explosive fragmentation warhead>
	_c pushBack "vn_rocket_s5_he_x16";									//16x S-5K 57mm HE 				<16x S-5K 57mm unguided rockets with high-explosive warhead>
	_c pushBack "vn_rocket_s5_fl_x16";									//16x S-5S 57mm FL 				<16x S-5S 57mm unguided rockets with flechette warhead>
	
	_c pushBack "vn_rocket_ffar_m151_he_x4";							//4x M151 2.75in 10lb HE 		<4x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m151_he_x7";							//7x M151 2.75in 10lb HE 		<7x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_lau59_m151_he_x7";						//7x M151 2.75in 10lb HE 		<7x M151 2.75in unguided rockets with 10lb high explosive warhead (LAU59)>
	_c pushBack "vn_rocket_ffar_f4_lau59_m151_he_x7";					//7x M151 2.75in 10lb HE 		<7x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_m151_he_x7";				//7x M151 2.75in 10lb HE 		<7x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_m151_he_x7";				//7x M151 2.75in 10lb HE 		<7x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_lau59_m151_he_x21";					//21x M151 2.75in 10lb HE 		<21x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_m151_he_x21";				//21x M151 2.75in 10lb HE 		<21x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_m151_he_x21";				//21x M151 2.75in 10lb HE 		<21x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m151_he_x19";							//19x M151 2.75in 10lb HE 		<19x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_m151_he_x19";					//19x M151 2.75in 10lb HE 		<19x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_m151_he_x19";				//19x M151 2.75in 10lb HE 		<19x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_m151_he_x19";				//19x M151 2.75in 10lb HE 		<19x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_m151_he_x57";					//57x M151 2.75in 10lb HE 		<57x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_m151_he_x57";				//57x M151 2.75in 10lb HE 		<57x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_m151_he_x57";				//57x M151 2.75in 10lb HE 		<57x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m151_he_x12_01";						//12x M151 2.75in 10lb HE 		<12x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m151_he_x12_02";						//12x M151 2.75in 10lb HE 		<12x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m151_he_x24_01";						//24x M151 2.75in 10lb HE 		<24x M151 2.75in unguided rockets with 10lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m151_he_x24_02";						//24x M151 2.75in 10lb HE 		<24x M151 2.75in unguided rockets with 10lb high explosive warhead>

	_c pushBack "vn_rocket_ffar_m156_wp_x4";							//4x M156 2.75in WP 			<4x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_m156_wp_x7";							//7x M156 2.75in WP 			<7x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_lau59_m156_wp_x7";						//7x M156 2.75in WP 			<7x M156 2.75in unguided rockets with white phosphorus warhead (LAU59)>
	_c pushBack "vn_rocket_ffar_f4_lau59_m156_wp_x7";					//7x M156 2.75in WP 			<7x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_m156_wp_x7";				//7x M156 2.75in WP 			<7x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_m156_wp_x7";				//7x M156 2.75in WP 			<7x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_lau59_m156_wp_x21";					//21x M156 2.75in WP 			<21x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_m156_wp_x21";				//21x M156 2.75in WP 			<21x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_m156_wp_x21";				//21x M156 2.75in WP 			<21x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_m156_wp_x19";							//19x M156 2.75in WP 			<19x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_m156_wp_x19";					//19x M156 2.75in WP 			<19x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_m156_wp_x19";				//19x M156 2.75in WP 			<19x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_m156_wp_x19";				//19x M156 2.75in WP 			<19x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_m156_wp_x57";					//57x M156 2.75in WP 			<57x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_m156_wp_x57";				//57x M156 2.75in WP 			<57x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_m156_wp_x57";				//57x M156 2.75in WP 			<57x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_m156_wp_x12_01";						//12x M156 2.75in WP 			<12x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_m156_wp_x12_02";						//12x M156 2.75in WP 			<12x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_m156_wp_x24_01";						//24x M156 2.75in WP 			<24x M156 2.75in unguided rockets with white phosphorus warhead>
	_c pushBack "vn_rocket_ffar_m156_wp_x24_02";						//24x M156 2.75in WP 			<24x M156 2.75in unguided rockets with white phosphorus warhead>

	_c pushBack "vn_rocket_ffar_m229_he_x4";							//4x M229 2.75in 17lb HE 		<4x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m229_he_x7";							//7x M229 2.75in 17lb HE 		<7x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_lau59_m229_he_x7";						//7x M229 2.75in 17lb HE 		<7x M229 2.75in unguided rockets with 17lb high explosive warhead (LAU59)>
	_c pushBack "vn_rocket_ffar_f4_lau59_m229_he_x7";					//7x M229 2.75in 17lb HE 		<7x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_m229_he_x7";				//7x M229 2.75in 17lb HE 		<7x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_m229_he_x7";				//7x M229 2.75in 17lb HE 		<7x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_lau59_m229_he_x21";					//21x M229 2.75in 17lb HE 		<21x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_m229_he_x21";				//21x M229 2.75in 17lb HE 		<21x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_m229_he_x21";				//21x M229 2.75in 17lb HE 		<21x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m229_he_x19";							//19x M229 2.75in 17lb HE 		<19x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_m229_he_x19";					//19x M229 2.75in 17lb HE 		<19x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_m229_he_x19";				//19x M229 2.75in 17lb HE 		<19x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_m229_he_x19";				//19x M229 2.75in 17lb HE 		<19x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_m229_he_x57";					//57x M229 2.75in 17lb HE 		<57x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_m229_he_x57";				//57x M229 2.75in 17lb HE 		<57x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_m229_he_x57";				//57x M229 2.75in 17lb HE 		<57x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m229_he_x12_01";						//12x M229 2.75in 17lb HE 		<12x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m229_he_x12_02";						//12x M229 2.75in 17lb HE 		<12x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m229_he_x24_01";						//24x M229 2.75in 17lb HE 		<24x M229 2.75in unguided rockets with 17lb high explosive warhead>
	_c pushBack "vn_rocket_ffar_m229_he_x24_02";						//24x M229 2.75in 17lb HE 		<24x M229 2.75in unguided rockets with 17lb high explosive warhead>

	_c pushBack "vn_rocket_ffar_wdu4_flechette_x4";						//4x WDU-4/A 2.75in FL 			<4x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_wdu4_flechette_x7";						//7x WDU-4/A 2.75in FL 			<7x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_lau59_wdu4_flechette_x7";				//7x WDU-4/A 2.75in FL 			<7x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead (LAU59)>
	_c pushBack "vn_rocket_ffar_f4_lau59_wdu4_flechette_x7";			//7x WDU-4/A 2.75in FL 			<7x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_wdu4_flechette_x7";			//7x WDU-4/A 2.75in FL 			<7x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_wdu4_flechette_x7";		//7x WDU-4/A 2.75in FL 			<7x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_lau59_wdu4_flechette_x21";			//21x WDU-4/A 2.75in FL 		<21x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau59_wdu4_flechette_x21";		//21x WDU-4/A 2.75in FL 		<21x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau59_wdu4_flechette_x21";		//21x WDU-4/A 2.75in FL 		<21x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_wdu4_flechette_x19";					//19x WDU-4/A 2.75in FL 		<19x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_wdu4_flechette_x19";			//19x WDU-4/A 2.75in FL 		<19x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_wdu4_flechette_x19";			//19x WDU-4/A 2.75in FL 		<19x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_wdu4_flechette_x19";		//19x WDU-4/A 2.75in FL 		<19x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_wdu4_flechette_x57";			//57x WDU-4/A 2.75in FL 		<57x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_wdu4_flechette_x57";			//57x WDU-4/A 2.75in FL 		<57x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_wdu4_flechette_x57";		//57x WDU-4/A 2.75in FL 		<57x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_wdu4_flechette_x12_01";					//12x WDU-4/A 2.75in FL 		<12x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_wdu4_flechette_x12_02";					//12x WDU-4/A 2.75in FL 		<12x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_wdu4_flechette_x24_01";					//24x WDU-4/A 2.75in FL 		<24x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>
	_c pushBack "vn_rocket_ffar_wdu4_flechette_x24_02";					//24x WDU-4/A 2.75in FL 		<24x WDU-4/A 2.75in unguided rockets with anti-personnel flechette warhead>

	_c pushBack "vn_rocket_ffar_mk32_atap_x4";							//4x Mk32 5in ATAP 				<4x Mk32 5in unguided rockets with Anti-Tank Anti-Personnel warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_mk32_atap_x4";					//4x Mk32 5in ATAP 				<4x Mk32 5in unguided rockets with Anti-Tank Anti-Personnel warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_mk32_atap_x4";				//4x Mk32 5in ATAP 				<4x Mk32 5in unguided rockets with Anti-Tank Anti-Personnel warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_mk32_atap_x4";				//4x Mk32 5in ATAP 				<4x Mk32 5in unguided rockets with Anti-Tank Anti-Personnel warhead>
	_c pushBack "vn_rocket_ffar_f4_lau3_mk32_atap_x12";					//12x Mk32 5in ATAP 			<12x Mk32 5in unguided rockets with Anti-Tank Anti-Personnel warhead>
	_c pushBack "vn_rocket_ffar_f4_in_lau3_mk32_atap_x12";				//12x Mk32 5in ATAP 			<12x Mk32 5in unguided rockets with Anti-Tank Anti-Personnel warhead>
	_c pushBack "vn_rocket_ffar_f4_out_lau3_mk32_atap_x12";				//12x Mk32 5in ATAP 			<12x Mk32 5in unguided rockets with Anti-Tank Anti-Personnel warhead>
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
if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_Bomb_Mk82_x1";			//Mk-82 x1 		<Type: GP Bomb<br />Rounds: 1x HE<br />Used in: EF-2000>
	_c pushBack "EF2K_Bomb_Mk82_x2";			//Mk-82 x2 		<Type: GP Bomb<br />Rounds: 2x HE<br />Used in: EF-2000>
	_c pushBack "EF2K_Bomb_Mk82HD_x1";			//Mk-82-HD x1 	<Type: High-Drag GP Bomb<br />Rounds: 1x HE<br />500 lb.<br />Used in: EF-2000>
	_c pushBack "EF2K_Bomb_Mk82HD_x2";			//Mk-82-HD x2 	<Type: High-Drag GP Bomb<br />Rounds: 2x HE<br />500 lb.<br />Used in: EF-2000>
};
if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_FAB100_x1";				//FAB-100 HE x1 			<Type: Conventional Low-Drag Bomb<br />Rounds: 1<br />220 lb.>"		//Strange convex component06 in pook_missilebox\frl_fab100\frl_fab100.p3d:geometryFire
	_c pushBack "pook_FAB100_x2";				//FAB-100 HE x2 			<Type: Conventional Low-Drag Bomb<br />Rounds: 2<br />220 lb.>
	_c pushBack "pook_FAB100_x3";				//FAB-100 HE x3 			<Type: Conventional Low-Drag Bomb<br />Rounds: 3<br />220 lb.>
	_c pushBack "pook_FAB100_x4";				//FAB-100 HE x4 			<Type: Conventional Low-Drag Bomb<br />Rounds: 4<br />220 lb.>
	_c pushBack "pook_FAB100_x6";				//FAB-100 HE x6 			<Type: Conventional Low-Drag Bomb<br />Rounds: 6<br />220 lb.>
	_c pushBack "pook_FAB100_SU22_x4";			//FAB-100 HE x4 			<Type: Conventional Low-Drag Bomb<br />Rounds: 4<br />220 lb.>
	_c pushBack "pook_FAB250_x1";				//FAB-250 HE x1 			<Type: Conventional Low-Drag Bomb<br />Rounds: 1<br />550 lb.>
	_c pushBack "pook_FAB250_x2";				//FAB-250 HE x2 			<Type: Conventional Low-Drag Bomb<br />Rounds: 2<br />550 lb.>
	_c pushBack "pook_FAB250_x2_CL";			//FAB-250 HE x2 			<Type: Conventional Low-Drag Bomb<br />Rounds: 2<br />550 lb.>
	_c pushBack "pook_FAB250_x3";				//FAB-250 HE x3 			<Type: Conventional Low-Drag Bomb<br />Rounds: 3<br />550 lb.>
	_c pushBack "pook_FAB250_x4";				//FAB-250 HE x4 			<Type: Conventional Low-Drag Bomb<br />Rounds: 4<br />550 lb.>
	_c pushBack "pook_FAB250_x6";				//FAB-250 HE x6 			<Type: Conventional Low-Drag Bomb<br />Rounds: 6<br />550 lb.>
	_c pushBack "pook_RBK250AO_x1";				//RBK-250-A0 CBU x1 		<Type: CBU Cluster Bomb<br />AO-2.5 Anti-Personnel Multi-purpose bomblets<br />Rounds: 1<br />Submunitions: 48<br />550 lb.>
	_c pushBack "pook_RBK250AO_x2";				//RBK-250-A0 CBU x2 		<Type: CBU Cluster Bomb<br />AO-2.5 Anti-Personnel Multi-purpose bomblets<br />Rounds: 2<br />Submunitions: 48<br />550 lb.>
	_c pushBack "pook_ZB250_x1";				//ZB-250 INC x1 			<Type: Incendiary Fire Bomb<br />Rounds: 1<br />550 lb.>
	_c pushBack "pook_ZB250_x2";				//ZB-250 INC x2 			<Type: Incendiary Fire Bomb<br />Rounds: 2<br />550 lb.>
	_c pushBack "pook_KAB250L_x1";				//KAB-250 (LGB) x1 			<Type: Laser-Guided Bomb<br />Rounds: 1<br />550 lb.>
	_c pushBack "pook_KAB250L_x2";				//KAB-250 (LGB) x2 			<Type: Laser-Guided Bomb<br />Rounds: 2<br />550 lb.>
};
if (isClass(configFile >> "CfgVehicles" >> "sab_f104_b")) then {
	_c pushBack "sab_milavi_1rnd_mk82_mag";				//MA BMB Mk82 x1 <>
	_c pushBack "sab_milavi_2rnd_mk82_mag";				//MA BMB Mk82 x2 <>
	_c pushBack "sab_milavi_3rnd_mk82_mag";				//MA BMB Mk82 x3 <>
	_c pushBack "sab_milavi_1rnd_fab250_mag";			//MA BMB Fab250 x1 <>
	_c pushBack "sab_milavi_2rnd_fab250_mag";			//MA BMB Fab250 x2 <>
	_c pushBack "sab_milavi_3rnd_fab250_mag";			//MA BMB Fab250 x3 <>
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_Mk82_GP_P_1rnd_M")) then {
	_c pushBack "FIR_Mk82_GP_P_1rnd_M";						//Mk82 GPB x1 						<500lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk82_GP_P_3rnd_M";						//Mk82 GPB x3 						<500lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk82_GP_TER9A_P_3rnd_M";				//Mk82 GPB x3 (TER-9A) 				<500lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk82_GP_P_6rnd_M";						//Mk82 GPB x 6 						<500lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk82_GP_F15E_Demo_P_4rnd_M";			//Mk82 GPB x 4 						<500lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk82_GP_F15E_Demo_P_6rnd_M";			//Mk82 GPB x 6 						<500lbs un-guided bomb, General Purpose>
	//_c pushBack "FIR_Mk82_GP_Navy_P_1rnd_M";				//Mk82 GPB - BLU-111A/B x1 			<500lbs un-guided bomb, General Purpose / Thermally protected coating>"		//wrong 'pylonWeapon' in magazine:'FIR_Mk82_GP_Navy_P_1rnd_M' this magazine cannot be used in weapon'FIR_mk82_Snakeye_Launcher'
	_c pushBack "FIR_Mk82_GP_P_F14_1rnd_M";					//Mk82 GPB - BLU-111A/B 			<500lbs un-guided bomb, General Purpose / Thermally protected coating>
	_c pushBack "FIR_Mk82_GP_Navy_P_2rnd_M";				//Mk82 GPB - BLU-111A/B x2 			<500lbs un-guided bomb, General Purpose / Thermally protected coating>
	_c pushBack "FIR_Mk82_GP_Navy_P_6rnd_M";				//Mk82 GPB - BLU-111A/B x6 			<500lbs un-guided bomb, General Purpose / Thermally protected coating>
	_c pushBack "FIR_Mk82_GP_prox_P_1rnd_M";				//Mk82 GPB w/DSU-33 x1 				<500lbs un-guided bomb, General Purpose, with radar proximity sensor for airburst.>
	_c pushBack "FIR_Mk82_GP_Navy_prox_P_1rnd_M";			//Mk82 GPB - BLU-111A/B w/DSU-33 x1 <500lbs un-guided bomb, General Purpose, Thermally protected coating with radar proximity sensor for airburst.>
	_c pushBack "FIR_Mk82_snakeye_P_1rnd_M";				//Mk82 Snakeye x1 					<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_snakeye_P_3rnd_M";				//Mk82 Snakeye x3 					<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_snakeye_P_6rnd_M";				//Mk82 Snakeye x 6 					<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_snakeye_F15E_Demo_P_4rnd_M";		//Mk82 Snakeye x 4 					<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_snakeye_F15E_Demo_P_6rnd_M";		//Mk82 Snakeye x 6 					<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_snakeye_Navy_P_1rnd_M";			//Mk82 Snakeye x1 					<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_snakeye_P_F14_1rnd_M";			//Mk82 Snakeye 						<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_snakeye_Navy_P_2rnd_M";			//Mk82 Snakeye x2 					<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_AIR_P_1rnd_M";					//Mk82 AIR x1 						<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_AIR_P_3rnd_M";					//Mk82 AIR x3 						<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_AIR_TER9A_P_3rnd_M";				//Mk82 AIR x3 (TER-9A) 				<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_AIR_P_6rnd_M";					//Mk82 AIR x 6 						<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_AIR_F15E_Demo_P_4rnd_M";			//Mk82 AIR x 4 						<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk82_AIR_F15E_Demo_P_6rnd_M";			//Mk82 AIR x 6 						<500lbs un-guided bomb, High-drag>
	_c pushBack "FIR_Mk83_GP_Navy_P_1rnd_M";				//Mk83 GPB x1 						<1000lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk83_GP_Navy_P_F14_1rnd_M";			//Mk83 GPB 							<1000lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk83_GP_Navy_P_2rnd_M";				//Mk83 GPB x2 						<1000lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk83_AIR_Navy_P_1rnd_M";				//Mk83 AIR x1 						<1000lbs un-guided bomb with Air Inflatable Retarder>
	_c pushBack "FIR_Mk83_AIR_Navy_P_F14_1rnd_M";			//Mk83 AIR 							<1000lbs un-guided bomb with Air Inflatable Retarder>
	_c pushBack "FIR_Mk83_AIR_Navy_P_2rnd_M";				//Mk83 AIR x2 						<1000lbs un-guided bomb with Air Inflatable Retarder>
	_c pushBack "FIR_Mk84_GP_P_1rnd_M";						//Mk84 GPB x1 						<2000lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk84_GP_Navy_P_1rnd_M";				//Mk84 GPB x1 						<2000lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk84_GP_P_F14_1rnd_M";					//Mk84 GPB 							<2000lbs un-guided bomb, General Purpose>
	_c pushBack "FIR_Mk84_AIR_P_1rnd_M";					//Mk84 AIR x1 						<2000lbs un-guided bomb with Air Inflatable Retarder>
	_c pushBack "FIR_MW1_P_1rnd_M";							//MW-1 								<Cluster Dispenser>
	_c pushBack "FIR_CBU87_P_1rnd_M";						//CBU-87 CEM x1 					<1000lbs un-guided bomb, Cluster>
	_c pushBack "FIR_CBU87_P_BRU57_2rnd_M";					//CBU-87 CEM x2(BRU-57) 			<1000lbs un-guided bomb, Cluster>
	_c pushBack "FIR_CBU87_P_TripleRack_2rnd_M";			//CBU-87 CEM x2(TER) 				<1000lbs un-guided bomb, Cluster>
	_c pushBack "FIR_CBU87_F15E_Demo_P_4rnd_M";				//CBU-87 CEM x4 (MER) 				<1000lbs un-guided bomb, Cluster>
	_c pushBack "FIR_CBU87_F15E_Demo_P_6rnd_M";				//CBU-87 CEM x6 (MER) 				<1000lbs un-guided bomb, Cluster>
	_c pushBack "FIR_CBU100_P_1rnd_M";						//Mk-20 Rockeye II 					<500lbs class un-guided bomb, Cluster>
	_c pushBack "FIR_CBU100_P_F14_1rnd_M";					//Mk-20 Rockeye II 					<500lbs class un-guided bomb, Cluster>
	_c pushBack "FIR_CBU100_P_TripleRack_2rnd_M";			//Mk-20 Rockeye II x2(TER) 			<500lbs class un-guided bomb, Cluster>
	_c pushBack "FIR_CBU100_P_TripleRack_3rnd_M";			//Mk-20 Rockeye II x3(TER) 			<500lbs class un-guided bomb, Cluster>
	_c pushBack "FIR_CBU100_P_6rnd_M";						//Mk-20 Rockeye II x 6 				<500lbs class un-guided bomb, Cluster>
	_c pushBack "FIR_CBU100_F15E_Demo_P_4rnd_M";			//Mk-20 Rockeye II x 4 				<500lbs class un-guided bomb, Cluster>
	_c pushBack "FIR_CBU100_F15E_Demo_P_6rnd_M";			//Mk-20 Rockeye II x 6 				<500lbs class un-guided bomb, Cluster>
	_c pushBack "FIR_CBU78_P_1rnd_M";						//CBU-78 GATOR 						<500lbs un-guided bomb, Cluster Mine>
	_c pushBack "FIR_CBU78_P_BRU57_2rnd_M";					//CBU-78 GATOR x2 					<500lbs un-guided bomb, Cluster Mine>
	_c pushBack "FIR_CBU78_P_F14_1rnd_M";					//CBU-78 GATOR 						<500lbs un-guided bomb, Cluster Mine>
	_c pushBack "FIR_CBU89_P_1rnd_M";						//CBU-89 GATOR 						<1000lbs un-guided bomb, Cluster Mine>
	_c pushBack "FIR_CBU89_P_BRU57_2rnd_M";					//CBU-89 GATOR x2(BRU-57) 			<1000lbs un-guided bomb, Cluster Mine>
	_c pushBack "FIR_CBU89_P_TripleRack_2rnd_M";			//CBU-89 GATOR x2(TER) 				<1000lbs un-guided bomb, Cluster Mine>
	_c pushBack "FIR_CBU97_P_1rnd_M";						//CBU-97 SFW 						<1000lbs un-guided bomb, Sensor Fuzed Weapon>
	_c pushBack "FIR_CBU97_P_BRU57_2rnd_M";					//CBU-97 SFW x2(BRU-57) 			<1000lbs un-guided bomb, Sensor Fuzed Weapon>
	_c pushBack "FIR_CBU97_P_TripleRack_2rnd_M";			//CBU-97 SFW x2(TER) 				<1000lbs un-guided bomb, Sensor Fuzed Weapon>
	_c pushBack "FIR_CBU103_P_1rnd_M";						//CBU-103 WCMD 						<1000lbs un-guided bomb,Wind Corrected Munitions Dispenser>
	_c pushBack "FIR_CBU103_P_BRU57_2rnd_M";				//CBU-103 WCMD x2(BRU-57) 			<1000lbs un-guided bomb,Wind Corrected Munitions Dispenser>
	_c pushBack "FIR_CBU103_P_TripleRack_2rnd_M";			//CBU-103 WCMD x2(TER) 				<1000lbs un-guided bomb,Wind Corrected Munitions Dispenser>
	_c pushBack "FIR_CBU105_P_1rnd_M";						//CBU-105 SFW WCMD 					<1000lbs un-guided bomb,SFW / Wind Corrected Munitions Dispenser>
	_c pushBack "FIR_CBU105_P_BRU57_2rnd_M";				//CBU-105 SFW WCMD x2(BRU-57) 		<1000lbs un-guided bomb,SFW / Wind Corrected Munitions Dispenser>
	_c pushBack "FIR_CBU105_P_TripleRack_2rnd_M";			//CBU-105 SFW WCMD x2(TER) 			<1000lbs un-guided bomb,SFW / Wind Corrected Munitions Dispenser>
	_c pushBack "FIR_PDU5B_P_1rnd_M";						//PDU-5/B Leaflets Bomb(West) 		<Leaflet Bomb>
	_c pushBack "FIR_PDU5B_Custom1_P_1rnd_M";				//PDU-5/B Leaflets Bomb(Custom 1) 	<Leaflet Bomb>
	_c pushBack "FIR_PDU5B_Custom2_P_1rnd_M";				//PDU-5/B Leaflets Bomb(Custom 2) 	<Leaflet Bomb>
	_c pushBack "FIR_PDU5B_Custom3_P_1rnd_M";				//PDU-5/B Leaflets Bomb(Custom 3) 	<Leaflet Bomb>
	_c pushBack "FIR_PDU5B_P_F14_1rnd_M";					//PDU-5/B Leaflets Bomb(West) 		<Leaflet Bomb>
	_c pushBack "FIR_PDU5B_Custom1_P_F14_1rnd_M";			//PDU-5/B Leaflets Bomb(Custom 1) 	<Leaflet Bomb>
	_c pushBack "FIR_PDU5B_Custom2_P_F14_1rnd_M";			//PDU-5/B Leaflets Bomb(Custom 2) 	<Leaflet Bomb>
	_c pushBack "FIR_PDU5B_Custom3_P_F14_1rnd_M";			//PDU-5/B Leaflets Bomb(Custom 3) 	<Leaflet Bomb>
	_c pushBack "FIR_BLU107_P_3rnd_M";						//BLU-107/B Durandal x 3 			<un-guided bomb, Anti-Runway>
	_c pushBack "FIR_GBU12_P_1rnd_M";						//GBU-12 Paveway II x1 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_P_1rnd_M_Tornado_AWS";			//GBU-12 Paveway II x1 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_P_3rnd_M";						//GBU-12 Paveway II x3 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_P_3rnd_M_Tornado_AWS";			//GBU-12 Paveway II x3 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_EGBU12_P_3rnd_M";						//EGBU-12 Enhanced Paveway II x3 	<500lbs Laser/GPS guided bomb>
	_c pushBack "FIR_EGBU12_P_3rnd_M_Tornado_AWS";			//EGBU-12 Enhanced Paveway II x3 	<500lbs Laser/GPS guided bomb>
	_c pushBack "FIR_PavewayIV_P_1rnd_M";					//Paveway IV x1 					<500lbs Laser/GPS guided bomb>
	_c pushBack "FIR_PavewayIV_P_1rnd_M_Tornado_AWS";		//Paveway IV x1 					<500lbs Laser/GPS guided bomb>
	_c pushBack "FIR_GBU12_PW1_P_1rnd_M";					//GBU-12 Paveway I x1 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_Navy_P_1rnd_M";					//GBU-12 Paveway II x1 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_P_F14_1rnd_M";					//GBU-12 Paveway II 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_P_2rnd_M";						//GBU-12 Paveway II x2 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_Navy_P_2rnd_M";					//GBU-12 Paveway II x2 (BRU-57) 	<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU12_Navy_P_3rnd_M";					//GBU-12 Paveway II x3 				<500lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_EGBU12_P_1rnd_M";						//EGBU-12 Enhanced Paveway II x1 	<500lbs Laser/GPS guided bomb>
	_c pushBack "FIR_EGBU12_P_2rnd_M";						//EGBU-12 Enhanced Paveway II x2 	<500lbs Laser/GPS guided bomb>
	_c pushBack "FIR_EGBU12_Navy_P_2rnd_M";					//EGBU-12 Enhanced Paveway II x2 (BRU-57) <500lbs Laser/GPS guided bomb>
	_c pushBack "FIR_GCS1_P_1rnd_M";						//GCS-1 							<500lbs IR guided bomb>
	_c pushBack "FIR_GBU38_P_1rnd_M";						//GBU-38 JDAM x1 					<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_F15SE_P_1rnd_M";					//GBU-38 JDAM x1 					<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_P_EWP_2rnd_M";					//(EWP)GBU-38 JDAM x2 				<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_P_2rnd_M";						//GBU-38 JDAM x2 					<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_P_3rnd_M";						//GBU-38 JDAM x3 					<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_Navy_P_1rnd_M";					//GBU-38 JDAM x1 					<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_P_F14_1rnd_M";					//GBU-38 JDAM 						<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_Navy_P_2rnd_M";					//GBU-38 JDAM x2 					<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU38_Navy_EWP_2rnd_M";				//GBU-38 JDAM x2 (EWP) 				<500lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU54_P_1rnd_M";						//GBU-54 LJDAM x1 					<500lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU54_F15SE_P_1rnd_M";					//GBU-54 LJDAM x1 					<500lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU54_P_2rnd_M";						//GBU-54 LJDAM x2 					<500lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU54_P_3rnd_M";						//GBU-54 LJDAM x3 					<500lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU54_Navy_P_1rnd_M";					//GBU-54 LJDAM x1 					<500lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU54_Navy_P_2rnd_M";					//GBU-54 LJDAM x2 					<500lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU54_Navy_EWP_2rnd_M";				//GBU-54 LJDAM x2 (EWP) 			<500lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU39_P_4rnd_M";						//GBU-39 SDB 						<250lbs GPS guided bomb>
	_c pushBack "FIR_GBU39_P_EWP_4rnd_M";					//(EWP)GBU-39 SDB x4 				<250lbs GPS guided bomb>
	_c pushBack "FIR_GBU39_P_EWP_6rnd_M";					//(EWP)GBU-39 SDB x6 				<250lbs GPS guided bomb>
	_c pushBack "FIR_GBU39_EWP_4rnd_M";						//GBU-39 SDB x4 (EWP) 				<250lbs GPS guided bomb>
	_c pushBack "FIR_GBU39_EWP_6rnd_M";						//GBU-39 SDB x6 (EWP) 				<250lbs GPS guided bomb>
	_c pushBack "FIR_GBU53_P_4rnd_M";						//GBU-53 SDB II 					<250lbs GPS/Laser/Radar guided bomb>
	_c pushBack "FIR_GBU53_P_EWP_4rnd_M";					//(EWP)GBU-53 SDB II x4 			<250lbs GPS/Laser/Radar guided bomb>
	_c pushBack "FIR_GBU53_P_EWP_6rnd_M";					//(EWP)GBU-53 SDB II x6 			<250lbs GPS/Laser/Radar guided bomb>
	_c pushBack "FIR_GBU53_EWP_4rnd_M";						//GBU-53 SDB II x4 (EWP) 			<250lbs GPS/Laser/Radar guided bomb>
	_c pushBack "FIR_GBU53_EWP_6rnd_M";						//GBU-53 SDB II x6 (EWP) 			<250lbs GPS/Laser/Radar guided bomb>
	_c pushBack "FIR_KGGB_P_1rnd_M";						//KGGB x1 							<500lbs GPS guided bomb>
	_c pushBack "FIR_KAB250L_P_1rnd_M";						//KAB-250L 							<250kg Laser-guided bomb>
	_c pushBack "FIR_KAB500L_P_1rnd_M";						//KAB-500L 							<500kg Laser-guided bomb>
	_c pushBack "FIR_KAB500Kr_P_1rnd_M";					//KAB-500Kr 						<500kg EO guided bomb>
	_c pushBack "FIR_KAB500SE_P_1rnd_M";					//KAB-500SE 						<500kg GLONASS guided bomb>
	_c pushBack "FIR_FAB250_P_1rnd_M";						//FAB-250 							<500kg un-guided bomb>
	_c pushBack "FIR_RBK250_P_1rnd_M";						//RBK-250 							<250kg bomb,cluster>
	_c pushBack "FIR_RBK500_SPBE_D_P_1rnd_M";				//RBK-500 SPBE-D 					<500kg bomb,Sensor Fuzed Weapon>
};
if (isClass(configFile >> "CfgMagazines" >> "tu95_24Rnd_FAB250")) then {
	_c pushBack "tu95_24Rnd_FAB250";			//FAB-250 HE (x24) 	<Type: Conventional Low-Drag Bomb<br />Rounds: 24<br />550lb \ 250kg<br />Warhead: HE>
	_c pushBack "tu16_24Rnd_FAB250";			//FAB-250 HE (x24) 	<Type: Conventional Low-Drag Bomb<br />Rounds: 24<br />550lb \ 250kg<br />Warhead: HE>
	_c pushBack "tu22_33Rnd_FAB250";			//FAB-250 HE x33 	<Type: Conventional Low-Drag Bomb<br />Rounds: 33x 550lb (250kg)<br />Warhead: HE>
	_c pushBack "tu22_9Rnd_FAB250";				//FAB-250 HE x9 	<Type: Conventional Low-Drag Bomb<br />Rounds: 9x 550lb (250kg)<br />Warhead: HE>
	_c pushBack "su24_6Rnd_FAB250";				//FAB-250 HE x6 	<Type: Conventional Low-Drag Bomb<br />Rounds: 6<br />550lb \ 250kg<br />Warhead: HE>
	_c pushBack "su24_4Rnd_FAB250";				//FAB-250 HE x4 	<Type: Conventional Low-Drag Bomb<br />Rounds: 4<br />550lb \ 250kg<br />Warhead: HE>
	_c pushBack "su24_3Rnd_FAB250";				//FAB-250 HE x3 	<Type: Conventional Low-Drag Bomb<br />Rounds: 3<br />550lb \ 250kg<br />Warhead: HE>
	_c pushBack "su24_2Rnd_FAB250";				//FAB-250 HE x2 	<Type: Conventional Low-Drag Bomb<br />Rounds: 2<br />550lb \ 250kg<br />Warhead: HE>
	_c pushBack "su24_1Rnd_FAB250";				//FAB-250 HE x1 	<Type: Conventional Low-Drag Bomb<br />Rounds: 1<br />550lb \ 250kg<br />Warhead: HE>
};
if (isClass(configFile >> "CfgMagazines" >> "js_m_fa18_wing_tank_x1")) then {
	_c pushBack "js_m_fa18_wing_tank_x1";		//F/A-18 Fuel Tank 	<500lb, high-explosive, unguided bomb>
	//_c pushBack "js_m_fa18_buddypod_x1";		//F/A-18 Buddy Pod 	<500lb, high-explosive, unguided bomb>"		//wrong 'pylonWeapon' in magazine:'js_m_fa18_buddypod_x1' this magazine cannot be used in weapon'js_w_fa18_fueltank_holder'
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_bomb_500_mk82_he_mag_x1";						//Mk82 500lb 					<Mk82 500lb GP Bomb>
	_c pushBack "vn_bomb_f4_500_mk82_he_mag_x2";					//Mk82 500lb x2 				<2x Mk82 500lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_500_mk82_he_mag_x3";					//Mk82 500lb x3 				<3x Mk82 500lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_he_mag_x1";					//Mk82 500lb 					<Mk82 500lb GP Bomb>
	_c pushBack "vn_bomb_f4_in_500_mk82_he_mag_x2";					//Mk82 500lb x2 				<2x Mk82 500lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_he_mag_x3";					//Mk82 500lb x3 				<3x Mk82 500lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_he_mag_x4";					//Mk82 500lb x4 				<4x Mk82 500lb GP Bombs on MER>
	_c pushBack "vn_bomb_f4_in_500_mk82_he_mag_x6";					//Mk82 500lb x6 				<6x Mk82 500lb GP Bombs on MER>
	_c pushBack "vn_bomb_f4_out_500_mk82_he_mag_x1";				//Mk82 500lb 					<Mk82 500lb GP Bomb>
	_c pushBack "vn_bomb_f4_out_500_mk82_he_mag_x2";				//Mk82 500lb x2 				<2x Mk82 500lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk82_he_mag_x3";				//Mk82 500lb x3 				<3x Mk82 500lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk82_he_mag_x4";				//Mk82 500lb x4 				<4x Mk82 500lb GP Bombs on MER>
	_c pushBack "vn_bomb_f4_out_500_mk82_he_mag_x6";				//Mk82 500lb x6 				<6x Mk82 500lb GP Bombs on MER>
	_c pushBack "vn_bomb_500_mk82_se_mag_x1";						//Mk82 500lb Snakeeye 			<Mk82 500lb Snakeeye Bomb>
	_c pushBack "vn_bomb_f4_500_mk82_se_mag_x2";					//Mk82 500lb Snakeeye x2 		<2x Mk82 500lb Snakeeye Bombs on TER>
	_c pushBack "vn_bomb_f4_500_mk82_se_mag_x3";					//Mk82 500lb Snakeeye x3 		<3x Mk82 500lb Snakeeye Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_se_mag_x1";					//Mk82 500lb Snakeeye 			<Mk82 500lb Snakeeye Bomb>
	_c pushBack "vn_bomb_f4_in_500_mk82_se_mag_x2";					//Mk82 500lb Snakeeye x2 		<2x Mk82 500lb Snakeeye Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_se_mag_x3";					//Mk82 500lb Snakeeye x3 		<3x Mk82 500lb Snakeeye Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_se_mag_x4";					//Mk82 500lb Snakeeye x4 		<4x Mk82 500lb Snakeeye Bombs on MER>
	_c pushBack "vn_bomb_f4_in_500_mk82_se_mag_x6";					//Mk82 500lb Snakeeye x6 		<6x Mk82 500lb Snakeeye Bombs on MER>
	_c pushBack "vn_bomb_f4_out_500_mk82_se_mag_x1";				//Mk82 500lb Snakeeye 			<Mk82 500lb Snakeeye Bomb>
	_c pushBack "vn_bomb_f4_out_500_mk82_se_mag_x2";				//Mk82 500lb Snakeeye x2 		<2x Mk82 500lb Snakeeye Bombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk82_se_mag_x3";				//Mk82 500lb Snakeeye x3 		<3x Mk82 500lb Snakeeye Bombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk82_se_mag_x4";				//Mk82 500lb Snakeeye x4 		<4x Mk82 500lb Snakeeye Bombs on MER>
	_c pushBack "vn_bomb_f4_out_500_mk82_se_mag_x6";				//Mk82 500lb Snakeeye x6 		<6x Mk82 500lb Snakeeye Bombs on MER>
	_c pushBack "vn_bomb_500_mk82_dc_mag_x1";						//Mk82 500lb Daisy Cutter 		<Mk82 500lb Daisy Cutter Bomb>
	_c pushBack "vn_bomb_f4_500_mk82_dc_mag_x2";					//Mk82 500lb Daisy Cutter x2 	<2x Mk82 500lb Daisy Cutter Bombs on TER>
	_c pushBack "vn_bomb_f4_500_mk82_dc_mag_x3";					//Mk82 500lb Daisy Cutter x3 	<3x Mk82 500lb Daisy Cutter Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_dc_mag_x1";					//Mk82 500lb Daisy Cutter 		<Mk82 500lb Daisy Cutter Bomb>
	_c pushBack "vn_bomb_f4_in_500_mk82_dc_mag_x2";					//Mk82 500lb Daisy Cutter x2 	<2x Mk82 500lb Daisy Cutter Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk82_dc_mag_x3";					//Mk82 500lb Daisy Cutter x3 	<3x Mk82 500lb Daisy Cutter Bombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk82_dc_mag_x1";				//Mk82 500lb Daisy Cutter 		<Mk82 500lb Daisy Cutter Bomb>
	_c pushBack "vn_bomb_f4_out_500_mk82_dc_mag_x2";				//Mk82 500lb Daisy Cutter x2 	<2x Mk82 500lb Daisy Cutter Bombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk82_dc_mag_x3";				//Mk82 500lb Daisy Cutter x3 	<3x Mk82 500lb Daisy Cutter Bombs on TER>
	_c pushBack "vn_bomb_500_fab250_he_mag_x1";						//FAB-250 500lb 				<FAB-250 500lb GP Bomb>
	_c pushBack "vn_bomb_750_m117_he_mag_x1";						//M117 750lb 					<M117 750lb GP Bomb>
	_c pushBack "vn_bomb_f4_750_m117_he_mag_x2";					//M117 750lb x2 				<2x M117 750lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_750_m117_he_mag_x3";					//M117 750lb x3 				<3x M117 750lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_in_750_m117_he_mag_x1";					//M117 750lb 					<M117 750lb GP Bomb>
	_c pushBack "vn_bomb_f4_in_750_m117_he_mag_x2";					//M117 750lb x2 				<2x M117 750lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_in_750_m117_he_mag_x3";					//M117 750lb x3 				<3x M117 750lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_out_750_m117_he_mag_x1";				//M117 750lb 					<M117 750lb GP Bomb>
	_c pushBack "vn_bomb_f4_out_750_m117_he_mag_x2";				//M117 750lb x2 				<2x M117 750lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_out_750_m117_he_mag_x3";				//M117 750lb x3 				<3x M117 750lb GP Bombs on TER>
	_c pushBack "vn_bomb_500_mk20_cb_mag_x1";						//MK20 Rockeye 					<MK20 Rockeye 500lb Anti-tank Clusterbomb>
	_c pushBack "vn_bomb_f4_500_mk20_cb_mag_x2";					//MK20 Rockeye x2 				<2x MK20 Rockeye 500lb Anti-tank Clusterbombs on TER>
	_c pushBack "vn_bomb_f4_500_mk20_cb_mag_x3";					//MK20 Rockeye x3 				<3x MK20 Rockeye 500lb Anti-tank Clusterbombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk20_cb_mag_x1";					//MK20 Rockeye 					<MK20 Rockeye 500lb Anti-tank Clusterbomb>
	_c pushBack "vn_bomb_f4_in_500_mk20_cb_mag_x2";					//MK20 Rockeye x2 				<2x MK20 Rockeye 500lb Anti-tank Clusterbombs on TER>
	_c pushBack "vn_bomb_f4_in_500_mk20_cb_mag_x3";					//MK20 Rockeye x3 				<3x MK20 Rockeye 500lb Anti-tank Clusterbombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk20_cb_mag_x1";				//MK20 Rockeye 					<MK20 Rockeye 500lb Anti-tank Clusterbomb>
	_c pushBack "vn_bomb_f4_out_500_mk20_cb_mag_x2";				//MK20 Rockeye x2 				<2x MK20 Rockeye 500lb Anti-tank Clusterbombs on TER>
	_c pushBack "vn_bomb_f4_out_500_mk20_cb_mag_x3";				//MK20 Rockeye x3 				<3x MK20 Rockeye 500lb Anti-tank Clusterbombs on TER>
	_c pushBack "vn_bomb_500_blu1b_fb_mag_x1";						//BLU-1/B 500lb Napalm 			<BLU-1/B 500lb Napalm Fire Bomb>
	_c pushBack "vn_bomb_f4_500_blu1b_fb_mag_x2";					//BLU-1/B 500lb Napalm x2 		<2x BLU-1/B 500lb Napalm Fire Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_blu1b_fb_mag_x1";				//BLU-1/B 500lb Napalm 			<BLU-1/B 500lb Napalm Fire Bomb>
	_c pushBack "vn_bomb_f4_in_500_blu1b_fb_mag_x2";				//BLU-1/B 500lb Napalm x2 		<2x BLU-1/B 500lb Napalm Fire Bombs on TER>
	_c pushBack "vn_bomb_f4_in_500_blu1b_fb_mag_x4";				//BLU-1/B 500lb Napalm x4 		<4x BLU-1/B 500lb Napalm Fire Bombs on MER>
	_c pushBack "vn_bomb_f4_out_500_blu1b_fb_mag_x1";				//BLU-1/B 500lb Napalm 			<BLU-1/B 500lb Napalm Fire Bomb>
	_c pushBack "vn_bomb_f4_out_500_blu1b_fb_mag_x2";				//BLU-1/B 500lb Napalm x2 		<2x BLU-1/B 500lb Napalm Fire Bombs on TER>
	_c pushBack "vn_bomb_f4_out_500_blu1b_fb_mag_x4";				//BLU-1/B 500lb Napalm x4 		<4x BLU-1/B 500lb Napalm Fire Bombs on MER>
	_c pushBack "vn_bomb_750_blu1b_fb_mag_x1";						//BLU-1/B 750lb Napalm 			<BLU-1/B 750lb Napalm Fire Bomb>
	_c pushBack "vn_bomb_f4_750_blu1b_fb_mag_x2";					//BLU-1/B 750lb Napalm x2 		<2x BLU-1/B 750lb Napalm Fire Bombs on TER>
	_c pushBack "vn_bomb_f4_in_750_blu1b_fb_mag_x1";				//BLU-1/B 750lb Napalm 			<BLU-1/B 750lb Napalm Fire Bomb>
	_c pushBack "vn_bomb_f4_in_750_blu1b_fb_mag_x2";				//BLU-1/B 750lb Napalm x2 		<2x BLU-1/B 750lb Napalm Fire Bombs on TER>
	_c pushBack "vn_bomb_f4_out_750_blu1b_fb_mag_x1";				//BLU-1/B 750lb Napalm 			<BLU-1/B 750lb Napalm Fire Bomb>
	_c pushBack "vn_bomb_f4_out_750_blu1b_fb_mag_x2";				//BLU-1/B 750lb Napalm x2 		<2x BLU-1/B 750lb Napalm Fire Bombs on TER>
	_c pushBack "vn_bomb_f4_out_750_blu1b_fb_mag_x3";				//BLU-1/B 750lb Napalm x3 		<3x BLU-1/B 750lb Napalm Fire Bombs on TER>
	_c pushBack "vn_bomb_100_m47_wp_mag_x1";						//M47 100lb WP 					<M47 100lb White Phosphorus bomb>
	_c pushBack "vn_bomb_f4_100_m47_wp_mag_x2";						//M47 100lb WP x2 				<2x M47 100lb White Phosphorus Bombs on TER>
	_c pushBack "vn_bomb_f4_100_m47_wp_mag_x3";						//M47 100lb WP x3 				<3x M47 100lb White Phosphorus Bombs on TER>
	_c pushBack "vn_bomb_f4_in_100_m47_wp_mag_x1";					//M47 100lb WP 					<M47 100lb White Phosphorus bomb>
	_c pushBack "vn_bomb_f4_in_100_m47_wp_mag_x2";					//M47 100lb WP x2 				<2x M47 100lb White Phosphorus Bombs on TER>
	_c pushBack "vn_bomb_f4_in_100_m47_wp_mag_x3";					//M47 100lb WP x3 				<3x M47 100lb White Phosphorus Bombs on TER>
	_c pushBack "vn_bomb_f4_in_100_m47_wp_mag_x4";					//M47 100lb WP x4 				<4x M47 100lb White Phosphorus Bombs on MER>
	_c pushBack "vn_bomb_f4_in_100_m47_wp_mag_x6";					//M47 100lb WP x6 				<6x M47 100lb White Phosphorus Bombs on MER>
	_c pushBack "vn_bomb_f4_out_100_m47_wp_mag_x1";					//M47 100lb WP 					<M47 100lb White Phosphorus bomb>
	_c pushBack "vn_bomb_f4_out_100_m47_wp_mag_x2";					//M47 100lb WP x2 				<2x M47 100lb White Phosphorus Bombs on TER>
	_c pushBack "vn_bomb_f4_out_100_m47_wp_mag_x3";					//M47 100lb WP x3 				<3x M47 100lb White Phosphorus Bombs on TER>
	_c pushBack "vn_bomb_f4_out_100_m47_wp_mag_x4";					//M47 100lb WP x4 				<4x M47 100lb White Phosphorus Bombs on MER>
	_c pushBack "vn_bomb_f4_out_100_m47_wp_mag_x6";					//M47 100lb WP x6 				<6x M47 100lb White Phosphorus Bombs on MER>
	_c pushBack "vn_bomb_mk36_mine_mag_x1";							//Mk36 Naval Mine 				<Mk36 500lb Anti-ship Mine>
	_c pushBack "vn_bomb_f4_in_mk36_mine_mag_x1";					//Mk36 Naval Mine 				<Mk36 500lb Anti-ship Mine>
	_c pushBack "vn_bomb_f4_out_mk36_mine_mag_x1";					//Mk36 Naval Mine 				<Mk36 500lb Anti-ship Mine>
	_c pushBack "vn_bomb_mk36_destructor_mine_mag_x1";				//Mk36 Destructor Mine 			<Mk36 500lb Anti-ship Destructor Mine>
	_c pushBack "vn_bomb_mk36_destructor_mine_mag_x2";				//Mk36 Destructor Mine x2 		<2x Mk36 500lb Anti-ship Destructor Mines on TER>
	_c pushBack "vn_bomb_mk36_destructor_mine_mag_x3";				//Mk36 Destructor Mine x3 		<3x Mk36 500lb Anti-ship Destructor Mines on TER>
	_c pushBack "vn_bomb_f4_in_mk36_destructor_mine_mag_x1";		//Mk36 Destructor Mine 			<Mk36 500lb Anti-ship Destructor Mine>
	_c pushBack "vn_bomb_f4_in_mk36_destructor_mine_mag_x2";		//Mk36 Destructor Mine x2 		<2x Mk36 500lb Anti-ship Destructor Mines on TER>
	_c pushBack "vn_bomb_f4_in_mk36_destructor_mine_mag_x3";		//Mk36 Destructor Mine x3 		<3x Mk36 500lb Anti-ship Destructor Mines on TER>
	_c pushBack "vn_bomb_f4_out_mk36_destructor_mine_mag_x1";		//Mk36 Destructor Mine 			<Mk36 500lb Anti-ship Destructor Mine>
	_c pushBack "vn_bomb_f4_out_mk36_destructor_mine_mag_x2";		//Mk36 Destructor Mine x2 		<2x Mk36 500lb Anti-ship Destructor Mines on TER>
	_c pushBack "vn_bomb_f4_out_mk36_destructor_mine_mag_x3";		//Mk36 Destructor Mine x3 		<3x Mk36 500lb Anti-ship Destructor Mines on TER>
	_c pushBack "vn_bomb_500_gbu12_he_mag_x1";						//GBU 12 LGB x1 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_500_gbu12_he_mag_x2";					//GBU 12 LGB x2 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_500_gbu12_he_mag_x3";					//GBU 12 LGB x3 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_in_500_gbu12_he_mag_x1";				//GBU 12 LGB x1 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_in_500_gbu12_he_mag_x2";				//GBU 12 LGB x2 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_in_500_gbu12_he_mag_x3";				//GBU 12 LGB x3 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_out_500_gbu12_he_mag_x1";				//GBU 12 LGB x1 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_out_500_gbu12_he_mag_x2";				//GBU 12 LGB x2 				<500lb, high-explosive, laser-guided bomb>
	_c pushBack "vn_bomb_f4_out_500_gbu12_he_mag_x3";				//GBU 12 LGB x3 				<500lb, high-explosive, laser-guided bomb>
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
if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_GBU48_x1";				//GBU-48 x1 	<Type: Low-Drag LGB-GPS Bomb<br />Rounds: 1<br />1000 lb.<br />Used in: EF-2000>
	_c pushBack "EF2K_GBU48_x2";				//GBU-48 x2 	<Type: Low-Drag LGB-GPS Bomb<br />Rounds: 2<br />1000 lb.<br />Used in: EF-2000>
	_c pushBack "EF2K_BL755_x1";				//BL-755 x1 	<Type: BL-755 Cluster Bomb<br />147 Multi-Purpose AP-AT bomblets<br />Rounds: 1x AP-AT<br />250 lb.<br />Used in: EF-2000>
	_c pushBack "EF2K_BL755_x2";				//BL-755 x2 	<Type: BL-755 Cluster Bomb<br />147 Multi-Purpose AP-AT bomblets<br />Rounds: 2x AP-AT<br />250 lb.<br />Used in: EF-2000>
};
if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_FAB500_x1";				//FAB-500 HE x1 			<Type: Conventional Low-Drag Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_FAB500_x2";				//FAB-500 HE x2 			<Type: Conventional Low-Drag Bomb<br />Rounds: 2<br />1100 lb.>
	_c pushBack "pook_FAB500_x2_CL";			//FAB-500 HE x2 			<Type: Conventional Low-Drag Bomb<br />Rounds: 2<br />1100 lb.>
	_c pushBack "pook_FAB500_x4";				//FAB-500 HE x4 			<Type: Conventional Low-Drag Bomb<br />Rounds: 4<br />2200 lb.>
	_c pushBack "pook_FAB1500_x1";				//FAB-1500 HE x1 			<Type: Conventional Low-Drag Bomb<br />Rounds: 1<br />3000 lb.>"		//Strange convex component06 in pook_missilebox\frl_fab100\frl_fab1500.p3d:geometryFire
	_c pushBack "pook_OFAB500_x1";				//OFAB-500 HD x1 			<Type: Conventional High-Drag Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_OFAB500_x2";				//OFAB-500 HD x2 			<Type: Conventional High-Drag Bomb<br />Rounds: 2<br />1100 lb.>
	_c pushBack "pook_FAB500sh_x1";				//FAB-500sh HD x1 			<Type: Conventional High-Drag Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_FAB500sh_x2";				//OFAB-500sh HD x2 			<Type: Conventional High-Drag Bomb<br />Rounds: 2<br />1100 lb.>
	_c pushBack "pook_ODAB500_x1";				//ODAB-500 FAE x1 			<Type: Fuel-Air Explosive (Thermobaric) Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_ODAB500_x2";				//ODAB-500 FAE x2 			<Type: Fuel-Air Explosive (Thermobaric) Bomb<br />Rounds: 2<br />1100 lb.>
	_c pushBack "pook_RBK500AT_x1";				//RBK-500 CBU x1 			<Type: CBU Cluster Bomb<br />PTAB-1M Anti-tank bomblets<br />Rounds: 1<br />Submunitions: 352<br />1100 lb.>"		//Strange convex component05 in pook_missilebox\rbk\fza_rbk500.p3d:geometryFire
	_c pushBack "pook_RBK500AT_x2";				//RBK-500 CBU x2 			<Type: CBU Cluster Bomb<br />PTAB-1M Anti-tank bomblets<br />Rounds: 2<br />Submunitions: 352<br />1100 lb.>
	_c pushBack "pook_RBK500AO_x1";				//RBK-500-A0 CBU x1 		<Type: CBU Cluster Bomb<br />AO-2.5 Anti-Personnel Multi-purpose bomblets<br />Rounds: 1<br />Submunitions: 126<br />1100 lb.>
	_c pushBack "pook_RBK500AO_x2";				//RBK-500-A0 CBU x2 		<Type: CBU Cluster Bomb<br />AO-2.5 Anti-Personnel Multi-purpose bomblets<br />Rounds: 2<br />Submunitions: 126<br />1100 lb.>
	_c pushBack "pook_RBK500SFU_x1";			//RBK-500-SPBE CBU x1 		<Type: CBU Cluster Bomb<br />SPBE Sensor-Fused Anti-Tank bomblets<br />Rounds: 1<br />Submunitions: 15<br />1100 lb.>"		//Strange convex component02 in pook_missilebox\rbk\rbk_500_sdbp_fly.p3d:geometryFire
	_c pushBack "pook_RBK500SFU_x2";			//RBK-500-SPBE CBU x2 		<Type: CBU Cluster Bomb<br />SPBE Sensor-Fused Anti-Tank bomblets<br />Rounds: 2<br />Submunitions: 15<br />1100 lb.>
	_c pushBack "pook_BetAB500_x1";				//BetAB-500 RP x1 			<Type: Anti-Runway Penetrator Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_BetAB500_x2";				//BetAB-500 RP x2 			<Type: Anti-Runway Penetrator Bomb<br />Rounds: 2<br />1100 lb.>
	_c pushBack "pook_ZB500_x1";				//ZB-500 INC x1 			<Type: Incendiary Fire Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_ZB500_x2";				//ZB-500 INC x2 			<Type: Incendiary Fire Bomb<br />Rounds: 2<br />1100 lb.>
};
if (isClass(configFile >> "CfgVehicles" >> "sab_f104_b")) then {
	_c pushBack "sab_milavi_1rnd_cluster_01_mag";		//MA BMB Cluster HE <>
	_c pushBack "sab_milavi_1rnd_cluster_02_mag";		//MA BMB Cluster IN <>
	_c pushBack "sab_milavi_1rnd_gbu_mag";				//MA LGB GBU <>
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_GBU16_Navy_P_1rnd_M")) then {
	_c pushBack "FIR_GBU16_Navy_P_1rnd_M";					//GBU-16 Paveway II x1 				<1000lbs laser guided bomb / CAUTION-Not a cat toys.>
	//_c pushBack "FIR_GBU16_Navy_P_1rnd_M_Tornado_AWS";		//GBU-16 Paveway II x1 				<1000lbs laser guided bomb / CAUTION-Not a cat toys.>		//wrong 'pylonWeapon' in magazine:'FIR_GBU16_Navy_P_1rnd_M_Tornado_AWS' this magazine cannot be used in weapon'FIR_GBU16_Tornado_AWS'
	_c pushBack "FIR_GBU10_PW1_P_1rnd_M";					//GBU-10 Paveway I 					<2000lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU10_P_1rnd_M";						//GBU-10 Paveway II 				<2000lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU10_Navy_P_1rnd_M";					//GBU-10 Paveway II (BLU-117A/B) 	<2000lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU10_P_F14_1rnd_M";					//GBU-10 Paveway II 				<2000lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU16_Navy_P_2rnd_M";					//GBU-16 Paveway II x2 (BRU-57) 	<1000lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU16_Navy_P_F14_1rnd_M";				//GBU-16 Paveway II 				<1000lbs laser guided bomb / CAUTION-Not a cat toys.>
	_c pushBack "FIR_GBU24A_P_1rnd_M";						//GBU-24A Paveway III 				<2000lbs Laser guided bomb>
	_c pushBack "FIR_GBU24B_P_1rnd_M";						//GBU-24B Paveway III 				<2000lbs Laser guided bomb>
	_c pushBack "FIR_GBU24_EWP_1rnd_M";						//GBU-24B Paveway III x1 (EWP) 		<2000lbs Laser guided bomb>
	_c pushBack "FIR_GBU24B_P_F14_1rnd_M";					//GBU-24B Paveway III 				<2000lbs Laser guided bomb>
	_c pushBack "FIR_GBU24A_BLU118_P_1rnd_M";				//GBU-24A Paveway III w/BLU-118 	<2000lbs Laser guided bomb w/BLU-118 Thermobaric warhead>
	_c pushBack "FIR_GBU24A_BLU109_P_1rnd_M";				//GBU-24A/B Paveway III w/ BLU-109 	<2000lbs Laser guided bomb, Bunker Buster>
	_c pushBack "FIR_GBU24B_BLU109_P_1rnd_M";				//GBU-24B/B Paveway III w/ BLU-109 	<2000lbs Laser guided bomb, Bunker Buster>
	_c pushBack "FIR_GBU24B_BLU109_P_F14_1rnd_M";			//GBU-24B/B Paveway III w/ BLU-109 	<2000lbs Laser guided bomb, Bunker Buster>
	_c pushBack "FIR_GBU24EB_P_1rnd_M";						//GBU-24E/B Paveway III w/ BLU-109 	<2000lbs Laser guided bomb, Bunker Buster>
	_c pushBack "FIR_GBU24EB_P_F14_1rnd_M";					//GBU-24E/B Paveway III w/ BLU-109 	<2000lbs Laser guided bomb, Bunker Buster>
};
if (isClass(configFile >> "CfgMagazines" >> "Tornado_AWS_StormShadow_P_1rnd_M")) then {
	_c pushBack "Tornado_AWS_StormShadow_P_1rnd_M";				//Storm Shadow <2,900lb GPS guided missile>
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_bomb_1000_fab500_he_mag_x1";					//FAB-500 1000lb 				<FAB-500 1000lb GP Bomb>
	_c pushBack "vn_bomb_1000_mk83_he_mag_x1";						//Mk83 1000lb 					<Mk83 1000lb GP Bomb>
	_c pushBack "vn_bomb_f4_1000_mk83_he_mag_x2";					//Mk83 1000lb x2 				<2x Mk83 1000lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_in_1000_mk83_he_mag_x1";				//Mk83 1000lb 					<Mk83 1000lb GP Bomb>
	_c pushBack "vn_bomb_f4_in_1000_mk83_he_mag_x2";				//Mk83 1000lb x2 				<2x Mk83 1000lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_in_1000_mk83_he_mag_x3";				//Mk83 1000lb x3 				<3x Mk83 1000lb GP Bombs on TER>
	_c pushBack "vn_bomb_f4_out_1000_mk83_he_mag_x1";				//Mk83 1000lb 					<Mk83 1000lb GP Bomb>
	_c pushBack "vn_bomb_f4_out_1000_mk83_he_mag_x2";				//Mk83 1000lb x2 				<2x Mk83 1000lb GP Bombs on TER>
	_c pushBack "vn_bomb_2000_mk84_he_mag_x1";						//Mk84 2000lb 					<Mk84 2000lb GP Bomb>
	_c pushBack "vn_bomb_f4_in_2000_mk84_he_mag_x1";				//Mk84 2000lb 					<Mk84 2000lb GP Bomb>
	_c pushBack "vn_bomb_f4_out_2000_mk84_he_mag_x1";				//Mk84 2000lb 					<Mk84 2000lb GP Bomb>
	_c pushBack "vn_bomb_2000_gbu8_he_mag_x1";						//GBU-8 2000lb 					<GBU-8 2000lb HOBOS Laser-guided bomb>
	_c pushBack "vn_bomb_f4_in_2000_gbu8_he_mag_x1";				//GBU-8 2000lb 					<GBU-8 2000lb HOBOS Laser-guided bomb>
	_c pushBack "vn_bomb_f4_out_2000_gbu8_he_mag_x1";				//GBU-8 2000lb 					<GBU-8 2000lb HOBOS Laser-guided bomb>
	_c pushBack "vn_bomb_15000_blu82_dc_mag_x1";					//BLU-82 15000lb 				<BLU-82 15000lb Daisy Cutter>
	_c pushBack "vn_bomb_750_cbu85_cb_mag_x1";						//CBU-85 Cluster x1 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_750_cbu85_cb_mag_x2";					//CBU-85 Cluster x2 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_750_cbu85_cb_mag_x3";					//CBU-85 Cluster x3 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_in_750_cbu85_cb_mag_x1";				//CBU-85 Cluster x1 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_in_750_cbu85_cb_mag_x2";				//CBU-85 Cluster x2 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_in_750_cbu85_cb_mag_x3";				//CBU-85 Cluster x3 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_out_750_cbu85_cb_mag_x1";				//CBU-85 Cluster x1 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_out_750_cbu85_cb_mag_x2";				//CBU-85 Cluster x2 			<750lb, laser-guided cluster bomb>
	_c pushBack "vn_bomb_f4_out_750_cbu85_cb_mag_x3";				//CBU-85 Cluster x3 			<750lb, laser-guided cluster bomb>
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

if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "pook_KAB500L_x1";				//KAB-500 (LGB) x1 			<Type: Laser-Guided Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_KAB1500L_x1";				//KAB-1500 (LGB) x1 		<Type: Laser-Guided Bomb<br />Rounds: 1<br />3000 lb.>"		//Strange convex component02 in pook_missilebox\frl_kab1500l\frl_kab1500.p3d:geometryFire
	_c pushBack "pook_KAB500KR_x1";				//KAB-500KR (IR) x1 		<Type: IR Targeting Guided Bomb<br />Rounds: 1<br />1100 lb.>
	_c pushBack "pook_KAB1500KR_x1";			//KAB-1500KR (IR) x1 		<Type: IR Targeting Guided Bomb<br />Rounds: 1<br />3000 lb.>"		//Strange convex component02 in pook_missilebox\frl_kab1500l\frl_kab1500kr_fly.p3d:geometryFire
	//_c pushBack "pook_KAB500SE_x1";				//KAB-500SE (GLONASS) x1 	<Type: GPS Guided Bomb<br />Rounds: 1<br />1100 lb.>"		//wrong 'pylonWeapon' in magazine:'pook_KAB500SE_x1' this magazine cannot be used in weapon'pook_LGB_Launcher'
};
if (isClass(configFile >> "CfgMagazines" >> "FIR_GBU16_Navy_P_1rnd_M")) then {
	_c pushBack "FIR_GBU31_P_1rnd_M";						//GBU-31 JDAM x1 					<2000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU31_P_EWP_1rnd_M";					//(EWP)GBU-31 JDAM x1 				<2000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU31_Navy_P_1rnd_M";					//GBU-31 JDAM x1 					<2000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU31_P_F14_1rnd_M";					//GBU-31 JDAM 						<2000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU31_EWP_1rnd_M";						//GBU-31 JDAM x1 (EWP) 				<2000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU31_BLU109_P_1rnd_M";				//GBU-31 JDAM w/ BLU-109 x1 		<2000lbs GPS guided bomb, Bunker Buster>
	_c pushBack "FIR_GBU31_BLU109_P_F14_1rnd_M";			//GBU-31 JDAM w/ BLU-109  			<2000lbs GPS guided bomb, Bunker Buster>
	_c pushBack "FIR_GBU31_BLU109_P_EWP_1rnd_M";			//(EWP)GBU-31 JDAM w/ BLU-109 x1 	<2000lbs GPS guided bomb, Bunker Buster>
	_c pushBack "FIR_GBU56_P_1rnd_M";						//GBU-56 LJDAM x1 					<2000lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU56_Navy_P_1rnd_M";					//GBU-56 LJDAM x1 					<2000lbs GPS/Laser guided bomb>
	_c pushBack "FIR_GBU32_P_1rnd_M";						//GBU-32 JDAM x1 					<1000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU32_F15SE_P_1rnd_M";					//GBU-32 JDAM x1 					<1000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU32_P_EWP_1rnd_M";					//(EWP)GBU-32 JDAM x1 				<1000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU32_Navy_P_1rnd_M";					//GBU-32 JDAM x1 					<1000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU32_Navy_EWP_1rnd_M";				//GBU-32 JDAM x1 (EWP) 				<1000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU32_Navy_P_F14_1rnd_M";				//GBU-32 JDAM x1 					<1000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU32_Navy_P_2rnd_M";					//GBU-32 JDAM x2 					<1000lbs GPS Guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU55_P_1rnd_M";						//GBU-55 LJDAM x1 					<1000lbs GPS + Laser guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_gbu55_F15SE_P_1rnd_M";					//GBU-55 LJDAM x1 					<1000lbs GPS + Laser guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_gbu55_P_EWP_1rnd_M";					//(EWP)GBU-55 LJDAM x1 				<1000lbs GPS + Laser guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_GBU55_Navy_P_1rnd_M";					//GBU-55 LJDAM x1(Navy) 			<1000lbs GPS + Laser guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_gbu55_Navy_EWP_1rnd_M";				//GBU-55 LJDAM x1 (EWP) 			<1000lbs GPS + Laser guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_gbu55_Navy_P_2rnd_M";					//GBU-55 LJDAM x2 					<1000lbs GPS + Laser guided Bomb / 30 Minutes delivery guaranteed. Free if delivery is late.>
	_c pushBack "FIR_AGM154A_P_1rnd_M";						//AGM-154A JSOW 					<1000lbs GPS guided glide bomb, Cluster>
	_c pushBack "FIR_AGM154C_P_1rnd_M";						//AGM-154-A1 JSOW 					<1000lbs GPS guided glide bomb, HE>
	_c pushBack "FIR_AGM154C_P_1rnd_M_Tornado_AWS";			//AGM-154-A1 JSOW 					<1000lbs GPS guided glide bomb, HE>
	_c pushBack "FIR_AGM62_Walleye1_P_1rnd_M";				//Mk1 Walleye 1 					<Guided bomb , EO/CG Guided>
	_c pushBack "FIR_AGM62_Walleye2_P_1rnd_M";				//Mk5 Walleye 2 					<Guided bomb , EO/CG Guided>
	_c pushBack "FIR_AGM62_Walleye1ER_P_1rnd_M";			//Mk29 Walleye 1 ERDL 				<Guided bomb , EO/CG Guided>
	_c pushBack "FIR_AGM62_Walleye2ER_P_1rnd_M";			//Mk30 Walleye 2 ERDL 				<Guided bomb , EO/CG Guided>
};

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
if (isClass(configFile >> "CfgMagazines" >> "FIR_GEPOD30_P_330rnd_M")) then {
	_c pushBack "FIR_GEPOD30_P_330rnd_M";				//GAU-13/A 30mm Gun pod 	<Gunpod,30mm>
	_c pushBack "FIR_SUU23_P_1200rnd_M";				//SUU-23/A 20mm Gun pod 	<Gunpod,20mm>
};

if (isClass(configFile >> "CfgMagazines" >> "FIR_Litening_std_P_1rnd_M")) then {
	_c pushBack "FIR_Litening_std_P_1rnd_M";				//LITENING Pod 					<targeting pod>
	//_c pushBack "FIR_Litening_std_P_1rnd_M_Tornado_AWS";	//LITENING Pod 					<targeting pod>		//wrong 'pylonWeapon' in magazine:'FIR_Litening_std_P_1rnd_M_Tornado_AWS' this magazine cannot be used in weapon'FIR_TGTPOD'
	_c pushBack "FIR_ALQ99_P_1rnd_M";						//AN/ALQ-99 					<Jammer pod>
	_c pushBack "FIR_ALQ99_EA6B_P_1rnd_M";					//AN/ALQ-99 					<Jammer pod>
	//_c pushBack "FIR_ALQ76_P_1rnd_M";						//AN/ALQ-76 					<Jammer pod>		//wrong 'pylonWeapon' in magazine:'FIR_ALQ76_P_1rnd_M' this magazine cannot be used in weapon'FIR_ECMPOD'
	_c pushBack "FIR_ALQ99Hi_P_1rnd_M";						//AN/ALQ-99 High 				<Jammer pod>
	_c pushBack "FIR_ALQ99Hi_EA6B_P_1rnd_M";				//AN/ALQ-99 High 				<Jammer pod>
	_c pushBack "FIR_ECMPod_P_1rnd_M";						//AN/ALQ-131 					<ECM pod>
	_c pushBack "FIR_ECMPod_Camo_P_1rnd_M";					//AN/ALQ-131(Camo) 				<ECM pod>
	_c pushBack "FIR_ECMPod_F15A_P_1rnd_M";					//AN/ALQ-131 					<ECM pod>
	_c pushBack "FIR_ALQ184_1_P_1rnd_M";					//AN/ALQ-184 					<ECM pod>
	_c pushBack "FIR_ALQ184_2_P_1rnd_M";					//AN/ALQ-184 					<ECM pod>
	_c pushBack "FIR_ALQ119_1_P_1rnd_M";					//AN/ALQ-119 					<ECM pod>
	_c pushBack "FIR_ALQ119_2_P_1rnd_M";					//AN/ALQ-119 					<ECM pod>
	_c pushBack "FIR_ALQ119_F15A_P_1rnd_M";					//AN/ALQ-119 					<ECM pod>
	_c pushBack "FIR_ALQ188_1_P_1rnd_M";					//AN/ALQ-188 					<ECM pod>
	_c pushBack "FIR_Tiger2_P_1rnd_M";						//Intrepid Tiger II 			<ECM pod>
	_c pushBack "FIR_ALQ167_P_1rnd_M";						//AN/ALQ-167 					<ECM pod>
	_c pushBack "FIR_ATFLIR_2_P_1rnd_M";					//ATFLIR Pod 					<ATFLIR targeting pod>
	_c pushBack "FIR_ATFLIR_3_P_1rnd_M";					//ATFLIR Pod 					<ATFLIR targeting pod>
	_c pushBack "FIR_Nitehawk_P_1rnd_M";					//AN/AAS-38A/B Nite Hawk Pod 	<Nite Hawk FLIR/LTD pod>
	_c pushBack "FIR_LantirnPod_P_1rnd_M";					//LANTIRN Pod 					<targeting pod>
	_c pushBack "FIR_LantirnPod_std_P_1rnd_M";				//LANTIRN Pod 					<targeting pod>
	_c pushBack "FIR_LantirnPod_std_Tigereye_P_1rnd_M";		//LANTIRN Pod w/ Tiger Eye 		<targeting pod>
	_c pushBack "FIR_LantirnPod_f14_P_1rnd_M";				//LANTIRN Pod 					<targeting pod>
	_c pushBack "FIR_Litening_P_1rnd_M";					//LITENING Pod 					<targeting pod>
	_c pushBack "FIR_Litening_SIDE_P_1rnd_M";				//LITENING Pod 					<targeting pod>
	_c pushBack "FIR_Litening_Nomodel_P_1rnd_M";			//LITENING Pod 					<targeting pod>
	_c pushBack "FIR_SniperXR_1_P_1rnd_M";					//Sniper XR 					<targeting pod>
	_c pushBack "FIR_SniperXR_2_P_1rnd_M";					//Sniper XR 					<targeting pod>
	_c pushBack "FIR_SniperXR_2_Tigereye_P_1rnd_M";			//Sniper XR w/ Tiger eye 		<targeting pod>
	_c pushBack "FIR_SniperXR_3_P_1rnd_M";					//Sniper XR 					<targeting pod>
	_c pushBack "FIR_SniperXR_SIDE_P_1rnd_M";				//Sniper XR 					<targeting pod>
	_c pushBack "FIR_SniperXR_Nomodel_P_1rnd_M";			//Sniper XR 					<targeting pod>
	_c pushBack "FIR_SniperXR_HTS_P_1rnd_M";				//Sniper/HTS Pod 				<targeting pod>
	_c pushBack "FIR_TARPS_P_1rnd_M";						//TARPS 						<Recce pod>
};
if (isClass(configFile >> "CfgMagazines" >> "js_jc_120Rnd_CMChaff_Magazine")) then {
	_c pushBack "js_jc_120Rnd_CMChaff_Magazine";			//Chaff <>
	_c pushBack "js_jc_120Rnd_CMFlare_Magazine";			//Flares <>
	_c pushBack "js_jc_120Rnd_CMFlare_MJU57B_Magazine";		//MJU-57/B Kinematic Flares <>
	_c pushBack "PylonRack_Wing_Tank_JS_SU35_x1";			//SU35 Wing Tank <>
	_c pushBack "PylonRack_Buddy_Pod_JS_SU35_x1";			//SU35 Buddy Pod <>
	//_c pushBack "js_m_su35_empty";							//SU35 Empty <>"		//wrong 'pylonWeapon' in magazine:'js_m_su35_empty' this magazine cannot be used in weapon'js_w_su35_master_arms_safe'
	//_c pushBack "js_m_su35_fake_empty";						//<>"		//wrong 'pylonWeapon' in magazine:'js_m_su35_fake_empty' this magazine cannot be used in weapon'js_w_su35_master_arms_safe'
};
if (isClass(configFile >> "CfgMagazines" >> "pook_UPK23_250")) then {
	_c pushBack "pook_UPK23_250";				//UPK-23 23mmx2 Pod 		<Type: Gunpod, 23mm, Twin Barrel<br />Rounds: 250>
	_c pushBack "pook_UPK23_SU22";				//UPK-23 23mmx2 Twin Pods 	<Type: Gunpod, 23mm, Twin Barrel<br />Rounds: 250>
};
if (isClass(configFile >> "CfgMagazines" >> "sab_milavi_pod_mgx2_mag")) then {
	_c pushBack "sab_milavi_pod_mgx2_mag";				//MA POD 2x HMG <>
	_c pushBack "sab_milavi_pod_lmgx2_mag";				//MA POD 2x LMG <>
	_c pushBack "sab_milavi_pod_mgx1_mag";				//MA POD 20mm <>
	_c pushBack "sab_milavi_pod_cannon_mag";			//MA POD 20mm (V2) <>
	_c pushBack "sab_milavi_pod_mauser_mag";			//MA POD 27mm <>
	_c pushBack "sab_milavi_pod_30mm_he_mag";			//MA POD ADEN HE <>
	_c pushBack "sab_milavi_pod_30mm_ap_mag";			//MA POD ADEN AP <>
};
if (isClass(configFile >> "CfgMagazines" >> "js_jc_120Rnd_CMChaff_Magazine")) then {
	_c pushBack "FIR_BK27_L_M";										//BK-27 Revolver Cannon (Left) 	<Revolver Cannon,27mm>
	_c pushBack "FIR_BK27_R_M";										//BK-27 Revolver Cannon (Right) <Revolver Cannon,27mm>
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_pk_v_twin_3200_right";				//3200Rnd. PK Belt 	<3200Rnd. PK Belt. <br />Caliber: 7.62x54mmR. <br />Used in Twin PK Machine Gun>
	_c pushBack "vn_pk_v_twin_3200_left";				//3200Rnd. PK Belt 	<3200Rnd. PK Belt. <br />Caliber: 7.62x54mmR. <br />Used in Twin PK Machine Gun>
	_c pushBack "vn_gunpod_m8_v_150_mag";				//150x 40mm M8 		<40mm HE>
	_c pushBack "vn_gunpod_m27_v_2000_mag";				//2000x 7.62mm M27 	<2000x 7.62mm in M27 minigun pod>
	_c pushBack "vn_gunpod_m195_v_2100_mag";			//2100x 20mm M195 	<2100x 20mm HEI in M195 Vulcan gunpod>
	_c pushBack "vn_gunpod_m18_v_750_mag";				//750x 7.62mm M18 	<750x 7.62mm in M18 minigun pod>
	_c pushBack "vn_gunpod_suu11_v_750_mag";			//750x 7.62mm M18 	<750x 7.62mm in M18 minigun pod>				//config error
	_c pushBack "vn_gunpod_m18_v_1500_mag";				//1500x 7.62mm M18 	<1500x 7.62mm in M18 minigun pod>
	_c pushBack "vn_gunpod_suu11_v_1500_mag";			//1500x 7.62mm M18 	<1500x 7.62mm in M18 minigun pod>				//config error
	_c pushBack "vn_gunpod_xm21_v_3000_mag";			//3000x 7.62mm XM21 	<3000x 7.62mm for XM21 minigun>
	_c pushBack "vn_gunpod_xm21_v_6000_mag";			//6000x 7.62mm XM21 	<6000x 7.62mm for XM21 minigun>
	_c pushBack "vn_gunpod_suu23_v_1200_mag";			//SUU-23/A 20mm 		<SUU-23/A 20mm Vulcan cannon pod (1200-rounds)>
	_c pushBack "vn_gunpod_m60_v_500_mag";				//500Rnd. M60 Belt 	<500Rnd. M60 Belt. &lt;br /&gt;Calibre: 7.62x51mm. &lt;br /&gt;Used in Twin M60 Machine Gun>
	_c pushBack "vn_gunpod_m60_v_1000_mag";				//1000Rnd. M60 Belt 	<1000Rnd. M60 Belt. &lt;br /&gt;Calibre: 7.62x51mm. &lt;br /&gt;Used in Twin M60 Machine Gun>
	_c pushBack "vn_gunpod_m60_v_1500_mag";				//1500Rnd. M60 Belt 	<1500Rnd. M60 Belt. &lt;br /&gt;Calibre: 7.62x51mm. &lt;br /&gt;Used in Twin M60 Machine Gun>
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
if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {
	_c pushBack "EF2K_LITENING_POD";			//LITENING POD 	<Type: Multi-Mode Targeting Pod<br />Used in: EF-2000>
	_c pushBack "EF2K_CL_fueltank";				//FUEL 950 kg 	<EF-2000 Centerline Fuel Tank (950 kg)>
	_c pushBack "EF2K_fueltank";				//FUEL 816 kg 	<EF-2000 Wing Fuel Tank (816 kg)>
};
if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
	_c pushBack "POOK_SORB_ECM_POD_L";				//L005S (Sorbtsiya) ECM Pod 	<L005S Sorbtsiya Self-Protection Jamming Pod<br />Mount: Left Wingtip<br />Must be used in pairs!<br />Used in: Su-27, Su-30>
	_c pushBack "POOK_SORB_ECM_POD_R";				//L005S (Sorbtsiya) ECM Pod 	<L005S Sorbtsiya Self-Protection Jamming Pod<br />Mount: Right Wingtip<br />Must be used in pairs!<br />Used in: Su-27, Su-30>
	_c pushBack "POOK_SOV_ECM_POD";					//MSP-418 ECM Pod 				<MSP-418 Self-Protection Jamming Pod<br />Operates in 4-18 GHz range<br />Used in Soviet-type aircraft without internal jammers>
	_c pushBack "POOK_SOV_ARM_POD";					//L-081 ARM Targeting Pod 		<L-081 'Fantasmagoria' ARM Targeting Pod<br />Type: Radar Detection and Locator Pod<br />Detects enemy radars and guides Anti-Radar Missiles (ARM's) to radar targets<br />Required for extended range targeting>
	_c pushBack "POOK_SU22_ARM_POD";				//Vyuga-17 ARM Targeting Pod 	<Vyuga-17 ARM Targeting Pod<br />Type: Radar Detection and Locator Pod<br />Detects enemy radars and guides Anti-Radar Missiles (ARM's) to radar targets<br />Required for extended range targeting>
	_c pushBack "POOK_APK9E_POD";					//APK-9E Targeting Pod 			<APK-9 Command Guidance Pod<br />Targeting Pod for Kh-59 and Kh-29D AGMs<br />Required for extended range targeting>
	_c pushBack "POOK_MIG23_CL_fueltank";			//FUEL 800l 					<Centerline Fuel Tank (800 liter)>
	_c pushBack "POOK_MIG23_fueltank";				//FUEL 800l 					<Fuel Tank (800 liter)>
	_c pushBack "POOK_MIG25_CL_fueltank";			//FUEL 6966 kg 					<MiG-25 Centerline Fuel Tank (6966 kg)>
	_c pushBack "POOK_MIG29_CL_fueltank";			//FUEL 1980 kg 					<MiG-29 Centerline Fuel Tank (1980 kg)>
	_c pushBack "POOK_MIG29_fueltank";				//FUEL 816 kg 					<MiG-29 Wing Fuel Tank (816 kg)>
	_c pushBack "POOK_MIG21_fueltank";				//FUEL 490 kg 					<MiG-21 Wing Fuel Tank (490 kg)>
	_c pushBack "POOK_SU22_fueltank";				//FUEL 800l 					<Fuel Tank (800 liter)>
	//_c pushBack "BE200_WaterTank_F";				//Water, 2000 litres 			<Water, 2000 litres>"		//unable to create weapon for missile 'BE200_WaterTank_F', check config entry'pylonWeapon'	lot of errors!!!!
	//_c pushBack "BE200_WaterTank_R";				//Water, 2000 litres 			<Water, 2000 litres>"		//unable to create weapon for missile 'BE200_WaterTank_R', check config entry'pylonWeapon'	lot of errors!!!!
};
if (isClass(configFile >> "CfgMagazines" >> "sab_milavi_1rnd_droptank_mag")) then {
	_c pushBack "sab_milavi_1rnd_droptank_mag";			//MA TNK Droptank v1 <>
	_c pushBack "sab_milavi_1rnd_droptank_2_mag";		//MA TNK Droptank v2 <>
	_c pushBack "sab_milavi_1rnd_droptank_3_mag";		//MA TNK Droptank v3 <>
	//_c pushBack "sab_milavi_1rnd_droptank_4_mag";		//MA TNK Centertank <>		//wrong 'pylonWeapon' in magazine:'sab_milavi_1rnd_droptank_4_mag' this magazine cannot be used in weapon'sab_milavi_droptank_weapon'
};
if (isClass(configFile >> "CfgVehicles" >> "sab_f104_b")) then {
	_c pushBack "sab_milavi_1rnd_aim9tr_mag";		//MA AAM AIM-9 Training <Short-range, infrared-guided, air-to-air missile with high-explosive warhead>
};
if (isClass(configFile >> "CfgVehicles" >> "FIR_Mk76_P_1rnd_M")) then {
	_c pushBack "FIR_Mk76_P_1rnd_M";								//Mk76 Practice bomb x1 		<Training Weapon>
	_c pushBack "FIR_Mk76_P_F15E_1rnd_M";							//Mk76 Practice bomb x1 		<Training Weapon>
	_c pushBack "FIR_Mk76_P_F14_1rnd_M";							//Mk76 Practice bomb x1 		<Training Weapon>
	_c pushBack "FIR_Mk76_P_2rnd_M";								//Mk76 Practice bomb x2 		<Training Weapon>
	_c pushBack "FIR_Mk76_P_3rnd_M";								//Mk76 Practice bomb x3 		<Training Weapon>
	_c pushBack "FIR_SUU25_P_8rnd_M";								//SUU25 x 1 					<Parachute Flare>
	_c pushBack "FIR_CATM120B_P_1rnd_M";							//CATM-120B 					<Training Weapon>
	_c pushBack "FIR_CATM120C_P_1rnd_M";							//CATM-120C 					<Training Weapon>
	_c pushBack "FIR_CATM120C_LAU115_P_1rnd_M";						//CATM-120C AMRAAM 				<Training Weapon>
	_c pushBack "FIR_CATM120C_P_F23A_3rnd_M";						//CATM-120C AMRAAM x 3 			<Training Weapon>
	_c pushBack "FIR_CATM9M_P_1rnd_M";								//CATM-9M 						<Training Weapon>
	_c pushBack "FIR_CATM9M_LAU115_P_1rnd_M";						//CATM-9M Sidewinder 			<Training Weapon>
	//_c pushBack "FIR_CATM7_P_1rnd_M";								//CATM-7 Sparrow 				<Training Weapon>			//No class FIR_CATM7_2
	_c pushBack "FIR_CATM7_2_P_1rnd_M";								//CATM-7 Sparrow 				<Training Weapon>
	_c pushBack "FIR_CATM7_LAU115_P_1rnd_M";						//CATM-7M Sparrow 				<Training Weapon>
	_c pushBack "FIR_CATM7_P_F14_U1_1rnd_M";						//CATM-7 Sparrow 				<Training Weapon>
	_c pushBack "FIR_CATM7_P_F14_U2_1rnd_M";						//CATM-7 Sparrow 				<Training Weapon>
	_c pushBack "FIR_CATM7_P_F14_U3_1rnd_M";						//CATM-7 Sparrow 				<Training Weapon>
	_c pushBack "FIR_CATM7_P_F14_U4_1rnd_M";						//CATM-7 Sparrow 				<Training Weapon>
	_c pushBack "FIR_CATM54_P_1rnd_M";								//CATM-54 Phoenix 				<Training Weapon>
	_c pushBack "FIR_AAM3T_P_1rnd_M";								//AAM-3(Training) 				<Training Weapon>
	_c pushBack "FIR_AAM4T_P_1rnd_M";								//AAM-4(Training) 				<Training Weapon>
	_c pushBack "FIR_BDU57_P_1rnd_M";								//BDU-57 LGTR x1 				<Training Weapon>
	_c pushBack "FIR_BDU57_P_F15E_1rnd_M";							//BDU-57 LGTR x1 				<Training Weapon>
	_c pushBack "FIR_BDU57_P_F14_1rnd_M";							//BDU-57 LGTR x1 				<Training Weapon>
	_c pushBack "FIR_BDU57_P_2rnd_M";								//BDU-57 LGTR x2 				<Training Weapon>
	_c pushBack "FIR_BDU57_P_3rnd_M";								//BDU-57 LGTR x3 				<Training Weapon>
	_c pushBack "FIR_AerobaticSmoke_White_Engine_P_10rnd_M";		//Smoke generator(White) 		<smoke generator for engine>
	_c pushBack "FIR_AerobaticSmoke_Red_Engine_P_10rnd_M";			//Smoke generator(Red) 			<smoke generator for engine>
	_c pushBack "FIR_AerobaticSmoke_Blue_Engine_P_10rnd_M";			//Smoke generator(Blue) 		<smoke generator for engine>
	_c pushBack "FIR_AerobaticSmoke_Yellow_Engine_P_10rnd_M";		//Smoke generator(Yellow) 		<smoke generator for engine>
	_c pushBack "FIR_Smokewinder_White_P_10rnd_M";					//Smokewinder (White) 			<Smokewinder (White)>
	_c pushBack "FIR_Smokewinder_Red_P_10rnd_M";					//Smokewinder (Red) 			<Smokewinder (Red)>
	_c pushBack "FIR_Smokewinder_Blue_P_10rnd_M";					//Smokewinder (Blue) 			<Smokewinder (Blue)>
	_c pushBack "FIR_Smokewinder_Yellow_P_10rnd_M";					//Smokewinder (Yellow) 			<Smokewinder (Yellow)>
};

if(1227700 in _ownedDLCs && CTI_SOG_DLC > 0) then {		//Arma 3 Creator DLC: S.O.G. Prairie Fire
	_c pushBack "vn_fuel_mi2_mag_left";					//Fuel tank (Left) 		<Fuel tank (external)>
	_c pushBack "vn_fuel_mi2_mag_right";				//Fuel tank (Right) 	<Fuel tank (external)>
	_c pushBack "vn_fuel_f4_370_mag";					//Fuel tank 			<Fuel tank (external wing 370lbs)>
	_c pushBack "vn_fuel_f4_600_mag";					//Fuel tank 			<Fuel tank (center 600lbs)>
	_c pushBack "vn_fuel_mig17_mag";					//Fuel tank 			<Fuel tank (external wing 370lbs)>
	_c pushBack "vn_fuel_mig19_400_mag";				//Fuel tank 			<Fuel tank (400 L)>
	_c pushBack "vn_fuel_mig19_400_camo_01_mag";		//Fuel tank 			<Fuel tank camo (400 L)>
	_c pushBack "vn_fuel_mig19_760_mag";				//Fuel tank 			<Fuel tank (760 L)>
	_c pushBack "vn_fuel_mig19_760_camo_01_mag";		//Fuel tank 			<Fuel tank camo (760 L)>
	_c pushBack "vn_fuel_f100_335_mag";					//Fuel tank 			<Fuel tank (335 gal)>
	_c pushBack "vn_fuel_f100_335_camo_01_mag";			//Fuel tank 			<Fuel tank camo (335 gal)>
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
