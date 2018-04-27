module celestial_body
import cell
import univers_cell

class CelestialBody[E]
	super UniversCell[E]

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