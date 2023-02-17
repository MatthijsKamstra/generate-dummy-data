package;

import utils.converter.TypescriptJsonDef;
import rawgenius.User;
import lorem.Lorem;
import haxe.Json;
import sys.FileSystem;
import utils.UUID;

class MainRawGenius {
	var timeTable = [
		'09:00-10:00',
		'10:15-11:15',
		'11:30-12:30',
		'13:30-14:30',
		'14:45-15:45',
		'16:00-17:00'
	];

	public function new() {
		trace('MainRawGenius');

		generate("export/rawgenius/rawgenius.json");
	}

	function generate(path:String) {
		var propertyPath = 'export/rawgenius';

		FileSystem.createDirectory(propertyPath);

		trace("Create json!");
		var json = {};

		Reflect.setField(json, 'created', Date.now());
		Reflect.setField(json, 'date', '2023-09-13');

		var roomNr = 4;
		var roomsArr = [];
		for (i in 0...roomNr) {
			var name = 'Room ${i + 1}';
			var scheduleArr = [];
			for (j in 0...timeTable.length) {
				var _timeTable = timeTable[j];
				var session = {
					// time: getTime(j),
					time: _timeTable,
					title: 'Session ${j + 1}',
					speaker: createSpeaker(j)
				}
				scheduleArr.push(session);
			}
			var room = {
				'name': name,
				'schedule': scheduleArr
			}
			roomsArr.push(room);
		}
		Reflect.setField(json, 'rooms', roomsArr);

		// output json
		var str = Json.stringify(json, null, '\t');
		sys.io.File.saveContent(path, str);

		// typescript typedef
		var tsjsondef = new TypescriptJsonDef();
		var str = tsjsondef.convert(Json.stringify(json), 'ISchedule');
		DummyData.saveTextFile(str, 'export/rawgenius/i-schedule.d.ts');
	}

	function getTime(i) {
		return {};
	}

	function createSpeaker(id:Int) {
		var json = {};
		var uuid = UUID.uuid();

		var user = User.get();
		Reflect.setField(json, 'user', user);
		// Reflect.setField(json, 'uuid', uuid);

		Reflect.setField(json, 'title', new Lorem().title());
		Reflect.setField(json, 'description', new Lorem().description());

		return json;
	}

	// 'thumb': 'https://picsum.photos/200/200?random=${id}',
	function getPicture(id:Int = 0, dim) {
		var w = Std.int(dim.width);
		var h = Std.int(dim.height);

		id++; // make sure the value doesn't start at zero
		var obj = {
			// 'thumb': 'https://picsum.photos/seed/${id}/200/200',
			'banner': 'https://picsum.photos/seed/${id}/${w}/${h}',
			// 'large': 'https://picsum.photos/seed/${id}/${(w * 2)}/${(h * 2)}',
		}
		return obj;
	}

	static public function main() {
		var app = new MainRawGenius();
	}
}
