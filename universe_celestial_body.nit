module universe_celestial_body
import universe_cell

class CelestialBody[E]
	super UniverseCell[E]

	public var isColonized: Bool
	#var habitant: LifeForm
	protected var ressources: Int

	public fun getRessources: Int
	do
		return ressources
	end

	public fun setRessources(ressource: Int)
	do
		ressources = ressource
	end
end