package address;

class Zipcode {
	public static function get():String {
		var arr = [
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
		];
		var zip = '${Math.floor(Math.random() * 10)}${Math.floor(Math.random() * 10)}${Math.floor(Math.random() * 10)}${Math.floor(Math.random() * 10)} ${arr[Math.floor(Math.random() * arr.length)].toUpperCase()}${arr[Math.floor(Math.random() * arr.length)].toUpperCase()}';
		return zip;
	}
}
