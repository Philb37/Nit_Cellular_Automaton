module univers_cellular_automaton
import console
import univers_cell
import cellular_automaton
import star
import planet
import univers_rule

class UniversCellularAutomaton
	super CellularAutomaton

	var displayGridArray = new Array[Array[UniversCell[Int]]]

	init
	do
		generateGrid
		generateSystem
		#determineNeighbours
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
			grid[i] = new UniversCell[Int](0,0, null, tempArray)
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
				if displayGridArray[i] == 0 then
					printn "{(new TermCharFormat).blue_fg}| {(new TermCharFormat).blue_fg}"
				end
				if displayGridArray[i][j].getCurrentState == 1 then
					printn "{(new TermCharFormat).blue_fg}🌎 {(new TermCharFormat).blue_fg}"
				else if	displayGridArray[i][j].getCurrentState == 2 then
					printn "{(new TermCharFormat).green_fg}🌞 {(new TermCharFormat).green_fg}"
				else
					printn "{(new TermCharFormat).red_fg}* {(new TermCharFormat).red_fg}"
				end

			end
			print ""
		end
	end

	fun generateSystem
	do
		for i in [0..grid.length - 1] do
			if grid[i].coordinates == [10,10] or grid[i].coordinates == [40,40] or grid[i].coordinates == [25,25] or grid[i].coordinates == [10,40] or grid[i].coordinates == [40,10] then
				grid[i] = new Star[Int](2,null, new UniversRule(3), grid[i].coordinates,false,0,true)
				createSolarSystem(grid[i].as(Star[Int]))
			end
		end
	end

	fun createSolarSystem(star: Star[Int])
	do
		var planetNumber = 0
		while planetNumber < 3 do
		for i in [0..grid.length - 1] do
			for j in [-3..3]
			do
				for k in [-3..3]
				do
					if grid[i].coordinates[0] == (star.coordinates[0] + j) and grid[i].coordinates[1] == (star.coordinates[1] + k) and grid[i].coordinates != star.coordinates then
						if 100.rand <= 8 then
							grid[i] = new Planet[Int](1,null, new UniversRule(2), grid[i].coordinates,false,0)
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
				displayGridArray[i][j] = new UniversCell[Int](0, 0, null, new Array[Int])
			end
		end

		for i in [0..grid.length - 1] do
			displayGridArray[grid[i].coordinates[0]][grid[i].coordinates[1]] = grid[i].as(UniversCell[Int])
		end
	end
end
