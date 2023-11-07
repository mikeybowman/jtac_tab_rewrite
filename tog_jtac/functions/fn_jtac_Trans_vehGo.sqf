//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////
_grp = _this select 0;
		{if (_x == driver vehicle _x) then { (vehicle _x) addaction ["<t color='#c48214'>GO</t>",TOG_fnc_jtac_Trans_vehGoRemoveAction,_grp,0,false,true,"","_this in _target"];};} foreach units _grp;
