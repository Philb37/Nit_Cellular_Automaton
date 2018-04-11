module gof_cellular_automaton
import console
import gof_cell
import cellular_automaton

class GOFCellularAutomaton
	super CellularAutomaton

	var displayGridArray = new Array[Array[GOFCell[Int]]]

	init
	do
		generateGrid
		determineNeightboors(1)
		cellBirth
		fillDisplayGrid
	end

	redef fun generateGrid
	do
		var cellNumber = 1
		var dims = new Array[Int]

		for i in [0..dimensions.length - 1]
		do
			cellNumber *= dimensions[i]
			dims[i] = 0
		end

		grid = new Array[GOFCell[Int]]

		for i in [0..cellNumber - 1]
		do
			var tempArray = [dims[0],dims[1]]
			grid[i] = new GOFCell[Int](0, 0, null, tempArray)
			
			if dims[1] == dimensions[0] - 1 then
				dims[0] += 1
				dims[1] = 0
			else
				dims[1] += 1
			end

		end
	end

	redef fun start
	do
		for i in [0..generation] do
			printn "{(new TermClearDisplay)}"
			print "{(new TermCharFormat).default_fg}Génération n° {i}{(new TermCharFormat).default_fg}"
			nextGeneration
		end
	end

	redef fun displayGrid
	do
		for i in [0..displayGridArray.length - 1] do

			var length = displayGridArray[i].length
			for j in [0..length - 1] do
				if displayGridArray[i][j].currentState == 1 and displayGridArray[i][j].nextState == displayGridArray[i][j].currentState then
					printn "{(new TermCharFormat).blue_fg}○ {(new TermCharFormat).blue_fg}"
				else if displayGridArray[i][j].currentState == 1 and displayGridArray[i][j].nextState == 0 then
					printn "{(new TermCharFormat).yellow_fg}○ {(new TermCharFormat).yellow_fg}"
				else if	displayGridArray[i][j].currentState == 0 and displayGridArray[i][j].nextState == 1 then
					printn "{(new TermCharFormat).green_fg}x {(new TermCharFormat).green_fg}"
				else
					printn "{(new TermCharFormat).red_fg}x {(new TermCharFormat).red_fg}"
				end

			end

			print ""
		end
	end

	fun cellBirth
	do
		for i in [0..grid.length - 1] do
			if 100.rand <= 33 then
				grid[i].setCurrentState(1)
			else
				grid[i].setCurrentState(0)
			end
		end
	end

	fun fillDisplayGrid
	do
		var height = dimensions[0]
		var width = dimensions[1]

		for i in [0..height - 1] do
			displayGridArray[i] = new Array[GOFCell[Int]]
			for j in [0..width - 1] do
				displayGridArray[i][j] = new GOFCell[Int](0, 0, null, new Array[Int])
			end
		end

		for i in [0..grid.length - 1] do
			displayGridArray[grid[i].coordinates[0]][grid[i].coordinates[1]] = grid[i].as(GOFCell[Int])
		end
	end
end
