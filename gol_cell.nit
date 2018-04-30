module gol_cell
import cell
import gol_rule

class GOLCell[E]
	super Cell[E]

	init
	do
		createRule
	end

	#Count the number of alive cell in the neighbours array of each cell.
	#Based on the rule of the GoF determine the next state of the cell.
	redef public fun determineNextState
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

	#Redef the rule for this class, we need neighbors within a radius of 1 square.
	redef protected fun createRule
	do
		rule = new GOLRule(1)
	end
end
