package address;

import lorem.Lorem;

class StreetSuffix {
	public static function get():String {
		var arr = [
			"spoor", "park", "gracht", "dijk", " Park", "straat", "laan", "plein", "hof", "weg"
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
