//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////
private ["_pos"];
_pilot =  _this select 0;
			_plane = (vehicle _pilot);
			_tgt = _this select 1;
			_alterTgt = _this select 5;
			_vehCallsign = _this select 6;
			{_x allowDamage false} foreach [_pilot, _plane];
			if (isNull _tgt) then {
				_laser = nearestObjects [getPos _alterTgt, ["LaserTarget"], 1500];
				if (count _laser < 0) then {_tgt = _laser select 0;} else {_tgt = _alterTgt};
			};
			_mrkTgt = _this select 2;
			_mrkIp = _this select 3;
			_planeClass = _this select 4;
			_planeCfg = configfile >> "cfgvehicles" >> _planeClass;
			if !(isclass _planeCfg) exitwith {["Vehicle class '%1' not found",_planeClass] call bis_fnc_error; false};
			_weaponTypes = ["machinegun","missilelauncher"];
			_weapons = [];
			{
				if (tolower ((_x call bis_fnc_itemType) select 1) in _weaponTypes) then {
					_modes = getarray (configfile >> "cfgweapons" >> _x >> "modes");
					if (count _modes > 0) then {
						_mode = _modes select 0;
						if (_mode == "this") then {_mode = _x;};
						_weapons set [count _weapons,[_x,_mode]];
					};
				};
			} foreach getarray (_planeCfg >> "weapons");
			if (count _weapons == 0) exitwith {["No weapon of type 'MachineGun' wound on '%1'",_planeClass] call bis_fnc_error; false};
			_posATL = getposatl _tgt;
			_pos = +_posATL;
			_pos set [2,(_pos select 2) + getterrainheightasl _pos];
			_dir = ((getMarkerPos _mrkTgt select 0) - (getMarkerPos _mrkIp select 0)) atan2 ((getMarkerPos _mrkTgt select 1) - (getMarkerPos _mrkIp select 1));
			_dis = [getMarkerPos _mrkTgt, getMarkerPos _mrkIp] call BIS_fnc_distance2D;
			_alt = 1000;
			_pitch = atan (_alt / _dis);
			_speed = 500 / 3.6;
			_duration = ([0,0] distance [_dis,_alt]) / _speed;
			_planePos = [_pos,_dis,_dir + 180] call bis_fnc_relpos;
			_planePos set [2,(_pos select 2) + _alt];
			_plane move _planePos;

			 waitUntil {[_plane, _planePos] call BIS_fnc_distance2D < 300};



					_plane setpos _planePos;
					_plane move ([_pos,_dis,_dir] call bis_fnc_relpos);
					_plane disableai "move";
					_plane disableai "target";
					_plane disableai "autotarget";
					_plane setcombatmode "blue";

					_vectorDir = [_planePos,_pos] call bis_fnc_vectorFromXtoY;
					_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;
					_plane setvectordir _vectorDir;
					[_plane,-90 + atan (_dis / _alt),0] call bis_fnc_setpitchbank;
					_vectorUp = vectorup _plane;

					_currentWeapons = weapons _plane;
					{
						if !(tolower ((_x call bis_fnc_itemType) select 1) in (_weaponTypes + ["countermeasureslauncher"])) then {
							_plane removeweapon _x;
						};
					} foreach _currentWeapons;
					_fire = [] spawn {waituntil {false}};
					_fireNull = true;
					_time = time;
					_offset = if ({_x == "missilelauncher"} count _weaponTypes > 0) then {20} else {0};
					//is aborted?
					_isAborted = [_vehCallsign] call TOG_fnc_jtac_Abort_check;
					if (_isAborted) exitWith {
						leader (group _pilot) setVariable["casDirect",false,false];
						_plane enableai "move";
					};
					waituntil {
						_fireProgress = _plane getvariable ["fireProgress",0];

						if ((getposatl _tgt distance _posATL > 0 ) && _fireProgress == 0) then {
						_posATL = getposatl _tgt;
						_pos = +_posATL;
						_pos set [2,(_pos select 2) + getterrainheightasl _pos];
						//_dir = direction _tgt;
						//missionnamespace setvariable [_dirVar,_dir];
						_planePos = [_pos,_dis,_dir + 180] call bis_fnc_relpos;
						_planePos set [2,(_pos select 2) + _alt];
						_vectorDir = [_planePos,_pos] call bis_fnc_vectorFromXtoY;
						_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;
						_plane setvectordir _vectorDir;
						_vectorUp = vectorup _plane;

						_plane move ([_pos,_dis,_dir] call bis_fnc_relpos);
					};
						//--- Set the plane approach vector
					_plane setVelocityTransformation [
						_planePos, [_pos select 0,_pos select 1,(_pos select 2) + _offset + _fireProgress * 12],
						_velocity, _velocity,
						_vectorDir,_vectorDir,
						_vectorUp, _vectorUp,
						(time - _time) / _duration
					];
					_plane setvelocity velocity _plane;
					//is aborted?
					if (_isAborted) exitWith {
						leader (group _pilot) setVariable["casDirect",false,false];
						_plane enableai "move";
					};
					//--- Fire!
					if ((getposasl _plane) distance _pos < 1000 && _fireNull) then {
						_fireNull = false;
						terminate _fire;
						_fire = [_plane,_weapons] spawn {
							_plane = _this select 0;
							_planeDriver = driver _plane;
							_weapons = _this select 1;
							_duration = 3;
							_time = time + _duration;
							waituntil {
								{
									//_plane selectweapon (_x select 0);
									_planeDriver forceweaponfire _x;
								} foreach _weapons;
								_plane setvariable ["fireProgress",(1 - ((_time - time) / _duration)) max 0 min 1];
								sleep 0.1;
								time > _time || isnull _plane
							};
							sleep 1;
						};
					};

					sleep 0.01;
					scriptdone _fire || isnull _tgt || isnull _plane
				};
				_plane setvelocity velocity _plane;
				_plane flyinheight (_alt+200);

				waituntil {(getPosAtl _plane) select 2 > _alt};
				_plane enableai "move";
				_plane setVehicleAmmo 1;


				leader (group _pilot) setVariable["casDirect",false,false];
