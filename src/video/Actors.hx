package video;

import name.Name;
import utils.MathUtil;

class Actors {
	public static function get() {
		var nr = MathUtil.randomInteger(1, 5);
		var arr = [];
		for (i in 0...nr) {
			arr.push('${new name.Name().firstName()} ${new name.Name().lastName()}');
		}

		return arr;
	}
}
