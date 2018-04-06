module cellular_automaton
import cell

class CellularAutomaton[E : Cell]

	var grid: Array[E] is noinit
	var dimensions: Array[Int]
	var dimension: Int
	var generation: Int
	var sleepTime: Int

	init
	do
		generateGrid
	end

	fun start
	do

	end

	fun nextGeneration
	do
		# TODO

		displayGrid
		sleepTime.sleep

		# TODO
	end

	fun 

	fun generateGrid
	do
		var cellNumber = 1
		var dims = new Array[Int]

		for i in [0..dimensions.length]
		do
			cellNumber *= dimensions[i]
			dims[i] = 0
		end

		var dim = 0

		for i in [0..cellNumber]
		do
			grid[i] = new E[Object](null, null, dims)
			
			if dims[dim] == dimensions[dim] then
				dim += 1
			else
				dims[dim] += 1
			end
		end
	end

	fun determineNeightboors
	do
		for i in [0..grid.length - 1]
		do
			
		end
	end

	fun displayGrid
	do

	end
end