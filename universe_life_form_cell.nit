module universe_life_form_cell
import universe_life_form
import universe_robot
import universe_human
import universe_black_hole

class LifeFormCell[E]
	super UniverseCell[E]

	public var life: LifeForm

	redef public fun determineNextState
	do
		var enemiesCount = 0
		var alliesCount = 0
		var blackhole = false

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa LifeFormCell[E] then
				if neighbours[k].as(LifeFormCell[E]).life.is_same_type(life) then
					alliesCount += neighbours[k].getCurrentState.as(Int)
				else
					enemiesCount += neighbours[k].getCurrentState.as(Int)
				end
			else if neighbours[k] isa BlackHole[E] then
				blackhole = true
				break
			end
		end

		if not blackhole then
			var result = rule.as(UniverseRule).determineLifeFormState(enemiesCount, alliesCount)

			if result == -1 then
				setNextState(1)
			else if result == 0 then
				setNextState(getCurrentState)
			else if result == 1 then
				setNextState(1)

				if life isa Human then
					life = new Robot
				else
					life = new Human
				end
			else if result == 2 then
				setNextState(0)
			end
		else
			setNextState(0)
		end
	end

	# Redef the rule for this class, we need neighbours within a radius of a one length square.
	redef protected fun createRule
	do
		rule = new UniverseRule(1)
	end

end
