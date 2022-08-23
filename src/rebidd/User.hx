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
				"createdTimestamp": "2022-05-27T11:03:35.005Z",
				"updatedTimestamp": "2022-05-27T11:03:35.005Z",
				"ContactDetails": {
					"id": 1,
					"email": "test@email.com",
					"contactNumber": "+273334445555"
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
			creationTimestamp: toISOString(Date.now()),
			updatedTimestamp: toISOString(Date.now()),
			'contactDetailsDTO': ContactDetails.get(nameObj),
			'teamDTO': new Rebidd().team(),
			"cognitoUsername": '${nameObj.firstName}.${nameObj.lastName}@gmail.com',
			'roleDTOS': new Rebidd().role(),
		};
	}
}
