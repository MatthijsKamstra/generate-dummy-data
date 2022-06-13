package rebidd;

import utils.UUID;
import name.Name;
import phone.Phone;
import utils.DateUtil.*;

using StringTools;

class User {
	/**
		*
		* ```
			{
				"id": 1,
				"name": "Test Name",
				"surname": "Test surname",
				"Team": [
					{
						"id": 2,
						"name": "Amsterdam",
						"parent": 1
					},
					{
						"id": 1,
						"name": "Netherlands",
						"parent": null
					}
				],
				"created_date": "2022-05-27T11:03:35.005Z",
				"updated_date": "2022-05-27T11:03:35.005Z",
				"ContactDetails": {
					"id": 1,
					"email": "test@email.com",
					"contact_number": "+273334445555"
				},
				"UserRoles": [
					{
						"user_id": 1,
						"role_id": 1
					},
					{
						"user_id": 1,
						"role_id": 5
					}
				]
			}
		* ```
		* @return Dynamic
	 */
	public static function get():Dynamic {
		// one object to use in others values
		var nameObj = new Name().obj();

		return {
			id: UUID.uuid(),
			name: nameObj.firstName,
			surname: nameObj.lastName,
			created_date: toISOString(Date.now()),
			updated_date: toISOString(Date.now()),
			'Team': new Rebidd().team(),
			'ContactDetails': ContactDetails.get(nameObj),
			'UserRoles': new Rebidd().role(),
		};
	}
}
