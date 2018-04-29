module universe_planet
import universe_celestial_body
import universe_life_form_cell

class Planet[E]
	super CelestialBody[E]

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new UniverseRule(1)
	end

	fun loseRessources
	do
		setRessources(getRessources - 7)

		if getRessources < 0 then
			setRessources(0)
		end
	end

	redef fun determineNextState
	do
		var aliveCellCount = 0

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa LifeFormCell[E] then
				aliveCellCount += neighbours[k].getCurrentState.as(Int)
			end
		end

		setRessources(getRessources + rule.as(UniverseRule).determinePlanetState(aliveCellCount))

		if getRessources == 0 then
			setNextState(0)
		else
			setNextState(1)
			loseRessources
		end
	end
end
