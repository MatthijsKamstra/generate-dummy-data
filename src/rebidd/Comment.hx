package rebidd;

import utils.MathUtil;
import date.Dates;
import haxe.Json;
import lorem.Lorem;
import name.Name;
import rebidd.Rebidd;
import sys.FileSystem;
import utils.DateUtil.*;
import utils.MathUtil;
import utils.UUID;

class Comment {
	/**
		* ```
				  {
				  "id": 1,
				  "text": "We should contact the landlord",
				  "created_date": "2022-05-27T11:15:49.700Z",
				  "updated_date": "2022-05-27T11:15:49.700Z",
				  "User": {}
				},

		* ```
		*
		* @return Dynamic
	 */
	public static function get():Dynamic {
		return {
			id: utils.UUID.uuid(),
			text: new Lorem().title(),
			created_date: toISOString(new Dates().past(MathUtil.randomInteger(10, 20))),
			updated_date: toISOString(new Dates().past(MathUtil.randomInteger(0, 10))),
			"User": new Rebidd().user()
		};
	}
}
