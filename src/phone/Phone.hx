package phone;

import utils.MathUtil;

class Phone {
	// https://nl.wikipedia.org/wiki/Lijst_van_Nederlandse_netnummers
	public function new() {}

	/**
	 * @examle	new Phone().mobile_nl(); //
	 *
	 * @return String
	 */
	public function mobile_nl():String {
		var nr = '';
		for (i in 0...8) {
			nr += MathUtil.randomInteger(0, 9);
		}
		return '06-${nr}';
	}

	/**
	 * @examle 	new Phone().landline_nl(); //
	 *
	 * @return String
	 */
	public function landline_nl():String {
		var nr = '';
		for (i in 0...7) {
			nr += MathUtil.randomInteger(0, 9);
		}
		var net = '0';
		for (i in 0...2) {
			net += MathUtil.randomInteger(0, 9);
		}
		return '${net}-${nr}';
	}
}
