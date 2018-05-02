module rule

# This class is the rule of the cells.
# You can have different rules for different type of cells or the same rules.
# There is for function that can help you to determine the behavior of a cell or you can create your own by extending this class.
abstract class Rule

	# Distance between the cell and her neighbours.
	public var neighboursRadius: Int

	# Method to do whatever you want in the rule.
	# Parameters :
	# value is your value for your rule.
	# Return an Int.
	public fun determineResultI(value: Int): Int do return 0

	# Method to do whatever you want in the rule.
	# Parameters :
	# value is your value for your rule.
	# Return a String.
	public fun determineResultS(value: String): String do return ""

	# Method to do whatever you want in the rule.
	# Parameters :
	# value is your value for your rule.
	# Return a Float.
	public fun determineResultF(value: Float): Float do return 0.0

	# Method to do whatever you want in the rule.
	# Parameters :
	# value is your value for your rule.
	# Return a Bool.
	public fun determineResultB(value: Bool): Bool do return false

end
