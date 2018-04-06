module gof_cell
import cell

class GOFCell

	fun determineNextState
	do
		var aliveCellCount = 0

		for i in [-1..1] do
			for j in [-1..1] do
				aliveCellCount += grid[x + i][y + j].currentState
			end
		end

		aliveCellCount -= grid[x][y].currentState

		if aliveCellCount == 3 then
			nextState = 1
		else if aliveCellCount == 2 then
			nextState = currentState
		else
			nextState = 0
		end
	end
end
