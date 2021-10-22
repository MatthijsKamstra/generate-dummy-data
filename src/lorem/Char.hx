package address;

class Char {
	public static function get():String {
		var arr = [
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
