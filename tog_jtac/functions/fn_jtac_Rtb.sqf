//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////

//[_grp,_callsign,_grpType,_typeCas,_vehSpawnPos]


_grp = _this select 0;
_callsign = _this select 1;
_grpType = _this select 2;
_requestType = _this select 3;
_pos = _this select 4;
_alive = {alive _X} count (units _grp);
_arr = [];
_mrkArr = [];
if (_grpType == 1) then {
	_mrkArr = ["TGT","IP","FRIENDS"];
	switch (_requestType) do {
		case 1:{
			_arr = TOG_jtac_CAS_Plane_arr;
		};
		case 2: {
			_arr = TOG_jtac_CAS_Heli_arr;
		};
	};
} else {
	_mrkArr = ["PICK","DEST"];
	_arr - TOG_jtac_Trans_Heli_arr;
};


//TALK
if (!isNil "_callsign") then {leader _grp sideChat format["%1 %2 %3 %4. %5 ",groupId (group player),(localize 'STR_RADIO_THISIS'),_callsign,(localize 'STR_RADIO_RTB'),(localize 'STR_RADIO_OUT')];};

//Usuwanie waypointów
while {(count (waypoints _grp)) > 0} do {
	 	deleteWaypoint ((waypoints _grp) select 0);
};

//WP dla RTB
{
	_x enableAi "MOVE";
	(vehicle _x) enableAi "MOVE";
} foreach units _grp;

_grp setBehaviour "CARELESS";
_grp setCombatMode "BLUE";
_wp = _grp addWaypoint [_pos,0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 500;
_wp setWaypointSpeed "FULL";
_wp setWaypointFormation "WEDGE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "BLUE";

//Usuwanie markerow
{
	_mrk_name = _callsign + _x;
	_distMrkName = _mrk_name + "dist";
	deleteMarker _mrk_name;
	deleteMarker _distMrkName;
} foreach _mrkArr;


waitUntil {([leader _grp, waypointPosition _wp] call BIS_fnc_distance2D < 300) || ({alive _X} count (units _grp) < 1)};


//Czy nadal żyją
_isAlive = [_grp,_callsign,_grpType,_requestType] call TOG_fnc_jtac_ifalive;
if (!_isAlive) exitWith {};

{
	deleteVehicle (vehicle _x);
	deleteVehicle _x;
} foreach units _grp;

//Usuwanie z tablic
TOG_jtac_Requested_arr = TOG_jtac_Requested_arr -[_callsign];
{
	if (_x select 0 == _callsign) then {TOG_jtac_All_Groups_arr = TOG_jtac_All_Groups_arr - [_x];};
} foreach TOG_jtac_All_Groups_arr;

{
	if (_x select 0 == _callsign) then {
		TOG_jtac_AbortCodes_arr = TOG_jtac_AbortCodes_arr - [_x];
		publicVariable "TOG_jtac_AbortCodes_arr";
	};
} foreach TOG_jtac_AbortCodes_arr;

{
	if (_x select 0 == _callsign) then {
		_isAborted = true;
		TOG_jtac_Aborted_arr = TOG_jtac_Aborted_arr - [_x];
	};
} foreach TOG_jtac_Aborted_arr;



//Upublicznianie tablic
publicVariable "TOG_jtac_All_Groups_arr";
publicVariable "TOG_jtac_Requested_arr";
publicVariable "TOG_jtac_AbortCodes_arr";
publicVariable "TOG_jtac_Aborted_arr";





