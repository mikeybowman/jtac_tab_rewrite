//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////
disableSerialization;
_track = _this select 0;

if (_track == 1) exitWith {TOG_jtac_track = false;};
if (TOG_jtac_track) exitWith {};

TOG_jtac_track = true;
_display = uiNamespace getVariable "TOG_jtac_abort_dlg";
_callSignList = _display displayCtrl 1004;
_size = lbSize _callSignList;
_selectedCallSign = lbCurSel _callSignList;
_callsign = _callSignList lbText _selectedCallSign;
_map = _display displayCtrl 1002;

_disttgt = _display displayCtrl 200001;
_distip = _display displayCtrl 200002;
_grp = nil;
_type = 0;
_grpType = 0;


{
	if (_x select 0 == _callsign) then {_grp = _x select 1; _grpType = _x select 2; _type = _x select 3; };
} foreach TOG_jtac_All_Groups_arr;

if (isNil "_grp") exitWith {};
[_grp,_grpType,_type,_callsign, _disttgt,_distip,_map] spawn {
disableSerialization;

	_grp = _this select 0;
	_grpType = _this select 1;
	_type = _this select 2;
	_callsign = _this select 3;
	_disttgt = _this select 4;
	_distip = _this select 5;
	_map = _this select 6;
	_leader = leader _grp;
	_pos = getPos _leader;
	_mrk_ico = "b_plane";
	if (_type == 2) then {_mrk_ico = "b_air";};
	_mrk_color = "ColorBlue";
	_mrk = createMarkerLocal ["TST", _pos];
	_mrk setMarkerTypeLocal _mrk_ico;
	_mrk setMarkerColorLocal _mrk_color;
	_mrk setMarkerText _callsign;
	_mrk_name_tgt = "";
	_mrk_name_ip = "";
	if (_grpType == 1 && (!isNil "_callsign")) then {

					_mrk_name_tgt = _callsign + "TGT";
					_mrk_name_ip = _callsign + "IP";

		} else {
			if (_grpType == 2 && (!isNil "_callsign")) then {
					_mrk_name_tgt = _callsign + "PICK";
					_mrk_name_ip = _callsign + "DEST";
			};

	};
	_pos1 =	getMarkerPos _mrk_name_tgt;
	_pos2 = getMarkerPos _mrk_name_ip;
	while {TOG_jtac_track && {alive _X} count (units _grp) > 0} do {
		_leader = leader _grp;
		_mrk setMarkerPos (getPos _leader);

		_checkDisttgt = [_leader, _pos1] call BIS_fnc_distance2D;
		_checkDistip = [_leader, _pos2] call BIS_fnc_distance2D;

		_disttgt ctrlSetText str _checkDisttgt;
		_distip ctrlSetText str _checkDistip;

		 _map ctrlMapAnimAdd [0, 0.1, getPos _leader];
		 ctrlMapAnimCommit _map;
		sleep 0.02;

	};
	deleteMarkerLocal _mrk;
};


