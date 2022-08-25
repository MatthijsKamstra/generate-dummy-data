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
				  "createdTimestamp": "2022-05-27T11:15:49.700Z",
				  "updatedTimestamp": "2022-05-27T11:15:49.700Z",
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
			createdTimestamp: toISOString(new Dates().past(MathUtil.randomInteger(10, 20), MathUtil.randomInteger(23), MathUtil.randomInteger(59))),
			updatedTimestamp: toISOString(new Dates().past(MathUtil.randomInteger(0, 10), MathUtil.randomInteger(23), MathUtil.randomInteger(59))),
			"userDTO": new Rebidd().user(),
			hasBeenEdited:false
		};
	}
}
