module gol_cellular_automaton
import console
import gol_cell
import cellular_automaton
import gol_rule

class GOLCellularAutomaton
	super CellularAutomaton

	private var displayGridArray = new Array[Array[GOLCell[Int]]]

	init
	do
		generateGrid
		determineNeighbours
		cellBirth
		fillDisplayGrid
	end

	redef public fun start
	do
		for i in [0..generation] do
			printn "{(new TermClearDisplay)}"
			print "{(new TermCharFormat).default_fg}Génération n° {i}{(new TermCharFormat).default_fg}"
			nextGeneration
		end
	end

	# Transform our two dimensional array in a simple array as needed in cellular_automaton.
	redef protected fun generateGrid
	do
		var cellNumber = 1
		var dims = new Array[Int]

		for i in [0..dimensions.length - 1]
		do
			cellNumber *= dimensions[i]
			dims[i] = 0
		end

		grid = new Array[GOLCell[Int]]

		for i in [0..cellNumber - 1]
		do
			var tempArray = [dims[0],dims[1]]
			grid[i] = new GOLCell[Int](tempArray, 0, 0)

			if dims[1] == dimensions[0] - 1 then
				dims[0] += 1
				dims[1] = 0
			else
				dims[1] += 1
			end

		end
	end

	# Display the grid with our needs, here we check the current state & the next state of the cell to determine what we need to print.
	redef protected fun displayGrid
	do
		for i in [0..displayGridArray.length - 1] do

			var length = displayGridArray[i].length
			for j in [0..length - 1] do
				if displayGridArray[i][j].getCurrentState == 1 and displayGridArray[i][j].getNextState == displayGridArray[i][j].getCurrentState then
					printn "{(new TermCharFormat).blue_fg}○ {(new TermCharFormat).blue_fg}"
				else if displayGridArray[i][j].getCurrentState == 1 and displayGridArray[i][j].getNextState == 0 then
					printn "{(new TermCharFormat).yellow_fg}○ {(new TermCharFormat).yellow_fg}"
				else if	displayGridArray[i][j].getCurrentState == 0 and displayGridArray[i][j].getNextState == 1 then
					printn "{(new TermCharFormat).green_fg}x {(new TermCharFormat).green_fg}"
				else
					printn "{(new TermCharFormat).red_fg}x {(new TermCharFormat).red_fg}"
				end
			end

			print ""
		end
	end

	# Set the state of each cell in the grid.
	private fun cellBirth
	do
		for i in [0..grid.length - 1] do
			if 100.rand <= 33 then
				grid[i].setCurrentState(1)
			else
				grid[i].setCurrentState(0)
			end
		end
	end

	# Create a two dimensional array based on our simple grid array so we can display it in the terminal.
	private fun fillDisplayGrid
	do
		var height = dimensions[0]
		var width = dimensions[1]

		for i in [0..height - 1] do
			displayGridArray[i] = new Array[GOLCell[Int]]
			for j in [0..width - 1] do
				displayGridArray[i][j] = new GOLCell[Int](new Array[Int], 0, 0)
			end
		end

		for i in [0..grid.length - 1] do
			displayGridArray[grid[i].coordinates[0]][grid[i].coordinates[1]] = grid[i].as(GOLCell[Int])
		end
	end
end
