package video;

import utils.Util;

class Type {
	public static function get() {
		var arr = ['series', 'films', 'kids', 'programma\'s'];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
