module planet
import celestial_body
import life_form

class Planet[E]
	super CelestialBody[E]

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new UniversRule(1)
	end

	fun generateRessources(lifeforms: Int)
	do
		ressources += lifeforms * 10 
	end

	fun loseRessources
	do
		ressources -= 9

		if ressources < 0 then
			ressources = 0
		end
	end

	redef fun determineNextState
	do
		var aliveCellCount = 0

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa LifeForm[E] then
				aliveCellCount += neighbours[k].getCurrentState.as(Int)
			end
		end

		generateRessources(aliveCellCount)

		if ressources == 0 then
			setNextState(0)
		else
			setNextState(1)
			loseRessources
		end
	end
end
