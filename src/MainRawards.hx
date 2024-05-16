package;

import haxe.Json;
import haxe.Log;
import lorem.Lorem;
import name.Name;
import rawgenius.Tag;
import rawgenius.User;
import sys.FileSystem;
import utils.DateUtil.*;
import utils.MathUtil;
import utils.StringUtil;
import utils.UUID;
import utils.converter.TypescriptJsonDef;

using StringTools;

class MainRawards {
	var timeTable = [
		'09:00-10:00', // Opening Keynote
		'10:15-11:15', // sesion 1
		'11:30-12:30', // sesion 2
		'12:30-13:30', // lunch
		'13:30-14:30', // sesion 3
		'14:45-15:45', // sesion 4
		'16:00-17:00', // Closing Keynote
	];

	var rewardsArr:Array<{description:String, value:Int}> = [
		{"description": "Je je eigen inzet/klus regelt", "value": 50},
		{"description": "Nieuwe kandidaat die we aanbieding doen", "value": 200},
		{"description": "Nieuwe kandidaat door proeftijd heen", "value": 1000},
		{"description": "Nieuwe lead", "value": 50},
		{"description": "Lead die tot een inzet/deal leidt", "value": 100},
		{"description": "Bij elk dienstjaar 'jubileum'", "value": 100},
		{
			"description": "Gestarte kandidaat (externe) vinden op aanvraag",
			"value": 100
		}
	];

	var NAME = 'rawards';
	var ROOT = 'export/rawards';
	var TS = '';
	var USERS = '';

	public function new() {
		trace('MainRawards');

		ROOT = 'export/${NAME}';
		TS = '${ROOT}/ts';
		USERS = '${ROOT}/users';

		setupFolder();

		generate('export/${NAME}/${NAME}.json');
	}

	function setupFolder() {
		FileSystem.createDirectory(ROOT);
		FileSystem.createDirectory(TS);
		FileSystem.createDirectory(USERS);
	}

	function generate(path:String) {
		trace("Create json!");
		var json = {};

		Reflect.setField(json, 'created', Date.now());

		var userArr = [];
		var total = 85;
		for (i in 0...total) {
			var uuid = UUID.uuid();
			var userInfo:UserInfo = createUser(i);

			userArr.push({
				_id: '${userInfo._id}',
				id: '${userInfo.id}',
				name: '${userInfo.firstname} ${userInfo.lastname}',
				value: userInfo.total_value
			});

			// output userinfo as json
			var str = Json.stringify(userInfo, null, '\t');
			var filename = '/${userInfo._id}.json'.replace(' ', "_").toLowerCase();
			sys.io.File.saveContent(USERS + filename, str);

			// typescript typedef
			var tsjsondef = new TypescriptJsonDef();
			var str = tsjsondef.convert(Json.stringify(userInfo), 'IUserInfo');
			DummyData.saveTextFile(str, '${TS}/i-user-info.d.ts');
		}

		Reflect.setField(json, 'users', userArr);

		// output json
		var str = Json.stringify(json, null, '\t');
		sys.io.File.saveContent(path, str);

		// typescript typedef
		var tsjsondef = new TypescriptJsonDef();
		var str = tsjsondef.convert(Json.stringify(json), 'IRewards');
		DummyData.saveTextFile(str, '${TS}/i-rewards.d.ts');
	}

	function createUser(counter:Int):UserInfo {
		var nameObj = new Name().obj();

		var now = Date.now();
		var y = now.getFullYear() - 10;
		var m = now.getMonth();
		var d = now.getDate();

		var t = new Date(y, m, d, 0, 0, 0);

		var dateEmployment = toISOString(t);
		var rewardsArray = [];

		var totalValue = 0;
		var totalRewards = MathUtil.randomInteger(1, 10);
		for (i in 0...totalRewards) {
			var r = rewardsArr[MathUtil.randomInteger(rewardsArr.length - 1)];
			var reward:Reward = {
				id: UUID.uuid(),
				description: r.description, // "Je je eigen inzet/klus regelt"
				value: r.value, // 50
				date: Date.now(),
			};
			rewardsArray.push(reward);
			totalValue += r.value;
		}

		return {
			_id: StringUtil.counterToString(counter),
			id: UUID.uuid(),
			firstname: nameObj.firstName,
			lastname: nameObj.lastName,
			creationTimestamp: toISOString(Date.now()),
			updatedTimestamp: toISOString(Date.now()),
			rewards: rewardsArray,
			date_employment: dateEmployment,
			total_value: totalValue
		};
	}

	// ____________________________________ utils ____________________________________

	static public function main() {
		var app = new MainRawards();
	}
}

typedef UserInfo = {
	@:optional var total_value:Int; // temp
	@:optional var creationTimestamp:String;
	@:optional var updatedTimestamp:String;
	var _id:String; // simpel version of id (counter)
	var id:String; // uiid
	var firstname:String;
	var lastname:String;
	var rewards:Array<Reward>;
	var date_employment:String; // starting date employment
}

typedef Reward = {
	var id:String;
	var description:String; // "Je je eigen inzet/klus regelt"
	var value:Int; // 50
	var date:Date;
}
