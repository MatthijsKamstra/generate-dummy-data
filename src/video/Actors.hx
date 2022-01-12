package video;

import name.Name;
import utils.Util;

class Actors {
	public static function get() {
		var nr = Util.randomInteger(1, 5);
		var arr = [];
		for (i in 0...nr) {
			arr.push('${new name.Name().firstName()} ${new name.Name().lastName()}');
		}

		return arr;
	}
}
