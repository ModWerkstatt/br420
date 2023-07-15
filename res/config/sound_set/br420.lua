local bb420util = require "bb420util"

function data()

-- Erweiterungsfunktion zur Ansteuerung dank Hilfe von EAT1963
	-- Anfahrt 1


return {
	tracks = {
		{ name = "vehicle/br420/gw_roll_a.wav", refDist = 25.0 },	
		{ name = "vehicle/br420/420_stand.wav", refDist = 25.0 },
		{ name = "vehicle/br420/420_anf1e.wav", refDist = 25.0 },
		{ name = "vehicle/br420/420_anf2.wav", refDist = 25.0 },	
		
		{ name = "vehicle/br420/kurve.wav", refDist = 20.0 },
		{ name = "vehicle/br420/420_brems.wav", refDist = 25.0 },
		{ name = "vehicle/br420/420_anf2.wav", refDist = 25.0 },
		
	},
	events =  {
		horn = { names = { "vehicle/br420/420_pfiff.wav" }, refDist = 25.0 },
		openDoors = { names = { "vehicle/br420/420_tur_auf.wav" }, refDist = 9.0 },	
		closeDoors = { names = { "vehicle/br420/420_tur_zu.wav" }, refDist = 9.0 }
	},

	updateFn = function (input)
		local axleRefWeight = 10.0
		
		return {
			tracks = {
				--roll
				{ 
					gain = bb420util.sampleCurve({  
									{ .0, .0 },
									{ .2, .3 },
									{ 1.0, 0.9 } }, input.speed01),
					pitch = bb420util.sampleCurve({  
									{ .0, 0.4 }, 
									{ 1.0, 1.3 } }, input.speed01)
				},				
				--stand
				{ 
					gain = bb420util.sampleCurve({ 
									{ .0, 1.0 },
									{ 1.0, 0.75 } }, input.speed01),
					pitch = bb420util.sampleCurve({ 
									{ .0, 1.0 },
									{ 1.0, 1.0 } }, input.speed01)
				},
				--anf1
				{ 
					gain = bb420util.sampleCurve({ 
									{ .0, 0.0 },
									{ .01, 0.5 },
									{ .1, 1.0 },
									{ .25, 1.0 },
									{ .4, 0.0 },
									{ 1.0, 0.0 } }, input.speed01),
					pitch = bb420util.sampleCurve({ 
									{ .0, 0.9 },
									{ .3, 1.0 },
									{ .5, 1.25 },
									{ .6, 0.0 },
									{ 1.0, 0.0 } }, input.speed01)
				},				
							
				--anf2
				{ 
					gain = bb420util.sampleCurve({ 
									{ .0, .0 },
									{ .1, 0.7 }, 
									{ .2, 1.0 }, 
									{ 1.0, 1.0 } }, input.speed01)*
							bb420util.sampleCurve({ 
									{ .0, .1 },
									{ .4, .6 },
									{ 1.0, 1.0 } }, input.power01),		
					pitch = bb420util.sampleCurve({ 
									{ .0, 0.6 },
									{ .1, 0.9 },
									{ .2, 1.0 },
									{ .35, 1.15 },
									{ .75, 1.75 },
									{ 1.0, 2.0 } }, input.speed01)
				},


				bb420util.squeal(input.speed, input.sideForce, input.maxSideForce),
				bb420util.brake(input.speed, input.brakeDecel, 1.0),
				bb420util.ebremse(input.speed, input.brakeDecel, 1.0),				
			},
			events = {
				horn = { gain = 0.85, pitch = 1.0 },
				openDoors = { gain = 2.0, pitch = 1.0 },
				closeDoors = { gain = 2.0, pitch = 1.0 }						
			}
		}
	end
}
end
