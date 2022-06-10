package utils;

class DateUtil {
	/**
	 * convert date to isoStrring (not a default function in Haxe, )
	 * // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString
	 *
	 * @param date // // expected output: 2011-10-05T14:48:00.000Z
	 */
	public static function toISOString(date:Date) {
		var t = DateTools.format(date, "%Y-%m-%dT%H:%M:%S.000Z");
		// 2016-07-08T14:44:05.000Z
		return t;
	}
}
