package rebidd;

import name.Name;
import phone.Phone;
import utils.DateUtil.*;

using StringTools;

class Landlord {
	/**
		*
		* ```
			{
				"id": 1,
				"name": "Test Landlord",
				"createdTimestamp": "2022-05-27T11:06:43.987Z",
				"updatedTimestamp": "2022-05-27T11:06:43.987Z",
				"ContactDetails": {
					"id": 1,
					"email": "test@email.com",
					"contactNumber": "+274445556666t"
				}
			}
		* ```
		* @return Dynamic
	 */
	public static function get():Dynamic {
		// one object to use in others values
		var nameObj = new Name().obj();
		return {
			id: utils.UUID.uuid(),
			name: '${nameObj.firstName} ${nameObj.lastName}',
			createdTimestamp: toISOString(Date.now()),
			updatedTimestamp: toISOString(Date.now()),
			'contactDetailsDTO': ContactDetails.get(nameObj),
		};
	}

	public static function getCondensed(val):Dynamic {
		// one object to use in others values
		var nameObj = new Name().obj();
		return {
			landlordId: val.id,
			name: val.name,
		};
	}
}
