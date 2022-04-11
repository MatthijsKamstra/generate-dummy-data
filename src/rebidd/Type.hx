package rebidd;

import utils.MathUtil;

class Type {
	static var arr = ['Maintenancw', 'Rental', 'TAKE_PHOTOS'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
