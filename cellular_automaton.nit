module cellular_automaton
import cell

# This class contains the grid and other informations about it like the dimension, the generation number etc ...
# This is where the behavior of the automaton is.
# You can't instantiate this class since it is abstract so don't forget to inherit from it.
abstract class CellularAutomaton
	
	# One dimensional array containing the n dimensional space.
	# Every functions to manipulate this array, like finding an n dimensions item in it is created below.
	protected var grid: Array[Cell[Int]] is noinit

	# Array containing each dimension length.
	protected var dimensions: Array[Int]

	# Number of dimension.
	protected var dimension: Int

	# Number of generation.
	protected var generation: Int

	# Time between each display (in seconds).
	protected var sleepTime: Int

	# Method to determine the next state of all cells, display the new grid and then update the state of all cells.
	protected fun nextGeneration
	do
		for i in [0..grid.length - 1] do
			grid[i].determineNextState
		end

		displayGrid
		sleepTime.sleep

		for i in [0..grid.length - 1] do
			grid[i].updateState
		end
	end

	# Method to determine every neighbours of one cell, the number of neighbours will depends of the value of the cell's rule neighboursRadius variable.
	# This way of finding every neighbours might not be optimized, O(n²m²).
	protected fun determineNeighbours
	do
		for i in [0..grid.length - 1] do
			for j in [0..grid.length - 1] do
				var points = new Array[Array[Int]]
				points[0] = new Array[Int]
				points[1] = new Array[Int]

				var length = grid[i].coordinates.length
				for k in [0..length - 1] do
					points[0][k] = grid[i].coordinates[k]
					points[1][k] = grid[j].coordinates[k]
				end

				var distance = tchebychevDistance(points)

				if distance <= grid[i].rule.neighboursRadius and distance != 0 then
					grid[i].neighbours[grid[i].neighbours.length] = grid[j]
				end
			end
		end
	end

	# Method to find any cell in the 1D array if you have the n-D coordinates.
	# Parameters :
	# coordinates is the array of n-D coordinates.
	protected fun findIndex(coordinates: Array[Int]): Int
	do
		var result = 0
		var x = 1

		for i in [coordinates.length - 1..0].step(-1) do
			result += coordinates[i] * x
			x *= dimensions[i]
		end

		return result
	end

	# Method to calculate the distance between two points of a n-D space.
	# Parameters :
	# points is the array containing the coordinates (second array) of both points.
	protected fun tchebychevDistance(points: Array[Array[Int]]): Int
	do
		var max = 0

		var length = points[0].length
		for i in [0..length - 1] do
			var temp = (points[0][i] - points[1][i]).abs

			if temp > max then
				max = temp
			end
		end

		return max
	end

	# Method to generate every cell on the grid.
	protected fun generateGrid do end

	# Method to display the 1D grid into a n-D grid.
	protected fun displayGrid do end

	# Method to start the automaton.
	public fun start do end

end
