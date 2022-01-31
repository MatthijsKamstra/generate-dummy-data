package whisky;

import utils.MathUtil;

class Type {
	static var arr = ['Malt', 'Blend', 'Bourbon'];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
