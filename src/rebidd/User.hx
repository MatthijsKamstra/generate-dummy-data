package rebidd;

import utils.UUID;
import name.Name;

class User {
	public static function get():Dynamic {
		var user = {};
		Reflect.setField(user, 'id', UUID.uuid());
		Reflect.setField(user, 'name', new Name().firstName());
		Reflect.setField(user, 'team', {
			"id": "2",
			"name": "Netherlands",
			"parent": null
		});
		Reflect.setField(user, 'role', new Rebidd().role());
		// Reflect.setField(user, 'created_date', Date.now());
		// Reflect.setField(user, 'updated_date', Date.now());
		return user;
	}
}
