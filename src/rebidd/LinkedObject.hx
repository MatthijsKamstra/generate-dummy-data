package rebidd;

import name.Name;
import phone.Phone;
import utils.DateUtil.*;

using StringTools;

class LinkedObject {
	/**
		*
		* ```
			{
				"id": 1,
				"title": "Test notification at Property 123",
				"User": {},
				"Type": {
					"id": 1,
					"name": "COMMENT"
				},
				"Status": {
					"id": 1,
					"name": "READ"
				},
				"LinkedObject": {
					"id": 1,
					"type": "PROPERTY",
					"object_id": "123456789",
					"url": "xxx/property/get_by_id/123456789"
				}
			}
		* ```
		* @return Dynamic
	 */
	public static function get():Dynamic {
		var objID = utils.UUID.uuid();
		return {
			id: utils.UUID.uuid(),
			type: "PROPERTY",
			object_id: objID,
			url: 'xxx/property/get_by_id/${objID}',
		};
	}
}
