module universe_life_form_cell
import universe_cell
import universe_celestial_body
import universe_life_form
import universe_robot
import universe_human

class LifeFormCell[E]
	super UniverseCell[E]

	var life: LifeForm

	redef fun determineNextState
	do
		var enemiesCount = 0
		var alliesCount = 0

		for k in [0..neighbours.length - 1] do
			if neighbours[k] isa LifeFormCell[E] then
				if neighbours[k].as(LifeFormCell[E]).life.is_same_type(life) then
					alliesCount += neighbours[k].getCurrentState.as(Int)
				else
					enemiesCount += neighbours[k].getCurrentState.as(Int)
				end
			end
		end

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
	end

	redef fun createRule
	do
		rule = new UniverseRule(1)
	end
end