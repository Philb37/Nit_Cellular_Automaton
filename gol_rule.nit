module gol_rule
import rule

class GOLRule
	super Rule

	redef public fun determineResultI(value: Int): Int
	do
		if value == 3 then
			return 1
		else if value == 2 then
			return -1
		else
			return 0
		end
	end
end
