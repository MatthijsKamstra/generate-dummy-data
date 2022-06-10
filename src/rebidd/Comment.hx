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
	public static function get():Dynamic {
		return {
			id: utils.UUID.uuid(),
			text: new Lorem().title(),
			'created_date': toISOString(Date.now()),
			'updated_date': toISOString(Date.now()),
			"User": new Rebidd().user()
		};
	}
}
