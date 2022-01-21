package random;

class Number {
	public function new() {
		// your code
	}

	/**
	 *
	 */
	public static function uuid() {
		return utils.UUID.uuid();
	}

	/**
	 * [Description]
	 * @param min = 500
	 * @param max = 2500
	 */
	public static function price(min = 500, max = 2500) {
		var temp:Int = utils.Util.randomInteger(min, max);
		return '${(temp / 100)}';
	}
}
