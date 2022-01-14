package video;

import utils.Util;

class Language {
	static var arr = ['Nederlands', 'Frans', 'Engels', 'Duits', 'Spaans'];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
