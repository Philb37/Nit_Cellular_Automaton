module gol_rule
import rule

class GOLRule
	super Rule

	# Determine the result for each cell. Value is the number of alive cells in the neighborhood of the cell.
	# If there is 3 alive cells in the neighborhood, then the cell is alive.
	# If there is 2 alive cells in the neighborhood, then the cell stay in its current state.
	# In any other cases, the cell dies.
	redef public fun determineResultI(value: Int): Int
	do
		if value == 3 then
			return 1
		else if value == 2 then
			return -1
		else
			return 0
		end
	end
end
