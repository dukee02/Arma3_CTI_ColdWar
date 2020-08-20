private "_faction", "_i", "_p", "_side", "_u", "_tech_level_no_upgrade_inv", "_tech_level";

_side = _this;

if(_side == west) then {
	_faction = "West";
} 
else {
	if(_side == east) then {
		_faction = "East";
	} 
	else {
		_faction = "";
	};
};

_tech_level_no_upgrade_inv = 1;
_tech_level = 0;

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

_i = [];
_u = [];
_p = [];

//(CTI_ECONOMY_PRIZE_WEAPONS*_level_start)
//100*1 -> $100 weapon
//((rnds*caliber)/1000)*((CTI_ECONOMY_PRIZE_WEAPONS*_level_start)/100)
//((30*545)/1000)*(100*1/100) = $16,35 -> ammo
/*
_i pushBack "";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((rnds*caliber)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);
*/

if(CTI_MAIN_ADDON == 0) then {_tech_level=3;} else {_tech_level=0;};

//---Weapons and Ammo---------------
_i pushBack "CUP_arifle_SR3M_Vikhr";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_SR3M_Vikhr_VFG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_SR3M_Vikhr_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_SR3M_Vikhr_VFG_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_smg_saiga9";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_smg_vityaz";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_smg_vityaz_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_smg_vityaz_vfg_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_smg_vityaz_vfg";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_smg_vityaz_vfg_front_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_sgun_Saiga12K";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_30Rnd_9x39_SP5_VIKHR_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_20Rnd_9x39_SP5_VSS_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_10Rnd_9x39_SP5_VSS_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_10Rnd_9x19_Saiga9";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_9x19AP_Vityaz";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_9x19_Vityaz";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_8Rnd_B_Saiga12_74Slug_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((8*120*74)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_8Rnd_B_Saiga12_74Pellets_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((8*120*74)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_arifle_AK74_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74_GL_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74M_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74M_camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74M_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74M_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74M_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74M_GL_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK74_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74_GL_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74U";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS74U_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK101";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK101_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK101_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK101_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK101_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK101_GL_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK102";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK102_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK102_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK105";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK105_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK105_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK107";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK107_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK107_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK107_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK107_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK107_GL_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK108";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK108_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK108_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK108_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK108_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK108_GL_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_30Rnd_556x45_AK";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Red_Tracer_556x45_AK";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Green_Tracer_556x45_AK";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Yellow_Tracer_556x45_AK";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_Subsonic_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_545x39_AK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_Subsonic_545x39_AK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_545x39_AK74_plum_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_Subsonic_545x39_AK74_plum_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74_plum_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK74_plum_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74_plum_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_545x39_AK74M_camo_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_545x39_Mag_Green_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_545x39_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_545x39_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_545x39_Mag_Tracer_Green_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_20Rnd_545x39_AKSU_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_20Rnd_Subsonic_545x39_AKSU_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((45*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((45*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_60Rnd_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((60*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_60Rnd_TE1_Green_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((60*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_60Rnd_TE1_Red_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((60*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_60Rnd_TE1_White_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((60*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_60Rnd_TE1_Yellow_Tracer_545x39_AK74M_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((60*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "CUP_arifle_AK47_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK47_GL_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKM_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKM_GL_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKM";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKM_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKM_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKM_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKMS_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKMS_GL_Early";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKMS";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKMS_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKMS_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKMS_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK47";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK47_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK47_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK47_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS_Gold";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AKS_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK103";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK103_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK103_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK103_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK103_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK103_GL_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK104";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK104_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK104_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK109";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK109_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK109_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK109_GL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK109_GL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AK109_GL_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_SVD_des_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_SVD_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_SVD_wdl_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_SVD";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_SVD_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_SVD_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58RIS1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58RIS1_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58RIS2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58RIS2_camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58RIS2_gl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58P";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58P_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58V";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_Sa58V_camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_SAIGA_MK03";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_SAIGA_MK03_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_SAIGA_MK03_Wood";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_SIAGE_MK03_Wood_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_30Rnd_762x39_AK47_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_762x39_AK47_bakelite_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_762x39_AK103_bakelite_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_762x39_AK47_TK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_20Rnd_762x39_AMD63_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_10Rnd_762x39_SaigaMk03_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((40*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Yellow_Tracer_762x39_bakelite_AK47_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Red_Tracer_762x39_AK103_bakelite_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_TE1_Yellow_Tracer_762x39_bakelite_AK103_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_762x39_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_762x39_Mag_Green_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_762x39_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_762x39_Mag_Tracer_Green_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_762x39_AK12_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30Rnd_762x39_AK12_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75Rnd_762x39_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75Rnd_762x39_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30rnd_762x39_AK12_Lush_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30rnd_762x39_AK12_Lush_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30rnd_762x39_AK12_Arid_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "30rnd_762x39_AK12_Arid_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75rnd_762x39_AK12_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75rnd_762x39_AK12_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75rnd_762x39_AK12_Lush_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75rnd_762x39_AK12_Lush_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75rnd_762x39_AK12_Arid_Mag_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "75rnd_762x39_AK12_Arid_Mag_Tracer_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_10Rnd_762x54_SVD_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "10Rnd_762x54_Mag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_Sa58_M_TracerG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_Sa58_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_10Rnd_762x39_SaigaMk03_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 2
_tech_level = _tech_level + 1;

