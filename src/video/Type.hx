package video;

import utils.MathUtil;

class Type {
	static var arr = ['series', 'films', 'kids', 'programma\'s'];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
