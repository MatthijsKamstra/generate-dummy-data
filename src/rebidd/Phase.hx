package rebidd;

import utils.MathUtil;

class Phase {
	static var arr = [
		'Draft',
		'Pending',
		'Live',
		'Screening & contract',
		'Check-in',
		'Expired',
		'Rented'
	];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
