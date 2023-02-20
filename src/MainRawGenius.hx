package;

import haxe.Log;
import rawgenius.Tag;
import utils.converter.TypescriptJsonDef;
import rawgenius.User;
import lorem.Lorem;
import haxe.Json;
import sys.FileSystem;
import utils.UUID;

class MainRawGenius {
	var timeTable = [
		'09:00-10:00', // Opening Keynote
		'10:15-11:15', // sesion 1
		'11:30-12:30', // sesion 2
		'12:30-13:30', // lunch
		'13:30-14:30', // sesion 3
		'14:45-15:45', // sesion 4
		'16:00-17:00', // Closing Keynote
	];
	var ROOT = 'export/rawgenius';
	var TS = '';
	var SPEAKERS = '';

	public function new() {
		trace('MainRawGenius');
		setupFolder();

		generate("export/rawgenius/rawgenius.json");
		generateChatGPT("export/rawgenius/rawgenius_chatgpt.json");
	}

	function setupFolder() {
		TS = '${ROOT}/ts';
		SPEAKERS = '${ROOT}/speakers';

		FileSystem.createDirectory(ROOT);
		FileSystem.createDirectory(TS);
		FileSystem.createDirectory(SPEAKERS);
	}

	function generateChatGPT(path:String) {
		trace("Create CHATGPT json!");
		var json = {};
		Reflect.setField(json, 'created', Date.now());
		Reflect.setField(json, 'date', '2023-09-13');

		var roomNr = 2;
		var roomsArr = [];
		for (i in 0...roomNr) {
			var name = 'Room ${i + 1}';
			var scheduleArr:Array<SessionObj> = [];
			for (j in 0...timeTable.length) {
				var _timeTable = timeTable[j];
				var session:SessionObj = {
					// time: getTime(j),
					'time': {
						'total': _timeTable,
					},
					'title': 'Session ${j + 1}',
					'session': getSpeakerInfoShort(i, j),
				}
				if (_timeTable == '12:30-13:30') {
					session = {
						'time': {
							'total': _timeTable,
						},
						'title': 'Lunch Break',
					}
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
	}

	function generate(path:String) {
		trace("Create json!");
		var json = {};

		Reflect.setField(json, 'created', Date.now());
		Reflect.setField(json, 'date', '2023-09-13');

		var roomNr = 4;
		var roomsArr = [];
		for (i in 0...roomNr) {
			var name = 'Room ${i + 1}';
			var scheduleArr:Array<SessionObj> = [];
			for (j in 0...timeTable.length) {
				var _timeTable = timeTable[j];
				var session:SessionObj = {
					// time: getTime(j),
					'time': {
						'total': _timeTable,
						'start': '${_timeTable.split('-')[0]}',
						'end': '${_timeTable.split('-')[1]}',
					},
					'title': 'Session ${j + 1}',
					'session': getSpeakerInfo(i, j),
					'uuid': UUID.uuid(),
				}
				if (_timeTable == '12:30-13:30') {
					session = {
						'time': {
							'total': _timeTable,
							'start': '${_timeTable.split('-')[0]}',
							'end': '${_timeTable.split('-')[1]}',
						},
						'title': 'Lunch Break',
					}
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
		DummyData.saveTextFile(str, '${TS}/i-schedule.d.ts');
	}

	function getSpeakerInfoShort(i:Int, j:Int) {
		var short = {};

		// session info with speaker
		// Reflect.setField(short, 'speaker', speaker);
		Reflect.setField(short, 'title', new Lorem().title());
		Reflect.setField(short, 'description', new Lorem().description(40));
		Reflect.setField(short, 'tags', Tag.getRandomSet());

		return short;
	}

	function getSpeakerInfo(i:Int, j:Int) {
		var short = {};
		var bio = {};
		var uuid = UUID.uuid();
		var id = '${i}-${j}';

		var roomName = 'Room ${i}';
		var sessionName = 'Session ${j + 1}';

		var speaker:SpeakerInfo = User.get(i, j);
		var speakerBio = User.getBio(i, j, speaker);

		// session info with speaker
		Reflect.setField(short, 'speaker', speaker);
		Reflect.setField(short, 'title', '[${roomName}/${sessionName}] ' + new Lorem().title());
		Reflect.setField(short, 'description', '[${roomName}/${sessionName}] ' + new Lorem().description(40));
		Reflect.setField(short, 'tags', Tag.getRandomSet());

		// bio
		Reflect.setField(bio, 'created', Date.now());
		Reflect.setField(bio, 'id', id);
		Reflect.setField(bio, 'uuid', uuid);
		// Reflect.setField(bio, 'user', speaker);
		Reflect.setField(bio, 'bio', speakerBio);

		// output json
		var str = Json.stringify(bio, null, '\t');
		sys.io.File.saveContent('${SPEAKERS}/${id}.json', str);

		return short;
	}

	// ____________________________________ utils ____________________________________

	function getTime(i) {
		return {};
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

typedef SessionObj = {
	@:optional var uuid:String;
	@:optional var session:{};
	var title:String;
	var time:{};
}
