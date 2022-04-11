package rebidd;

import utils.MathUtil;

class Team {
	static var arr = ['Amsterdam', 'Rotterdam'];

	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		// TODO parent?
		return {id: val, name: arr[val], parent: -1};
	}

	public static function getAll() {
		return arr;
	}
}
