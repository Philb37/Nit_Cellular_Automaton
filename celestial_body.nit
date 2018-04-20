module celestial_body
import cell
import univers_cell

class CelestialBody[E]
	super UniversCell[E]

	var isColonized: Bool
	#var habitant: LifeForm
	var ressources: Int
end