_i pushBack "CUP_arifle_AS_VAL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AS_VAL_flash";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AS_VAL_VFG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AS_VAL_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AS_VAL_flash_top";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_AS_VAL_VFG_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_VSSVintorez";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_VSSVintorez_flash";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_VSSVintorez_VFG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_VSSVintorez_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_VSSVintorez_flash_top";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_srifle_VSSVintorez_VFG_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_20Rnd_9x39_SP5_VSS_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_10Rnd_9x39_SP5_VSS_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_9x39_SP5_VIKHR_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_10Rnd_9x39_SP5_VSS_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_20Rnd_9x39_SP5_VSS_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_30Rnd_9x39_SP5_VIKHR_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_srifle_ksvk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_5Rnd_127x108_KSVK_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((5*1270*108)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//---------MG------------
if(CTI_MAIN_ADDON == 0) then {_tech_level=3;} else {_tech_level=0;};

_i pushBack "CUP_arifle_RPK74M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_RPK74M_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_RPK74M_railed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_lmg_Pecheneg";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_lmg_PKM";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_RPK74";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_RPK74_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_RPK74_45";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_arifle_RPK74_45_top_rail";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((100*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((100*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((100*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//---------AT-Guns------------
_i pushBack "CUP_launch_RPG7V";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "CUP_PG7V_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (200)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_PG7VM_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (200)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_PG7VL_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (300)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_PG7VR_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (300)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_OG7_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (150)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_TBG7V_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (150)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "RPG7_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (200)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_tech_level = _tech_level + 1;

_i pushBack "CUP_launch_RPG18";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "CUP_RPG18_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (200)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_launch_Igla";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "CUP_Igla_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (200)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_tech_level = _tech_level + 1;

_i pushBack "CUP_launch_Metis";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "CUP_AT13_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (200)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_launch_9K32Strela";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "CUP_Strela_2_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (200)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//----------------Grenades------------------
if(CTI_MAIN_ADDON == 0) then {_tech_level=3;} else {_tech_level=0;};

_i pushBack "CUP_HandGrenade_RGD5";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (50)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_HandGrenade_RGO";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (50)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_1Rnd_HE_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (50)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_IlumFlareWhite_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_IlumFlareRed_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_IlumFlareGreen_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_FlareWhite_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_FlareGreen_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_FlareRed_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_FlareYellow_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_1Rnd_SMOKE_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_1Rnd_SmokeRed_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_1Rnd_SmokeGreen_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "CUP_1Rnd_SmokeYellow_GP25_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (10)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//--- Uniforms
if(CTI_MAIN_ADDON == 0) then {_tech_level=3;} else {_tech_level=0;};

_i pushBack "CUP_U_O_RUS_Gorka_Green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Gorka_Partizan_A";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Gorka_Partizan";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_EMR_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_M88_MSV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Flora_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_MSV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_worn_MSV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_worn_gloves_MSV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_MSV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_worn_MSV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_worn_gloves_MSV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Commander";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_EMR_2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_M88_MSV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Flora_2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_MSV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_worn_MSV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_MSV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_worn_MSV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_EMR_1_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_M88_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Flora_1_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Flora_3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_worn_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_worn_gloves_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_worn_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_worn_gloves_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_EMR_2_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_M88_VDV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Flora_2_VDV";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_VDV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR93_worn_VDV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_VDV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_VSR98_worn_VDV_rolled_up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_SLA_Officer_Suit";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_SLA_Overalls_Pilot";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_SLA_Overalls_Tank";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_SLA_MixedCamo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_SLA_Desert";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_SLA_Green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_SLA_Urban";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "CUP_U_O_RUS_Ghillie";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//--- Vests
_i pushBack "CUP_V_CDF_6B3_1_Green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_1_DES";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_1_URB";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_1_WDL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_1_DST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_1_FST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_1_MNT";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_1_SNW";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_Flora_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_Flora_2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_4";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_Flora_4";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_Flak_Vest03";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_Flak_Vest01";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_Flak_Vest02";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_4_Green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_4_DES";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_4_URB";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_4_WDL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_4_DST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_4_FST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_4_MNT";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_4_SNW";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_3_Green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_3_DES";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_3_URB";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_3_WDL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_3_DST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_3_FST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_3_MNT";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_3_SNW";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B3_Flora_3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_5_Green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_5_DES";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_5_URB";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_5_WDL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_5_DST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_5_FST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_5_MNT";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_5_SNW";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_2_Green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_2_DES";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_2_URB";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_O_SLA_6B3_2_WDL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_2_DST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_2_FST";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_2_MNT";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_CDF_6B3_2_SNW";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B45_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B45_2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "CUP_V_RUS_6B45_3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);


//--- Backpacks
_i pushBack "CUP_B_RUS_Pack_MG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "CUP_B_RPGPack_Khaki";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "CUP_B_RUS_Backpack";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "CUP_B_AGS30_Gun_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_AGS30_Tripod_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_DShkM_Gun_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_DShkM_TripodHigh_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_DShkM_TripodLow_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_Kord_Gun_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_Kord_Tripod_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_Metis_Gun_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_Metis_Tripod_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_Podnos_Gun_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_Podnos_Bipod_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_SPG9_Gun_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);

_i pushBack "CUP_B_SPG9_Tripod_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);


//--- Glasses


//---Attachments
//Optics
_i pushBack "CUP_optic_ekp_8_02";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_GOSHAWK";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_Kobra";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_NSPU";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PechenegScope";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_1_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_1_1_open";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_1_AK";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_1_AK_open";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_1_open";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PSO_3_open";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_NSPU_RPG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PGO7V";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PGO7V2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_optic_PGO7V3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);


//Rail Attachments
_i pushBack "CUP_acc_ANPEQ_15_Black";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Black_Top";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_OD";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_OD_Top";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Tan_Top";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Flashlight_Black_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Top_Flashlight_Black_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Flashlight_OD_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Top_Flashlight_OD_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Flashlight_Tan_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_2_camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_2_desert";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_ANPEQ_2_grey";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_Flashlight";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_Flashlight_desert";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_Flashlight_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_LLM";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_XM8_light_module";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);

_i pushBack "CUP_acc_Glock17_Flashlight";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/4);


// Muzzles
_i pushBack "CUP_muzzle_mfsup_Flashhider_762x39_Black";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_mfsup_Flashhider_762x39_OD";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_mfsup_Flashhider_762x39_Tan";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_KZRZP_AK762";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_Bizon";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_PB6P9";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_mfsup_Flashhider_556x45_Black";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_mfsup_Flashhider_556x45_OD";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_mfsup_Flashhider_556x45_Tan";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_G36_black";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_G36_desert";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_G36_wood";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_mfsup_SCAR_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_SCAR_L";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_M16";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_M16_desert";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

_i pushBack "CUP_muzzle_snds_M16_camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);


//--- Helms
_i pushBack "CUP_H_RUS_6B27";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_6B27_NVG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_6B27_olive";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_6B27_NVG_olive";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_6B46";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_6B47";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_6B47_SF";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_ZSH_1_Goggles";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_ZSH_1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_ZSH_Shield_Up";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "CUP_H_RUS_ZSH_Shield_Down";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);


//--- Items


[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf"; 
