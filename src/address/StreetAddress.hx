package address;

import lorem.Lorem;
import utils.*;

class StreetAddress {
	public static function get():String {
		var name = Util.capitalizeFirstLetter(new Lorem().word());
		var suffix = StreetSuffix.get();
		return '${name}${suffix} ${Math.floor(Math.random() * 500)}';
	}
}
