//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////

//fn_jtac_Search_Mark
private ["_markType","_callsign","_mrkTgt","_grp","_searchDist","_lasers","_laser","_tgt","_timeToWait","_isAborted","_smokeConfirmed"];
_markType = _this select 0;
_callsign = _this select 1;
_mrkTgt = _this select 2;
_grp = _this select 3;
_grpType = _this select 4;
_searchDist = 50;
_lasers = [];
_tgt = objNull;
_timeToWait = time + 180;
_isAborted = false;
_smokeConfirmed = objNull;
if (_grpType == 2) then {_searchDist = 300;};

smokeShellArr = [];
addSmokeY = nil;
addSmokeG = nil;
addSmokeR = nil;
addSmokeP = nil;
addSmokeO = nil;
addSmokeB = nil;

smokeY = "SmokeShellYellow";
smokeG = "SmokeShellGreen";
smokeR = "SmokeShellRed";
smokeP = "SmokeShellPurple";
smokeO = "SmokeShellOrange";
smokeB = "SmokeShellBlue";

smokeYgl = "G_40mm_SmokeYellow";
smokeGgl = "G_40mm_SmokeGreen";
smokeRgl = "G_40mm_SmokeRed";
smokePgl = "G_40mm_SmokePurple";
smokeOgl = "G_40mm_SmokeOrange";
smokeBgl = "G_40mm_SmokeBlue";

_item = (localize "STR_SMOKE");

_countShells = 0;
if (TOG_jtac_daytime == 2 && _markType == 2) then {
	smokeY = "Chemlight_yellow";
	smokeG = "Chemlight_green";
	smokeR = "Chemlight_red";
	smokeP = "";
	smokeO = "";
	smokeB = "Chemlight_blue";

	smokeYgl = smokeY;
	smokeGgl = smokeG;
	smokeRgl = smokeR;
	smokePgl = smokeP;
	smokeOgl = smokeO;
	smokeBgl = smokeB;

	_item = (localize "STR_LIGHTSTICK");
};

if (TOG_jtac_daytime == 2 && _markType == 3) then {
	smokeY = "F_40mm_Yellow";
	smokeG = "F_40mm_Green";
	smokeR = "F_40mm_Red";
	smokeP = "";
	smokeO = "";
	smokeB = "";

	smokeYgl = smokeY;
	smokeGgl = smokeG;
	smokeRgl = smokeR;
	smokePgl = smokeP;
	smokeOgl = smokeO;
	smokeBgl = smokeB;
	_searchDist = 500;
	_item = (localize "STR_FLARE");
};




