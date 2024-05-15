package utils;

class StringUtil {
	public static function capString(str:String):String {
		var tempstr = '';
		tempstr = str.substring(0, 1).toUpperCase() + str.substring(1, str.length);
		return tempstr;
	}

	/**
		* This function works by converting the counter to a string, and then adding leading zeros until the string’s length is 4.
		* If the counter is already a number with 4 or more digits, it will be returned as is.
		* If the counter is less than 4 digits, leading zeros will be added.
		* For example, if the counter is 11, the function will return '0011'.
		* If the counter is 123, the function will return '0123'.
		* If the counter is 1234, the function will return '1234'. And so on. I hope this helps! Let me know if you have any other questions. 😊
		*
		* @param counter
		* @param length
		* @return String
		*
				* var counter = 123;
				var str = StringUtil.counterToString(counter);
				trace(str); // Outputs: '0123'

	 */
	public static function counterToString(counter:Int, length:Int = 4):String {
		var str = Std.string(counter);
		while (str.length < length) {
			str = '0' + str;
		}
		return str;
	}
}
