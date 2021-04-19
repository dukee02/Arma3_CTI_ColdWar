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
//_i pushBack "gm_p1_blk";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//_i pushBack "gm_8rnd_9x19mm_b_dm11_p1_blk";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round ((8*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//_i pushBack "gm_1Rnd_265mm_flare_single_wht_gc";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//-----------MPs----------------------

_i pushBack "gm_mp5a2_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mp5a3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_30Rnd_9x19mm_B_DM51_mp5_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_9x19mm_B_DM11_mp5_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_9x19mm_AP_DM91_mp5_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "gm_mp5sd2_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mp5sd3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//-----------Assaultgun----------------------
_tech_level = 0;
_i pushBack "gm_gvm95_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_20Rnd_556x45mm_B_M855_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_556x45mm_B_T_M856_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_20Rnd_556x45mm_B_M193_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "gm_gvm75_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gvm75_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gvm75_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gvm75carb_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gvm75carb_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gvm75carb_grn";
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


//Level 2
_tech_level = _tech_level + 1;

_i pushBack "gm_30Rnd_556x45mm_B_M193_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_556x45mm_B_M855_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_556x45mm_B_T_M856_stanag_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((20*556*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//--------MG-------------
//Level 2
//_tech_level = _tech_level + 1;

//_i pushBack "gm_mg3_blk";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//_i pushBack "gm_120Rnd_762x51mm_b_t_DM21_mg3_grn";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round ((120*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//----------AT Guns-------------------------
_tech_level = 0;

_i pushBack "gm_m72a3_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_1Rnd_66mm_heat_m72a3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//Throwables
_tech_level = 0;

//_i pushBack "gm_handgrenade_frag_dm51a1";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);
 	

//--- Uniforms
_tech_level = 0;

_i pushBack "gm_dk_army_uniform_soldier_84_m84";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_army_uniform_soldier_84_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_army_uniform_soldier_84_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//--- Vests
_tech_level = 0;

_i pushBack "gm_dk_army_vest_54_rifleman";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_54_machinegunner";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_54_crew";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_tech_level = 2;

_i pushBack "gm_dk_army_vest_m00_m84";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_m84_machinegunner";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_win_machinegunner";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_m84_rifleman";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_win_rifleman";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_dk_army_vest_m00_wdl_rifleman";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);


//--- Backpacks
_i pushBack "gm_dk_army_backpack_73_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

//_i pushBack "gm_milan_launcher_weaponBag";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);


//--- Glasses
//_i pushBack "gm_ge_facewear_m65";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);


//--- Attachments
//_tech_level = 0;
//_tech_level = 1;
_tech_level = 2;

_i pushBack "gm_c79a1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_c79a1_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));



//--- Helms
_tech_level = 0;

_i pushBack "gm_dk_headgear_hat_boonie_m84";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_dk_headgear_m52_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_headgear_m52_net_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_headgear_m52_net_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_tech_level = 2;

_i pushBack "gm_dk_headgear_m96_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_headgear_m96_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_headgear_m96_cover_m84";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_headgear_m96_cover_wht";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_dk_headgear_m96_cover_wdl";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


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

/*_i pushBack "gm_repairkit_01";
_u pushBack 0;
_p pushBack 25;*/

_i pushBack "gm_ge_army_gauzeBandage";
_u pushBack 0;
_p pushBack 15;

_i pushBack "gm_ge_army_gauzeCompress";
_u pushBack 0;
_p pushBack 15;


[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";