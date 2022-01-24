package whisky;

import whisky.Volume;
import whisky.Country;
import lorem.Slogan;
import utils.Util;

using StringTools;

class Whisky {
	public function new() {}

	public function type():String {
		return whisky.Type.get();
	}

	public function brand():String {
		return whisky.Brands.get();
	}

	public function country():String {
		return Country.get();
	}

	public function price():String {
		// between 5 and 250 a value (*100)
		var temp:Int = utils.Util.randomInteger(500, 25000);
		var str = '${temp}';
		return str.substr(0, str.length - 2) + ',' + str.substr(str.length - 2, str.length);
	}

	public function priceValue(str:String):Float {
		var temp = str.replace(',', '.');
		return Std.parseFloat(temp);
	}

	public function flavor():String {
		return whisky.Flavor.get();
	}

	public function volume():String {
		return Volume.get();
	}

	// public function language():String {
	// 	return whisky.Language.get();
	// }
	// public function genre():Array<String> {
	// 	return whisky.Genre.get();
	// }
	// public function actors():Array<String> {
	// 	return whisky.Actors.get();
	// }

	public function uiid():String {
		return utils.UUID.uuid();
	}

	public function title():String {
		return Slogan.get();
	}

	public function year():Int {
		return Util.randomInteger(1980, Date.now().getFullYear());
	}

	// public function duration():Int {
	// 	return Util.randomInteger(80, 200);
	// }
}
