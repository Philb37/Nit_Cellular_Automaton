module star
import celestial_body
import planet

class Star[E]
	super CelestialBody[E]
	var isAlive: Bool

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new UniversRule(3)
	end

	redef fun determineNextState
	do
		var planetCount = 0
		var alivePlanetCount = 0

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa Planet[E] then
				alivePlanetCount += neighbours[k].getCurrentState.as(Int)
				planetCount += 1
			end
		end

		setNextState(rule.as(UniversRule).determineStarState(planetCount, alivePlanetCount))
	end

	fun superNova
	do
		#TODO
	end
end
