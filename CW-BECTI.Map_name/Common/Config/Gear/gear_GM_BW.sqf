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

//-------Pistol + Ammo------------
_i pushBack "gm_p1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_8rnd_9x19mm_b_dm11_p1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((8*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_8rnd_9x19mm_b_dm51_p1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((8*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_mp2a1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_32Rnd_9x19mm_b_DM51_mp2_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((32*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_32Rnd_9x19mm_b_DM11_mp2_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((32*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_p2a1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_1Rnd_265mm_flare_para_yel_DM16";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_single_wht_DM15";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_single_red_DM13";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_single_grn_DM11";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_single_yel_DM10";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_multi_wht_DM25";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_multi_red_DM23";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_multi_grn_DM21";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_multi_yel_DM20";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_smoke_single_yel_DM19";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_smoke_single_org_DM22";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_smoke_single_vlt_DM24";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_multi_nbc_DM47";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//---Grenadelauncher Ammo---------------
_i pushBack "gm_hk69a1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "1Rnd_HE_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 20*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "UGL_FlareWhite_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "UGL_FlareGreen_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "UGL_FlareRed_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "UGL_FlareYellow_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "UGL_FlareCIR_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "1Rnd_Smoke_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "1Rnd_SmokeRed_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "1Rnd_SmokeGreen_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "1Rnd_SmokeYellow_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "1Rnd_SmokePurple_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "1Rnd_SmokeBlue_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "1Rnd_SmokeOrange_Grenade_shell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//-----------Assaultgun----------------------
_i pushBack "gm_m16a1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_m16a2_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_30Rnd_556x45mm_B_M855_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_556x45mm_B_T_M856_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_556x45mm_B_M855_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_556x45mm_B_T_M856_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "gm_g3a4_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g3a4_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g3a4_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g3a4_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_20Rnd_762x51mm_b_t_DM21_g3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_t_DM21A1_g3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_t_DM21A2_g3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_DM111_g3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_DM41_g3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_ap_DM151_g3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_t_DM21_g3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_t_DM21A1_g3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_t_DM21A2_g3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_DM111_g3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_b_DM41_g3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_762x51mm_ap_DM151_g3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1rnd_67mm_heat_dm22a1_g3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_g3a3_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g3a3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g3a3_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g3a3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 2
_tech_level = _tech_level + 1;

_i pushBack "gm_g36e_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g36a1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_g36a1_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_30Rnd_556x45mm_B_DM11_g36_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_556x45mm_B_T_DM21_g36_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_556x45mm_B_DM11_g36_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_556x45mm_B_T_DM21_g36_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//--------MG-------------
//Level 2
_tech_level = _tech_level + 1;

_i pushBack "gm_mg3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mg3_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_120Rnd_762x51mm_b_t_DM21_mg3_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((120*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_120Rnd_762x51mm_b_t_DM21A1_mg3_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((120*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_120Rnd_762x51mm_b_t_DM21A2_mg3_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((120*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//----------AT Guns-------------------------
_tech_level = 0;

_i pushBack "gm_pzf44_2_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_pzf44_2_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_pzf44_2_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_1Rnd_44x537mm_heat_DM32_pzf44_2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "gm_pzf84_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_pzf84_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_pzf84_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_84x245mm_illum_DM16_carlgustaf";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 2
_tech_level = _tech_level + 1;
_i pushBack "gm_fim43_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_1Rnd_70mm_he_m585_fim43";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_milan_heat_dm82";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_milan_heat_dm92";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_pzf3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_1Rnd_60mm_heat_dm12_pzf3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_60mm_heat_dm22_pzf3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 250*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_60mm_heat_dm32_pzf3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 300*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);



//Throwables
_tech_level = 0;

_i pushBack "gm_handgrenade_frag_dm51a1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_handgrenade_frag_dm51";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_handgrenade_pracfrag_dm58";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_handgrenade_conc_dm51";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_handgrenade_conc_dm51a1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_handgrenade_pracconc_dm58";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


_i pushBack "gm_smokeshell_grn_dm21";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_red_dm23";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_yel_dm26";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_org_dm32";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_wht_dm25";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);



_i pushBack "gm_mine_at_dm21";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_mine_ap_dm31";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_explosive_petn_charge";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_explosive_plnp_charge";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);
 	


//--- Uniforms
_tech_level = 0;

_i pushBack "gm_ge_army_uniform_crew_80_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_soldier_80_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_soldier_80_ols";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_soldier_parka_80_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_soldier_parka_80_ols";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_soldier_parka_80_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_bgs_uniform_soldier_80_smp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_pilot_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_pilot_rolled_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_pilot_sar";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_pilot_rolled_sar";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_pol_uniform_pilot_rolled_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_civ_uniform_blouse_80_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_dbp_uniform_suit_80_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_ff_uniform_man_80_orn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_pol_uniform_blouse_80_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_pol_uniform_suit_80_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_tech_level = 1;
_i pushBack "gm_xx_uniform_soldier_bdu_nogloves_80_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_xx_uniform_soldier_bdu_80_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_xx_uniform_soldier_bdu_rolled_80_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_tech_level = 2;
_i pushBack "gm_ge_uniform_soldier_90_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_uniform_soldier_rolled_90_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_uniform_soldier_tshirt_90_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_crew_90_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_uniform_soldier_90_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_uniform_soldier_tshirt_90_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_uniform_soldier_rolled_90_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_army_uniform_crew_90_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//--- Vests
_tech_level = 0;
_i pushBack "gm_ge_army_vest_80_belt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_80_bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_bgs_vest_80_rifleman";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_80_crew";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_80_demolition";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_80_leader";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_80_machinegunner";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_80_medic";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

