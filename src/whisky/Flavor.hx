package whisky;

import utils.Util;

class Flavor {
	static var arr = ['mild & zacht', 'krachtig & rokerig', 'medium & granig', 'vol & rijk'];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
