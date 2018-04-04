module cell

class Cell
	var currentState: Int
	var nextState: Int
	var x: Int
	var y: Int

	fun determineNextState(grid: Array[Array[Cell]])
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

	fun changeCurrentState
	do
		currentState = nextState
	end

	fun setCurrentState(newState: Int)
	do
		currentState = newState
	end
end
