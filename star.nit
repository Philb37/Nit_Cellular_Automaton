module star
import celestial_body

class Star[E]
	super CelestialBody[E]
	var isAlive: Bool

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new UniversRule(3)
	end

	fun superNova
	do
		#TODO
	end
end
