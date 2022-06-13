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
				"created_date": "2022-05-27T11:06:43.987Z",
				"updated_date": "2022-05-27T11:06:43.987Z",
				"ContactDetails": {
					"id": 1,
					"email": "test@email.com",
					"contact_number": "+274445556666t"
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
			created_date: toISOString(Date.now()),
			updated_date: toISOString(Date.now()),
			ContactDetails: {
				id: utils.UUID.uuid(),
				email: '${nameObj.firstName.replace(' ', '')}@${nameObj.lastName.replace(' ', '')}.nl',
				contact_number: new Phone().mobile_nl()
			}
		};
	}
}
