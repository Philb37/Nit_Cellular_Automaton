import cellular_automaton
import gol_cellular_automaton
import universe_cellular_automaton

fun checkInput(input: String): nullable Bool do
	if input == "y" or input == "yes" or input == "Y" or input == "YES" or input == "Yes" then
		return true
	else if input == "n" or input == "no" or input == "N" or input == "NO" or input == "No"	 then
		return false
	else 
		return null
	end
end

var ca: nullable CellularAutomaton = null
var gameType: Int = 1
var dimension: Int = 2
var dimensions: Array[Int] = [50,50]
var generationNumber: Int = 100
var displayInterval: Int = 1
var input: String
var check: nullable Bool

if args.length != 0 then
	if args.length >= 1 then
		gameType = args[0].to_i
	end

	for i in [0..dimension - 1] do
		if args.length >= i+2 then
			dimensions[i] = args[i+1].to_i
		end
	end

	if args.length >= dimension+2 then
		generationNumber = args[dimension+1].to_i
	end

	if args.length >= dimension+3 then
		displayInterval = args[dimension+2].to_i
	end
end

loop
	if gameType == 1 then
		print "The game you choose is, The Game Of Life. Do you want to keep this choice ? Yes or No : "
	else if gameType == 2 then
		print "The game you choose is, The Universe Game. Do you want to keep this choice ? Yes or No : "
	end

	input = gets

	check = checkInput(input)

	if check == false then
		print "Enter a new value, 1 for GOL or 2 for Universe : "
		gameType = gets.to_i
		break
	else if check == null then
		print "Unknow anwser. Please start again."
	else
		break
	end
end

for i in [0..dimension - 1] do
	loop
		if i <= 1 then
			print "The dimension {i+1} has a length of {dimensions[i]}. Do you want to keep this value ? Yes or No : "
		else
			print "The length of the dimension {i+1} has not been set. Do you want to set it ? Yes or No : "
		end
		input = gets

		check = checkInput(input)

		if check == false then
			print "Enter a new value : "
			dimensions[i] = gets.to_i
			
			if i == dimension - 1 then
				break
			end

			i += 1
		else if check == null then
			print "Unknown answer. Please start again."
		else
			if i == dimension - 1 then
				break
			end

			i += 1
		end
	end
end

loop
	print "The number of generations is {generationNumber}. Do you want to keep this value ? Yes or No : "
	input = gets

	check = checkInput(input)

	if check == false then
		print "Enter a new value : "
		generationNumber = gets.to_i
		break
	else if check == null then
		print "Unknow answer. Please start again."
	else
		break
	end
end

loop
	print "The sleep time between two displays is {displayInterval}. Do you want to keep this value ? Yes or No : "
	input = gets

	check = checkInput(input)

	if check == false then
		print "Enter a new value : "
		displayInterval = gets.to_i
		break
	else if check == null then
		print "Unknow answer. Please start again."
	else
		break
	end
end

print "Starting the game, please wait ..."

if gameType == 1 then
	ca = new GOLCellularAutomaton(dimension, dimensions, displayInterval, generationNumber)
else if gameType == 2 then
	ca = new UniverseCellularAutomaton(dimension, dimensions, displayInterval, generationNumber)
else
	print "Game type incorrect, please restart the program."
	exit(0)
end

ca.start