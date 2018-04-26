module univers_rule
import rule

class UniversRule
	super Rule

	redef fun determineResultI(value: Int): Int
	do
		if value == 3 then
			return 1
		else if value == 2 then
			return -1
		else
			return 0
		end
	end

	fun determineStarState(planetCount: Int, alivePlanetCount: Int): Int
	do
		if (alivePlanetCount * 100 / planetCount) > 66 then
			return 1
		else
			return 0
		end
	end

	fun determinePlanetState(lifeformNumber: Int): Int
	do
		return lifeformNumber * 10
	end
end
