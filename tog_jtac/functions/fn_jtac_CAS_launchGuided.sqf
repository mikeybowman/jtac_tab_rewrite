//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////
private ["_plane","_tgt","_speed","_type","_seconds","_ammo","_bomb","_travelTime","_steps","_relDirHor","_relDirVer","_velocityX","_velocityY","_velocityZ","_velocityForCheck"];
		_plane = _this select 0;
		_primaryTarget = _this select 1;
		_alterTgt = _this select 6;
		if (isNull _primaryTarget) then {
				_laser = nearestObjects [getPos _alterTgt, ["LaserTarget"], 1500];
				if (count _laser < 0) then {_primaryTarget = _laser select 0;} else {_primaryTarget = _alterTgt};
			};

		_defaultTargetPos = [(getPos _primaryTarget select 0) + (random 40), (getPos _primaryTarget select 1) + (random 40),0];
		_secondaryTarget = "HeliHEmpty" createVehicle _defaultTargetPos;
		_secondaryTarget setPos _defaultTargetPos;
		 _tgt = _primaryTarget;
		_speed = _this select 2;

		_markType = _this select 4;
		_seconds = 5;
		_ammo = _this select 3;
		_boom = _this select 5;


		_startBomb = createAgent ["Logic", [getPos _plane select 0, getPos _plane select 1,  (getPos _plane select 2) - 1], [] , 0 , "CAN_COLLIDE"];
		_bomb = _ammo createVehicle [(getPos _plane select 0) -3, getPos _plane select 1,  (getPos _plane select 2) - 5];
		_bomb setPos [(getPos _plane select 0) -3, getPos _plane select 1,  (getPos _plane select 2) - 5];

		_flyAmmo = {

			if (_bomb distance _tgt > (_speed / 20)) then {

				if (_markType == 1) then {
					_laser = nearestObjects [_defaultTargetPos, ["LaserTarget"], 1500];
					if (count _laser < 1) then {_tgt = _secondaryTarget;} else {_tgt = _laser select 0};
				};

				_travelTime = (_tgt distance _bomb) / _speed;
				_steps = floor (_travelTime * _seconds);
				_relDirHor = [_bomb, _tgt] call BIS_fnc_DirTo;
				_bomb setDir _relDirHor;

				_relDirVer = asin ((((getPosASL _bomb) select 2) - ((getPosASL _tgt) select 2)) / (_tgt distance _bomb));
				_relDirVer = (_relDirVer * -1);
				[_bomb, _relDirVer, 0] call BIS_fnc_setPitchBank;

				_velocityX = (((getPosASL _tgt) select 0) - ((getPosASL _bomb) select 0)) / _travelTime;
				_velocityY = (((getPosASL _tgt) select 1) - ((getPosASL _bomb) select 1)) / _travelTime;
				_velocityZ = (((getPosASL _tgt) select 2) - ((getPosASL _bomb) select 2)) / _travelTime;
			};
			[_velocityX, _velocityY, _velocityZ]
		};

		call _flyAmmo;
		if (_boom == "BOMB" || _boom == "MISSILE") then {

		//missile flying
			while {alive _bomb} do {
				_velocityForCheck = call _flyAmmo;
				if ({(typeName _x) == (typeName 0)} count _velocityForCheck == 3) then {_bomb setVelocity _velocityForCheck};
				sleep (1 / _seconds);
			};
		} else {
			if (_boom == "CARPET") then {
				sleep 0.02;
				_bomb2 = _ammo createVehicle [(getPos _plane select 0) -3, getPos _plane select 1,  (getPos _plane select 2) - 5];
				_bomb2 setPos [(getPos _plane select 0) -3, getPos _plane select 1,  (getPos _plane select 2) - 5];
				sleep 0.02;
				_bomb3 = _ammo createVehicle [(getPos _plane select 0) -3, getPos _plane select 1,  (getPos _plane select 2) - 5];
				_bomb3 setPos [(getPos _plane select 0) -3, getPos _plane select 1,  (getPos _plane select 2) - 5];

				while {alive _bomb && (_bomb distance _tgt) > 110} do {
					_velocityForCheck = call _flyAmmo;
					if ({(typeName _x) == (typeName 0)} count _velocityForCheck == 3) then {_bomb setVelocity _velocityForCheck; _bomb2 setVelocity [(_velocityForCheck select 0) -20,(_velocityForCheck select  1)-20, _velocityForCheck select  2];_bomb3 setVelocity [(_velocityForCheck select 0) +20,(_velocityForCheck select  1) +20, _velocityForCheck select  2];};
					sleep (1 / _seconds);
				};
				_pos1 = getpos _bomb;
				_pos2 = getpos _bomb2;
				_pos3 = getpos _bomb3;

				{
					_pos = _x;
					"SmallSecondary" createvehicle _pos;
  					for [{_i = 0} , {_i < 25}, {_i= _i + 1}] do {
	    				_nade = "Sh_120mm_HE_Tracer_Red" createvehicle _pos;
    					_nade setVelocity [-50 + (random 100),-50 + (random 100),-50];
   						 sleep 0.02;
 		 			};
 		 		} foreach [_pos1, _pos2, _pos3];
			};
		};
		deleteVehicle _startBomb;
		deleteVehicle _secondaryTarget;
