module univers_cell
import cell
import univers_rule

class UniversCell[E]
	super Cell[E]

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new UniversRule(1)
	end
end