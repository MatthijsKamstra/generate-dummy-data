package rebidd;

import utils.MathUtil;

class Lead {
	static var arr = ['Enquiry', 'Enquiry_x', 'Enquiry_y', 'Enquiry_z'];

	/**
		* ```
				{
				"id": 1,
				"name": "ENQUIRY"
				  },
		* ```
		*
		* @return Dynamic
	 */
	public static function get():Dynamic {
		var val = Math.floor(Math.random() * arr.length);
		return {id: val, name: arr[val]};
	}

	public static function getAll() {
		return arr;
	}
}
