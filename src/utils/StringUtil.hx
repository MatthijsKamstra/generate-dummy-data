package utils;

class StringUtil {
	public static function capString(str:String):String {
		var tempstr = '';
		tempstr = str.substring(0, 1).toUpperCase() + str.substring(1, str.length);
		return tempstr;
	}
}
