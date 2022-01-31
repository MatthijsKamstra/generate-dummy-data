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
	 * Capitulize the first character from the word
	 *
	 * @example
	 * 		var name = Util.capitalizeFirstLetter(new Lorem().word());
	 *
	 * @param string
	 * @return String
	 */
	public static function capitalizeFirstLetter(string:String):String {
		return string.charAt(0).toUpperCase() + string.substr(1);
	}


}
