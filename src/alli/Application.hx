package alli;

import utils.MathUtil;

class Application {
	static var arr = [
		"DISTRIBUTION_AUTOMATION",
		"HE-GUI",
		"WEB_DISTRIBUTION_AUTOMATION",
		"WEB_INSTALLATION",
		"WEB_NET_MANAGEMENT",
		"WEB_OPERATOR",
		"WEB_SMARTMETER_API",
	];

	public static function get():String {
		// var val = Math.floor(Math.random() * arr.length);
		// return {id: val, name: arr[val]};
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getRandomSet(min:Int = 0, max:Int = -1):Array<String> {
		var setArr = [];
		var total = Math.floor(Math.random() * arr.length);
		var count = 0;
		if (max != -1) {
			total = max;
		}
		if (min >= total) {
			total = min;
		}
		for (i in 0...total) {
			var tag = Domain.get();
			if (setArr.indexOf(tag) == -1)
				setArr.push(tag);
		}

		return setArr;
	}

	public static function getAll() {
		return arr;
	}
}
