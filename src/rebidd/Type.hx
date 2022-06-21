package rebidd;

import utils.MathUtil;

class Type {
	static var arr = ['Maintenance', 'Rental', 'Take photos', 'Retail'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
