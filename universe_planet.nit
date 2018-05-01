module universe_planet
import universe_celestial_body
import universe_life_form_cell

class Planet[E]
	super CelestialBody[E]

	init
	do
		createRule
	end

	# Determine the next state of the planet (colonized or not) based on civilizations in the neighborhood
	redef public fun determineNextState
	do
		var enemiesCount = 0
		var alliesCount = 0

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa LifeFormCell[E] then
				if neighbours[k].as(LifeFormCell[E]).life.is_same_type(habitant) then
					alliesCount += neighbours[k].getCurrentState.as(Int)
				else
					enemiesCount += neighbours[k].getCurrentState.as(Int)
				end
			end
		end

		setRessources(getRessources + rule.as(UniverseRule).determinePlanetState(alliesCount, enemiesCount))

		if getRessources < 0 then
			setNextState(1)
			setRessources(getRessources * -1)

			if habitant isa Human then
				habitant = new Robot
			else
				habitant = new Human
			end
		else if getRessources == 0 then
			setNextState(0)
		else
			setNextState(1)
			loseRessources
		end
	end

	# Redef the rule for this class, we need neighbours within a radius of a one length square.
	redef protected fun createRule
	do
		rule = new UniverseRule(1)
	end

	# Ressources are lost each generation.
	private fun loseRessources
	do
		setRessources(getRessources - 6)

		if getRessources < 0 then
			setRessources(0)
		end
	end

end
