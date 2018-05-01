module universe_celestial_body
import universe_cell
import universe_life_form
import universe_human
import universe_robot

class CelestialBody[E]
	super UniverseCell[E]

	public var isColonized: Bool
	public var habitant: LifeForm = new Human
	protected var ressources: Int

	# Getter
	public fun getRessources: Int
	do
		return ressources
	end

	# Setter
	public fun setRessources(ressource: Int)
	do
		ressources = ressource
	end
end