////////////////////Start szukania
//////Laser
if (_markType == 1) then {
	waitUntil {
		_lasers = nearestObjects [getMarkerPos _mrkTgt, ["LaserTarget"], 1500];
		_isAborted = [_callsign] call TOG_fnc_jtac_Abort_check;
		if (count _lasers > 0) then {_tgt = _lasers select 0;};
		sleep 0.2;
		!isNull _tgt || _isAborted || {alive _x} count (units _grp) < 1 || time > _timeToWait
	};

} else {
//////DYM

	//funkcje dymu
	_countSmoke = {
			_smokeWhite = (count ((markerpos _mrkTgt) nearObjects ["SmokeShell",_searchDist]));
			_smokeYellow = (count ((markerpos _mrkTgt) nearObjects [smokeY,_searchDist]));
			_smokeYellowGL = (count ((markerpos _mrkTgt) nearObjects [smokeYgl,_searchDist]));
			_smokeGreen = (count ((markerpos _mrkTgt) nearObjects [smokeG,_searchDist]));
			_smokeGreenGL = (count ((markerpos _mrkTgt) nearObjects [smokeGgl,_searchDist]));
			_smokeRed = (count ((markerpos _mrkTgt) nearObjects [smokeR,_searchDist]));
			_smokeRedGL = (count ((markerpos _mrkTgt) nearObjects [smokeRgl,_searchDist]));
			_smokePurple= (count ((markerpos _mrkTgt) nearObjects [smokeP,_searchDist]));
			_smokePurpleGL= (count ((markerpos _mrkTgt) nearObjects [smokePgl,_searchDist]));
			_smokeOrange = (count ((markerpos _mrkTgt) nearObjects [smokeO,_searchDist]));
			_smokeOrangeGL = (count ((markerpos _mrkTgt) nearObjects [smokeOgl,_searchDist]));
			_smokeBlue = (count ((markerpos _mrkTgt) nearObjects [smokeB,_searchDist]));
			_smokeBlueGL = (count ((markerpos _mrkTgt) nearObjects [smokeBgl,_searchDist]));

			_smokeYellow = _smokeYellow + _smokeYellowGL;
			_smokeGreen = _smokeGreen + _smokeGreenGL;
			_smokeRed = _smokeRed + _smokeRedGL;
			_smokePurple = _smokePurple + _smokePurpleGL;
			_smokeOrange = _smokeOrange + _smokeOrangeGL;
			_smokeBlue = _smokeBlue + _smokeBlueGL;

			_smokeShells = _smokeYellow + _smokeGreen +_smokeRed +_smokePurple +_smokeOrange + _smokeBlue;

			[_smokeShells,_smokeYellow,_smokeGreen,_smokeRed,_smokePurple,_smokeOrange,_smokeBlue]
	};

	_confrimSmoke = {
			_smokeConfirmed  = (_this select 3) select 0;
			_grp = (_this select 3) select 1;
			leader _grp setVariable ["confrimsmoke",_smokeConfirmed,false];
	};



	waitUntil {
		//zliczanie dymu
		_isAborted = [_callsign] call TOG_fnc_jtac_Abort_check;
		_takeSmoke = call _countSmoke;
		_smokeShells = _takeSmoke select 0;
		if (_smokeShells > 0) then {

			_smokeYellow = _takeSmoke select 1;
			_smokeGreen = _takeSmoke select 2;
			_smokeRed = _takeSmoke select 3;
			_smokePurple= _takeSmoke select 4;
			_smokeOrange = _takeSmoke select 5;
			_smokeBlue = _takeSmoke select 6;



			if (_smokeYellow > _countShells && isNil "addSmokeY") then {
						_shell = nearestObject [markerPos _mrkTgt, smokeY];
						if (isNull _shell) then {_shell = nearestObject [markerPos _mrkTgt, smokeYgl];};
						_thisSmoke = [_shell,"#fff600",(localize "STR_SMOKE_YELLOW"),_item];
						addSmokeY = [["<t color='#c48214'>" + (localize "STR_SMOKE_CONFIRM") + "-" + (_thisSmoke select 2) + " " +(_thisSmoke select 3) +"</t>",_confrimSmoke,[_thisSmoke select 0,_grp]]] call CBA_fnc_addPlayerAction;
						smokeShellArr = smokeShellArr + [addSmokeY];
			};
			if (_smokeGreen > _countShells && isNil "addSmokeG") then {
						_shell = nearestObject [markerPos _mrkTgt, smokeG];
						if (isNull _shell) then {_shell = nearestObject [markerPos _mrkTgt, smokeGgl];};
						_thisSmoke = [_shell,"#21ff00",(localize "STR_SMOKE_GREEN"),_item];
						addSmokeG = [["<t color='#c48214'>" + (localize "STR_SMOKE_CONFIRM") + "-" + (_thisSmoke select 2) + " " + (_thisSmoke select 3) +"</t>",_confrimSmoke,[_thisSmoke select 0,_grp]]] call CBA_fnc_addPlayerAction;
						smokeShellArr = smokeShellArr + [addSmokeG];
			};
			if (_smokeRed > _countShells && isNil "addSmokeR") then {
						_shell = nearestObject [markerPos _mrkTgt, smokeR];
						if (isNull _shell) then {_shell = nearestObject [markerPos _mrkTgt, smokeRgl];};
						_thisSmoke = [_shell,"#ff0000",(localize "STR_SMOKE_RED"),_item];
						addSmokeR = [["<t color='#c48214'>" + (localize "STR_SMOKE_CONFIRM") + "-" + (_thisSmoke select 2) + " " + (_thisSmoke select 3) +"</t>",_confrimSmoke,[_thisSmoke select 0,_grp]]] call CBA_fnc_addPlayerAction;
						smokeShellArr = smokeShellArr + [addSmokeR];
			};
			if (_smokePurple > _countShells && isNil "addSmokeP") then {
						_shell = nearestObject [markerPos _mrkTgt, smokeP];
						if (isNull _shell) then {_shell = nearestObject [markerPos _mrkTgt, smokePgl];};
						_thisSmoke = [_shell,"#bf00ff",(localize "STR_SMOKE_PURPLE"),_item];
						addSmokeP = [["<t color='#c48214'>" + (localize "STR_SMOKE_CONFIRM") + "-" + (_thisSmoke select 2) + " " + (_thisSmoke select 3) +"</t>",_confrimSmoke,[_thisSmoke select 0,_grp]]] call CBA_fnc_addPlayerAction;
						smokeShellArr = smokeShellArr + [addSmokeP];
			};
			if (_smokeOrange > _countShells && isNil "addSmokeO") then {
						_shell = nearestObject [markerPos _mrkTgt, smokeO];
						if (isNull _shell) then {_shell = nearestObject [markerPos _mrkTgt, smokeOgl];};
						_thisSmoke = [_shell,"#ffa100",(localize "STR_SMOKE_ORANGE"),_item];
						addSmokeO = [["<t color='#c48214'>" + (localize "STR_SMOKE_CONFIRM") + "-" + (_thisSmoke select 2) + " " + (_thisSmoke select 3) +"</t>",_confrimSmoke,[_thisSmoke select 0,_grp]]] call CBA_fnc_addPlayerAction;
						smokeShellArr = smokeShellArr + [addSmokeO];
			};
			if (_smokeBlue > _countShells && isNil "addSmokeB") then {
						_shell = nearestObject [markerPos _mrkTgt, smokeB];
						if (isNull _shell) then {_shell = nearestObject [markerPos _mrkTgt, smokeBgl];};
						_thisSmoke = [_shell,"#ffa100",(localize "STR_SMOKE_BLUE"),_item];
						addSmokeB = [["<t color='#c48214'>" + (localize "STR_SMOKE_CONFIRM") + "-" + (_thisSmoke select 2) + " " + (_thisSmoke select 3) +"</t>",_confrimSmoke,[_thisSmoke select 0,_grp]]] call CBA_fnc_addPlayerAction;
						smokeShellArr = smokeShellArr + [addSmokeB];
			};

		};
		_smokeConfirmed = leader _grp getVariable["confrimsmoke",objNull];
		if (!isNull _smokeConfirmed) then {
			{
				if (!isNil "_x") then {
					[_x] call CBA_fnc_removePlayerAction
				};
			} foreach smokeShellArr;
			_tgt = _smokeConfirmed;
		};
		sleep 0.2;
		!isNull _tgt || _isAborted || {alive _x} count (units _grp) < 1 || time > _timeToWait
	};

};

//Koniec sprawdzania
[_tgt,_isAborted];