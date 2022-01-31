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
	public function price():String {
		var temp:Int = utils.MathUtil.randomInteger(500, 2500);
		var str = '${temp}';
		return str.substr(0, str.length - 2) + ',' + str.substr(str.length - 2, str.length);
	}
}
