module universe_rule
import rule

class UniverseRule
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

	fun determineStarState(planetCount: Int, humanPlanets: Int, robotPlanets: Int): Int
	do
		if humanPlanets > robotPlanets then
			if (humanPlanets * 100 / planetCount) > 33 then
				return 1
			else
				return 0
			end
		else if humanPlanets < robotPlanets then
			if (robotPlanets * 100 / planetCount) > 33 then
				return 2
			else
				return 0
			end
		else
			return 0
		end
	end

	fun determinePlanetState(allies: Int, enemies: Int): Int
	do
		return allies * 10 + enemies * -10 
	end

	fun determineLifeFormState(enemies: Int, allies: Int): Int
	do
		if enemies > allies then
			if enemies == 3 then
				return 1
			else
				return 2
			end
		else if enemies < allies then
			if allies == 3 then
				return -1
			else if allies == 2 then
				return 0
			else
				return 2
			end
		else
			if allies == 3 or allies == 2 then
				return 0
			else
				return 2
			end
		end
	end
end
