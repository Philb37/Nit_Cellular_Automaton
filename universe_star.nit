module universe_star
import universe_celestial_body
import universe_planet

class Star[E]
	super CelestialBody[E]
	public var isAlive: Bool

	init
	do
		createRule
	end

	redef public fun determineNextState
	do
		var planetCount = 0
		var alivePlanetCount = 0
		var humanPlanets = 0
		var robotPlanets = 0

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa Planet[E] then
				if neighbours[k].as(Planet[E]).habitant isa Human then
					humanPlanets += neighbours[k].getCurrentState.as(Int)
				else
					robotPlanets += neighbours[k].getCurrentState.as(Int)
				end

				planetCount += 1
			end
		end

		var result = rule.as(UniverseRule).determineStarState(planetCount, humanPlanets, robotPlanets)

		if result == 2 then
			setNextState(1)

			habitant = new Robot
		else if result == 1 then
			setNextState(1)

			habitant = new Human
		else
			setNextState(result)
		end
	end

	redef protected fun createRule
	do
		rule = new UniverseRule(3)
	end

end
