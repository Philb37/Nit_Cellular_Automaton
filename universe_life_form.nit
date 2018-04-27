module universe_life_form
import universe_cell
import universe_celestial_body

class LifeForm[E]
	super UniverseCell[Int]
	var ressource: Int

	redef fun determineNextState
	do
		var aliveCellCount = 0

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa LifeForm[E] then
				aliveCellCount += neighbours[k].getCurrentState
			end
		end

		var result = rule.determineResultI(aliveCellCount)

		if result == -1 then
			setNextState(getCurrentState)
		else
			setNextState(result)
		end
	end

	fun takeRessources(celestialBody: CelestialBody[Int])
	do
		#TODO
	end

	fun colonize(celestialBody: CelestialBody[Int])
	do
		#TODO
	end

	fun fight(lifeform: LifeForm[E]): Bool
	do
		#TODO
		return false
	end

	fun loseRessources
	do
		#TODO
	end

	fun verifyRessources
	do
		#TODO
	end

	redef fun createRule
	do
		rule = new UniverseRule(1)
	end
end
