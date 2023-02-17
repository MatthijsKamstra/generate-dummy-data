package rawgenius;

import utils.UUID;
import name.Name;
import phone.Phone;
import utils.DateUtil.*;

using StringTools;

class User {
	/**
	 * [Description]
	 * @return Dynamic
	 */
	public static function get():Dynamic {
		// one object to use in others values
		var nameObj = new Name().obj();

		return {
			id: UUID.uuid(),
			name: nameObj.firstName,
			surname: nameObj.lastName,
			// creationTimestamp: toISOString(Date.now()),
			// updatedTimestamp: toISOString(Date.now()),
			// "cognitoUsername": '${nameObj.firstName}.${nameObj.lastName}@gmail.com',
		};
	}
}
