package rebidd;

import utils.MathUtil;

class Tag {
	static var arr = ['Discussions', 'Follow-up', 'Foobar', 'BarFoo'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
