package utils;

class DateUtil {
	/**
	 * convert date to isoString (not a default function in Haxe)
	 *
	 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString
	 *
	 * @example:
	 * 			DateUtil.toISOString(new Date.now); // expected output: 2011-10-05T14:48:00.000Z
	 * @param date
	 */
	public static function toISOString(date:Date) {
		var t = DateTools.format(date, "%Y-%m-%dT%H:%M:%S.000Z");
		// 2016-07-08T14:44:05.000Z
		return t;
	}
}
