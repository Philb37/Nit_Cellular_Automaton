module planet
import celestial_body

class Planet[E]
	super CelestialBody[E]

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new UniversRule(2)
	end

	fun generateRessources
	do
		#TODO
	end
end