//_i pushBack "gm_ge_army_vest_80_mp_wht";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

//_i pushBack "gm_ge_army_vest_80_officer";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_pol_vest_80_wht";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_80_rifleman";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_tech_level = 1;
_i pushBack "gm_ge_army_vest_pilot_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_army_vest_pilot_pads_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_tech_level = 2;
_i pushBack "gm_ge_vest_armor_90_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_vest_armor_90_crew_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_vest_armor_90_demolition_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_vest_armor_90_leader_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_vest_armor_90_machinegunner_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_vest_armor_90_medic_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_vest_armor_90_officer_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_ge_vest_armor_90_rifleman_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);


//--- Backpacks
_tech_level = 0;
_i pushBack "gm_ge_army_backpack_80_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_ge_army_backpack_80_pzf44_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_ge_backpack_satchel_80_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_ge_backpack_satchel_80_san";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_Parachute";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_tech_level = 2;

_i pushBack "gm_ge_army_backpack_90_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_ge_army_backpack_90_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_ge_army_backpack_90_cover_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_milan_launcher_weaponBag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);


//--- Glasses
_tech_level = 0;

_i pushBack "gm_ge_facewear_m65";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_01";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_02";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_03";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_04";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_01";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_02";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_03";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_04";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);


//--- Attachments
_tech_level = 0;
_i pushBack "acc_flashlight";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "acc_pointer_IR";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "muzzle_snds_M";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "muzzle_snds_m_khk_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "muzzle_snds_m_snd_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_feroz2x17_pzf44_2_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_feroz2x17_pzf44_2_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_feroz2x17_pzf44_2_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_tech_level = 1;
_i pushBack "muzzle_snds_B";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "muzzle_snds_B_arid_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "muzzle_snds_B_khk_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "muzzle_snds_B_lush_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "muzzle_snds_B_snd_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_feroz2x17_pzf84_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_feroz2x17_pzf84_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_feroz2x17_pzf84_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_tech_level = 2;

_i pushBack "gm_feroz24_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_feroz24_des";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));



//--- Helms
_tech_level = 0;
_i pushBack "gm_ge_headgear_hat_80_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_80_m62_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_80_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_boonie_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_antiair";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_blk_antitank";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_blk_armor";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_blk_armorrecon";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_bdx_armyaviation";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_artillery";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_un";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_mrb";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_engineer";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_grn_guardbtl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_grn_infantry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_bdx_lrrp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_maintenance";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_grn_mechinf";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_blu_medical";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_militarypolice";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_grn_music";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_nbc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_opcom";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_bdx_paratrooper";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_blk_recon";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_signals";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_bdx_specop";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_supply";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_red_geoinfo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_crewhat_80_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_headset_crew_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_antiair";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_blk_antitank";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_blk_armor";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_blk_armorrecon";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_artillery";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_engineer";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_maintenance";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_grn_mechinf";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_militarypolice";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_nbc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_opcom";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_bdx_paratrooper";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_blk_recon";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_signals";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_beret_crew_red_supply";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_80_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_80_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_80_m62_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_bgs_headgear_m35_53_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_bgs_headgear_m35_53_net_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_ff_headgear_m35_53_tan";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m62";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m62_cover_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m62_net";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m62_win_pap_01";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m62_cover_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_pol_headgear_cap_80_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_pol_headgear_cap_80_wht";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_dbp_headgear_cap_80_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_winterhat_80_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_beanie_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_sph4_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_facewear_m65";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_tech_level = 2;
_i pushBack "gm_ge_headgear_m92_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m92_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m92_glasses_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m92_glasses_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m92_cover_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_m92_cover_glasses_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_sph4_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_ge_headgear_hat_90_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_90_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_boonie_trp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_boonie_flk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_dk_headgear_hat_boonie_m84";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_ge_headgear_hat_boonie_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);


//--- Items
_i pushBack "gm_ferod16_des";
_u pushBack 0;
_p pushBack 5;

_i pushBack "gm_ferod16_oli";
_u pushBack 0;
_p pushBack 5;

_i pushBack "gm_ferod16_win";
_u pushBack 0;
_p pushBack 5;

_i pushBack "gm_ge_army_conat2";
_u pushBack 0;
_p pushBack 1;

_i pushBack "gm_watch_kosei_80";
_u pushBack 0;
_p pushBack 1;

_i pushBack "Toolkit";
_u pushBack 0;
_p pushBack 750;

//don't work corretly in CTI
/*_i pushBack "gm_repairkit_01";
_u pushBack 0;
_p pushBack 25;*/

_i pushBack "gm_ge_army_gauzeBandage";
_u pushBack 0;
_p pushBack 15;

_i pushBack "gm_ge_army_gauzeCompress";
_u pushBack 0;
_p pushBack 15;

//no alternative for this in GM
_i pushBack "Laserdesignator";
_u pushBack 3;
_p pushBack 1000;

_i pushBack "Laserbatteries";
_u pushBack 0;
_p pushBack 50;

_i pushBack "MineDetector";
_u pushBack 0;
_p pushBack 300;


[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";