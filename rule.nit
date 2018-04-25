module rule

abstract class Rule
	public var neighboursRadius: Int

	public fun determineResultI(value: Int): Int do return 0

	public fun determineResultS(value: String): String do return ""

	public fun determineResultF(value: Float): Float do return 0.0

	public fun determineResultB(value: Bool): Bool do return false
end
