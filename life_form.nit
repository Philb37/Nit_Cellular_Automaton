module life_form
import cell
import celestial_body

class LifeForm[E]
	super UniversCell[Int]
	var ressource: Int

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
		rule = new UniversRule(1)
	end
end
