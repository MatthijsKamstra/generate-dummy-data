package rebidd;

import utils.MathUtil;

class Status {
	static var arr = ['DRAFT', 'DRAFT_y', 'DRAFT_z', 'TODO'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
