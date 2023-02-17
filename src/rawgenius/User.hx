package rawgenius;

import haxe.Json;
import lorem.Lorem;
import random.Number;
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
	public static function get(i:Int, j:Int):SpeakerInfo {
		// one object to use in others values
		var nameObj = new Name().obj();
		var id = '${i}-${j}';

		var w = Std.int(400);
		var h = Std.int(200);

		var userName = '${nameObj.firstName}_${nameObj.lastName}'.replace(' ', '_').toLowerCase();

		return {
			'id': id,
			'uuid': UUID.uuid(),
			'name': nameObj.firstName,
			'surname': nameObj.lastName,
			'image': {
				'thumb': 'https://picsum.photos/seed/${userName}/200/200',
				'banner': 'https://picsum.photos/seed/${userName}/${w}/${h}',
				'large': 'https://picsum.photos/seed/${userName}/${(w * 2)}/${(h * 2)}',
			}
			// creationTimestamp: toISOString(Date.now()),
			// updatedTimestamp: toISOString(Date.now()),
			// "cognitoUsername": '${nameObj.firstName}.${nameObj.lastName}@gmail.com',
		};
	}

	public static function getBio(i:Int, j:Int, speaker:SpeakerInfo):Dynamic {
		var json = Json.parse(Json.stringify(speaker));

		var userName = '${speaker.name}_${speaker.surname}'.replace(' ', '_').toLowerCase();

		Reflect.setProperty(json, 'bio', new Lorem().description(60));
		Reflect.setProperty(json, 'socials', {
			'twitter': 'https://twitter.com/${userName}',
			'github': 'https://github.com/${userName}',
			'instagram': 'https://www.instagram.com/${userName}',
			'linkedin': 'https://www.linkedin.com/in/${userName}'
		});

		return json;
	}
}

typedef SpeakerInfo = {
	var id:String;
	var uuid:String;
	var name:String;
	var surname:String;
	var image:ImageObj;
}

typedef ImageObj = {
	var thumb:String;
	var large:String;
	var banner:String;
}
