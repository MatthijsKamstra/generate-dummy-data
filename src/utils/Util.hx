package utils;

class Util {
	/**
		* 		return capitalizeFirstLetter(text.substr(randomInteger(Math.round(l * 0.5), l)).trim());
		}

		function getDescription() {
			var l = text.length;
			return capitalizeFirstLetter(text.substr(randomInteger(Math.round(l * 0.5), l)).trim());
	 */
	/**
	 * [Description]
	 * @param string
	 * @return String
	 */
	public static function capitalizeFirstLetter(string:String):String {
		return string.charAt(0).toUpperCase() + string.substr(1);
	}

	/**
	 * [Description]
	 * @param min
	 * @param max
	 * @return Int
	 */
	public static function randomInteger(min:Int, ?max:Int):Int {
		if (max == null) {
			max = min;
			min = 0;
		}
		return Math.floor(Math.random() * (max + 1 - min)) + min;
	}
}
