package whisky;

import utils.MathUtil;

class Country {
	static var arr = [
		'Schotland', 'Ierland', 'Verenigde Staten', 'Japan', 'Canada', 'India', 'Wales', 'Nederland', 'Zweden', 'Zwitserland', 'Finland', 'Zuid Afrika'
	];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
