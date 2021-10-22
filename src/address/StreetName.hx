package address;

import lorem.Lorem;

class StreetName {
	public static function get():String {
		var name = new Lorem().word();
		var suffix = StreetSuffix.get();
		return '$name${suffix}';
	}
}
