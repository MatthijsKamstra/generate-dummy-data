package video;

import utils.Util;

class Language {
	public static function get() {
		var arr = ['Nederlands', 'Frans', 'Engels', 'Duits', 'Spaans'];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
