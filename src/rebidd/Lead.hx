package rebidd;

import utils.MathUtil;

class Lead {
	static var arr = ['ENQUIRY', 'ENQUIRY_X', 'ENQUIRY_Y', 'ENQUIRY_Z'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
