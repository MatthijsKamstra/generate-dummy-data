package alli;

import utils.MathUtil;

class Domain {
	static var arr = ["COMMON", "PUBLIC_LIGHTING", "TARIFF_SWITCHING"];

	public static function get():String {
		// var val = Math.floor(Math.random() * arr.length);
		// return {id: val, name: arr[val]};
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getRandomSet():Array<String> {
		var setArr = [];
		var total = Math.floor(Math.random() * arr.length);
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
