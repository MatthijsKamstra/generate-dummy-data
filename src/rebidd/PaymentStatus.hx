package rebidd;

import utils.MathUtil;

class PaymentStatus {
	static var arr = ['Not received', 'Payment received'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
