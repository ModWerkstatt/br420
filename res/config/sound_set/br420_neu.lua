local soundsetutil = require "soundsetutil"

function data()

local data = soundsetutil.makeSoundSet()

soundsetutil.addTrackParam01
(data, "vehicle/br420/420_stand.wav", 25.0,
		{ 
		{ .0, 1.0 },
		{ 1.0, 0.75 } },
		{ 
		{ .0, 1.0 },
		{ 1.0, 1.0 }  },
		"speed01")	
		
soundsetutil.addTrackParam01
(data, "vehicle/br420/420_anf1e.wav", 25.0,
		{ 
		{ .0, 0.0 },
		{ .01, 0.5 },
		{ .1, 1.0 },
		{ .25, 1.0 },
		{ .4, 0.0 },
		{ 1.0, 0.0 }}, 
		{ 
		{ .0, 0.9 },
		{ .3, 1.0 },
		{ .5, 1.25 },
		{ .6, 0.0 },
		{ 1.0, 0.0 }  },
		"speed01")
		
		
soundsetutil.addTrackParam01
(data, "vehicle/br420/420_anf2.wav", 25.0,
		{ 
		{ .0, .0 },
		{ .1, 0.7 }, 
		{ .2, 1.0 }, 
		{ 1.0, 1.0 } },
		{ 
		{ .0, 0.6 },
		{ .1, 0.9 },
		{ .2, 1.0 },
		{ .35, 1.15 },
		{ .75, 1.75 },
		{ 1.0, 2.0 } },
		"speed01")
	
soundsetutil.addTrackParam01
(data, "vehicle/br420/gw_roll_a.wav", 25.0,
		{
			{ .0, .0 },
			{ .2, .3 },
			{ 1.0, 0.9 } },
		{
			{ .0, 0.4 }, 
			{ 1.0, 1.3 } },
		"speed01")

soundsetutil.addEvent(data, "horn", { "vehicle/br420/420_pfiff.wav" }, 50.0)
soundsetutil.addTrackSqueal(data, "vehicle/br420/kurve.wav", 25.0)
soundsetutil.addTrackBrake(data, "vehicle/br420/420_brems.wav", 25.0, 1.0)

soundsetutil.addEvent(data, "openDoors", { "vehicle/br420/420_tur_auf.wav" }, 9.0)
soundsetutil.addEvent(data, "closeDoors", { "vehicle/br420/420_tur_zu_neu.wav" }, 9.0)

return data

end