//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////



_grp = _this select 0;

while {(count (waypoints _grp)) > 0} do
{
	deleteWaypoint ((waypoints _grp) select 0);
};