module univers_rule
import rule

class UniversRule
	super Rule

	redef fun determineResultI(value: Int): Int
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
