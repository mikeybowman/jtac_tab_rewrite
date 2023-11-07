//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////
_idd = _this select 2;
		_grp = _this select 3;
		leader _grp  setVariable["waitForLoad",false,true];
		{(vehicle _x) removeAction _idd} foreach units _grp;
