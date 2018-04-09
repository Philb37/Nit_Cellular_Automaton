module gof_cell
import cell
import gof_rule

class GOFCell[E]
	super Cell[E]

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new GOFRule
	end

	redef fun determineNextState
	do
		var aliveCellCount = 0
		for k in [0..neightboors.length - 1] do
			aliveCellCount += neightboors[k].currentState.as(Int)
		end

		aliveCellCount -= getCurrentState.as(Int)
		var result = rule.determineResult(aliveCellCount)
		if result == -1 then
			setNextState(getCurrentState)
		else
			setNextState(result)
		end
	end
end
