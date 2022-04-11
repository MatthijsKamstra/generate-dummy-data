package rebidd;

import utils.MathUtil;

class Roles {
	static var arr = ['Sales', 'Administrator', 'Viewer', 'Reviewer'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
