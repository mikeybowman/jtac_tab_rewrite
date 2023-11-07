//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////

//fn_jtac_openDoor
_class = _this select 0;
if (_class != "B_Heli_Transport_01_F" && _class != "I_Heli_Transport_02_F") exitWith {false};
_grp = _this select 1;
_action = _this select 2;
_door1 = "";
_door2 = "";
if (_class == "B_Heli_Transport_01_F") then {_door1 = "door_R"; _door2 = "door_L";};
if (_class == "I_Heli_Transport_02_F") then {_door1 = "door_back_R"; _door2 = "door_back_L";};
{(vehicle _x) animateDoor [_door1, _action]; (vehicle _x) animateDoor [_door2, _action];} foreach units _grp;