package video;

import utils.Util;

class Kijkwijzer {
	static var arr = [
		'al', '06', '09', '12', '14', '16', '18', 'violence', 'fear', 'sex', 'discrimination', 'drugs', 'coarse'
	];
	static var age = ['al', '06', '09', '12', '14', '16', '18'];
	static var type = ['violence', 'fear', 'sex', 'discrimination', 'drugs', 'coarse'];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}

	public static function getAge() {
		return age[Math.floor(Math.random() * age.length)];
	}

	public static function getAllAge() {
		return age;
	}

	public static function getType() {
		// return type[Math.floor(Math.random() * type.length)];
		var nr = Util.randomInteger(1, 3);
		var typeArr = [];
		for (i in 0...nr) {
			var temp = type[Math.floor(Math.random() * type.length)];
			if (!typeArr.contains(temp))
				typeArr.push(temp);
		}

		return typeArr;
	}

	public static function getAllType() {
		return type;
	}
}
