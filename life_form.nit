module life_form
import cell
import celestial_body

class LifeForm super Cell
	var ressource: Int

	fun takeRessources(celestialBody: CelestialBody)
	do
		#TODO
	end

	fun colonize(celestialBody: CelestialBody)
	do
		#TODO
	end

	fun fight(lifeform: LifeForm): Bool
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
end
