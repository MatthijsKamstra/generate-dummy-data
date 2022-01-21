package whisky;

import utils.Util;

class Volume {
	static var arr = [
		'450 cl',
		'300 cl',
		'150 cl',
		'100 cl',
		'70 cl',
		'50 cl',
		'35 cl',
		'20 cl',
		'5 cl'
	];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
