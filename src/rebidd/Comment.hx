package rebidd;

import utils.MathUtil;

class Comment {
	public static function get():Dynamic {
		return {
			id: utils.UUID.uuid(),
			text: "zzz",
			// 'created_date': toISOString(Date.now()),
			// 'updated_date': toISOString(Date.now()),
		};
	}
}
