package rebidd;

import utils.MathUtil;

class Priority {
	static var arr = ['HIGH', 'MEDIUM', 'LOW', ''];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
