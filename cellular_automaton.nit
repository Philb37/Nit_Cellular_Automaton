module cellular_automaton
import console
import cell

class CellularAutomaton
	var height: Int
	var width: Int
	var generationNumber: Int
	var grid: Array[Array[Cell]]

	fun start
	do
		generateGrid
		for i in [0..generationNumber] do
			printn "{(new TermClearDisplay)}"
			print "{(new TermCharFormat).default_fg}Génération n° {i}{(new TermCharFormat).default_fg}"
			nextGeneration
		end
	end

	fun nextGeneration
	do
		for i in [1..grid.length - 2] do
			var length = grid[i].length
			for j in [1..length - 2] do
				grid[i][j].determineNextState(grid)
			end
		end

		displayGrid
		1.sleep

		for i in [1..grid.length - 1] do
			var length = grid[i].length
			for j in [1..length - 1] do
				grid[i][j].changeCurrentState
			end
		end
	end

	fun generateGrid
	do
		for i in [0..height - 1] do
			grid[i] = new Array[Cell]
			for j in [0..width - 1] do
				grid[i][j] = new Cell(0, 0, i, j)
				var random = 100.rand
				if random <= 33 and i != 0 and j != 0 and i != height - 1 and j != width - 1 then
					grid[i][j].setCurrentState(1)
				else
					grid[i][j].setCurrentState(0)
				end
			end
		end
	end

	fun displayGrid
	do
		for i in [0..grid.length - 1] do
			var l = grid[i].length
			for j in [0..l - 1] do
				if grid[i][j].currentState == 1 and grid[i][j].nextState == grid[i][j].currentState then
					printn "{(new TermCharFormat).blue_fg}○ {(new TermCharFormat).blue_fg}"
				else if grid[i][j].currentState == 1 and grid[i][j].nextState == 0 then
					printn "{(new TermCharFormat).yellow_fg}○ {(new TermCharFormat).yellow_fg}"
				else if	grid[i][j].currentState == 0 and grid[i][j].nextState == 1 then
					printn "{(new TermCharFormat).green_fg}x {(new TermCharFormat).green_fg}"
				else
					printn "{(new TermCharFormat).red_fg}x {(new TermCharFormat).red_fg}"
				end
			end
			print ""
		end
	end
end
