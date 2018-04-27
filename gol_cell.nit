module gol_cell
import cell
import gol_rule

class GOLCell[E]
	super Cell[E]

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new GOLRule(1)
	end

	redef fun determineNextState
	do
		var aliveCellCount = 0

		for k in [0..neighbours.length - 1] do
			aliveCellCount += neighbours[k].getCurrentState.as(Int)
		end

		var result = rule.determineResultI(aliveCellCount)

		if result == -1 then
			setNextState(getCurrentState)
		else
			setNextState(result)
		end
	end
end