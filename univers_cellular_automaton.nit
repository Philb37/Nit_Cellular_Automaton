module univers_cellular_automaton
import console
import univers_cell
import cellular_automaton
import star
import planet
import univers_rule
import life_form

class UniversCellularAutomaton
	super CellularAutomaton

	var displayGridArray = new Array[Array[UniversCell[Int]]]
	var arrayCoordinates = new Array[Array[Int]]
	var starNumber: Int

	init
	do
		generateGrid
		generateStarCoordinates
		generateSystem
		cellBirth
		determineNeighbours
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

		grid = new Array[UniversCell[Int]]

		for i in [0..cellNumber - 1]
		do
			var tempArray = [dims[0],dims[1]]
			grid[i] = new LifeForm[Int](0,0, tempArray,0)
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
				if displayGridArray[i][j] isa Planet[Int] then
					if displayGridArray[i][j].getCurrentState == 1 then
						printn "{(new TermCharFormat).green_fg}🌎 {(new TermCharFormat).green_fg}"
					else
						printn "{(new TermCharFormat).yellow_fg}🌎 {(new TermCharFormat).yellow_fg}"
					end
				else if	displayGridArray[i][j] isa Star[Int] then
					if displayGridArray[i][j].getCurrentState == 1 then
						printn "{(new TermCharFormat).white_fg}🌞 {(new TermCharFormat).white_fg}"
					else
						printn "{(new TermCharFormat).yellow_fg}🌞 {(new TermCharFormat).yellow_fg}"
					end
				else if displayGridArray[i][j] isa LifeForm[Int] then
					if displayGridArray[i][j].getCurrentState == 1 and displayGridArray[i][j].getNextState == displayGridArray[i][j].getCurrentState then
						printn "{(new TermCharFormat).blue_fg}○ {(new TermCharFormat).blue_fg}"
					else if displayGridArray[i][j].getCurrentState == 1 and displayGridArray[i][j].getNextState == 0 then
						printn "{(new TermCharFormat).yellow_fg}○ {(new TermCharFormat).yellow_fg}"
					else if displayGridArray[i][j].getCurrentState == 0 and displayGridArray[i][j].getNextState == 1 then
						printn "{(new TermCharFormat).green_fg}x {(new TermCharFormat).green_fg}"
					else
						printn "{(new TermCharFormat).red_fg}x {(new TermCharFormat).red_fg}"
					end
				end
			end
			print ""
		end
	end

	fun generateSystem
	do
		var index: Int
		for k in [0..arrayCoordinates.length - 1] do
			index = findIndex(arrayCoordinates[k])
			grid[index] = new Star[Int](0,0,grid[index].coordinates,false,0,true)
			createSolarSystem(grid[index].as(Star[Int]))
		end
	end

	fun cellBirth
	do
		for i in [0..grid.length - 1] do
			if grid[i] isa LifeForm[Int] then
				if 100.rand <= 33 then
					grid[i].setCurrentState(1)
				else
					grid[i].setCurrentState(0)
				end
			end
		end
	end

	fun generateStarCoordinates
	do
		var starCount = 0
		while starCount != starNumber do
			var check = false
			var x = 49.rand
			var y = 49.rand

			if arrayCoordinates.length > 0 then
				for k in [0..arrayCoordinates.length -1]
				do
					if (arrayCoordinates[k][0] - x).abs < 15 and (arrayCoordinates[k][1] - y).abs < 11 then
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

	fun createSolarSystem(star: Star[Int])
	do
		var planetNumber = 0
		while planetNumber < 3 do
		for i in [0..grid.length - 1] do
			for j in [-3..3] do
				for k in [-3..3] do
					if grid[i].coordinates[0] == (star.coordinates[0] + j) and grid[i].coordinates[1] == (star.coordinates[1] + k) and grid[i].coordinates != star.coordinates then
						if 100.rand <= 8 then
							grid[i] = new Planet[Int](0, 0, grid[i].coordinates,false,0)
							planetNumber += 1
						end
						end
					end
				end
			end
		end
	end

	fun fillDisplayGrid
	do
		var height = dimensions[0]
		var width = dimensions[1]

		for i in [0..height - 1] do
			displayGridArray[i] = new Array[UniversCell[Int]]
			for j in [0..width - 1] do
				displayGridArray[i][j] = new UniversCell[Int](0, 0, new Array[Int])
			end
		end

		for i in [0..grid.length - 1] do
			displayGridArray[grid[i].coordinates[0]][grid[i].coordinates[1]] = grid[i].as(UniversCell[Int])
		end
	end
end
