package random;

class Color {
	static var arr = ['Red', 'Green', 'White', 'Black', 'Golden'];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
