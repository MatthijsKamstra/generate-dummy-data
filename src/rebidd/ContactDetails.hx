package rebidd;

import phone.Phone;
import name.Name;
import name.Name.NameObj;

using StringTools;

class ContactDetails {
	public function new() {}

	/**
		*
		* @example 					'ContactDetails': ContactDetails.get(nameObj),
		*
		* ```
		{
			"id": 1,
			"email": "test@email.com",
			"contact_number": "+273334445555"
		}
		* ```
		* @return Dynamic
	 */
	public static function get(?nameObj:NameObj):Dynamic {
		// one object to use in others values
		var _nameObj = (nameObj == null) ? new Name().obj() : nameObj;
		return {
			id: utils.UUID.uuid(),
			email: '${_nameObj.firstName.replace(' ', '')}@${_nameObj.lastName.replace(' ', '')}.nl'.toLowerCase(),
			contact_number: new Phone().mobile_nl()
		};
	}
}
