module universe_cellular_automaton
import console
import universe_cell
import cellular_automaton
import universe_star
import universe_planet
import universe_rule
import universe_human
import universe_robot
import universe_black_hole

class UniverseCellularAutomaton
	super CellularAutomaton

	private var arrayCoordinates = new Array[Array[Int]]
	private var displayGridArray = new Array[Array[UniverseCell[Int]]]
	private var starNumber: Int

	init
	do
		generateGrid
		generateStarCoordinates
		generateSystem
		generateBlackHole
		cellBirth
		determineNeighbours
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

	# Display the grid with our needs, here we check the cell's type, and display different symbols or colors.
	redef protected fun displayGrid
	do
		for i in [0..displayGridArray.length - 1] do
			var length = displayGridArray[i].length
			for j in [0..length - 1] do
				if displayGridArray[i][j] isa Planet[Int] then
					if displayGridArray[i][j].as(Planet[Int]).habitant isa Human and displayGridArray[i][j].getCurrentState == 1 then
						printn "{(new TermCharFormat).blue_fg}● {(new TermCharFormat).blue_fg}"
					else if displayGridArray[i][j].as(Planet[Int]).habitant isa Robot and displayGridArray[i][j].getCurrentState == 1 then
						printn "{(new TermCharFormat).magenta_fg}● {(new TermCharFormat).magenta_fg}"
					else
						printn "{(new TermCharFormat).white_fg}● {(new TermCharFormat).red_fg}"
					end
				else if	displayGridArray[i][j] isa Star[Int] then
					if displayGridArray[i][j].as(Star[Int]).habitant isa Human and displayGridArray[i][j].getCurrentState == 1 then
						printn "{(new TermCharFormat).blue_fg}◉ {(new TermCharFormat).white_fg}"
					else if displayGridArray[i][j].as(Star[Int]).habitant isa Robot and displayGridArray[i][j].getCurrentState == 1 then
						printn "{(new TermCharFormat).green_fg}◉ {(new TermCharFormat).green_fg}"
					else
						printn "{(new TermCharFormat).yellow_fg}◉ {(new TermCharFormat).yellow_fg}"
					end
				else if displayGridArray[i][j] isa LifeFormCell[Int] then
					if displayGridArray[i][j].as(LifeFormCell[Int]).life isa Human then
						if displayGridArray[i][j].getCurrentState == 1 then
							printn "{(new TermCharFormat).cyan_fg}○ {(new TermCharFormat).cyan_fg}"
						else
							printn "{(new TermCharFormat).red_fg}x {(new TermCharFormat).red_fg}"
						end
					else if displayGridArray[i][j].as(LifeFormCell[Int]).life isa Robot then
						if displayGridArray[i][j].getCurrentState == 1 then
							printn "{(new TermCharFormat).green_fg}○ {(new TermCharFormat).green_fg}"
						else
							printn "{(new TermCharFormat).red_fg}x {(new TermCharFormat).red_fg}"
						end
					end
				else if displayGridArray[i][j] isa BlackHole[Int] then
					printn "{(new TermCharFormat).black_fg}◉ {(new TermCharFormat).black_fg}"
				end
			end
			print ""
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

		grid = new Array[UniverseCell[Int]]

		for i in [0..cellNumber - 1]
		do
			var tempArray = [dims[0],dims[1]]

			if 100.rand > 50 then
				grid[i] = new LifeFormCell[Int](tempArray, 0, 0, new Human)
			else
				grid[i] = new LifeFormCell[Int](tempArray, 0, 0, new Robot)
			end

			if dims[1] == dimensions[0] - 1 then
				dims[0] += 1
				dims[1] = 0
			else
				dims[1] += 1
			end

		end
	end

	# Set the state of each cell in the grid.
	private fun cellBirth
	do
		for i in [0..grid.length - 1] do
			if grid[i] isa LifeFormCell[Int] then
				if 100.rand <= 33 then
					grid[i].setCurrentState(1)
				else
					grid[i].setCurrentState(0)
				end
			end
		end
	end

	# Initialize a certain number of planets (minimum 3) around the star of each Solar System.
	private fun createSolarSystem(star: Star[Int])
	do
		var planetNumber = 0

		while planetNumber < 3 do
			for i in [0..grid.length - 1] do
				for j in [-3..3] do
					for k in [-3..3] do
						if grid[i].coordinates[0] == (star.coordinates[0] + j) and grid[i].coordinates[1] == (star.coordinates[1] + k) and grid[i].coordinates != star.coordinates then
							if 100.rand <= 8 then
								grid[i] = new Planet[Int](grid[i].coordinates, 0, 0, false, 0)
								planetNumber += 1
							end
						end
					end
				end
			end
		end
	end

	# Create a two dimensional array based on our simple array grid so we can display it in the terminal.
	private fun fillDisplayGrid
	do
		var height = dimensions[0]
		var width = dimensions[1]

		for i in [0..height - 1] do
			displayGridArray[i] = new Array[UniverseCell[Int]]
			for j in [0..width - 1] do
				displayGridArray[i][j] = new UniverseCell[Int](new Array[Int] , 0, 0)
			end
		end

		for i in [0..grid.length - 1] do
			displayGridArray[grid[i].coordinates[0]][grid[i].coordinates[1]] = grid[i].as(UniverseCell[Int])
		end
	end

	# Generate a black hole randomly in the grid.
	private fun generateBlackHole
	do
		var rx = dimensions[0] - 1
		var ry = dimensions[1] - 1
		var index: Int

		loop
			index = (rx * ry).rand

			if grid[index] isa LifeFormCell[Int] then
				grid[index] = new BlackHole[Int]([grid[index].coordinates[0], grid[index].coordinates[1]], 1, 1, false, 0)
				break
			end
		end
	end

	# Generate the coordinates of our stars, check if they aren't too close from each other if it's the case, regenerate the coordinates.
	private fun generateStarCoordinates
	do
		var starCount = 0
		while starCount != starNumber do
			var check = false
			var rx = dimensions[0] - 1
			var x = rx.rand
			var ry = dimensions[1] - 1
			var y = ry.rand

			if arrayCoordinates.length > 0 then
				for k in [0..arrayCoordinates.length -1]
				do
					if (arrayCoordinates[k][0] - x).abs < 10 and (arrayCoordinates[k][1] - y).abs < 10 then
						check = true
					end
				end
				if not check then
					arrayCoordinates.add([x,y])
					starCount += 1
				end
			else
				arrayCoordinates.add([x,y])
				starCount += 1
			end
		end
	end

	# Create as much stars as needed from starNumber variable to random coordinates.
	private fun generateSystem
	do
		var index: Int
		for k in [0..arrayCoordinates.length - 1] do
			index = findIndex(arrayCoordinates[k])
			grid[index] = new Star[Int](grid[index].coordinates, 0, 0, false,0,true)
			createSolarSystem(grid[index].as(Star[Int]))
		end
	end

end
