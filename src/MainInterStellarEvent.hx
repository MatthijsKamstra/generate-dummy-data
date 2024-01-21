import alli.Application;
import alli.Domain;
import alli.FunctionGroup;
import alli.Gemeente;
import company.Company;
import date.Dates;
import haxe.Json;
import internet.Internet;
import lorem.Lorem;
import name.Name;
import sys.FileSystem;
import utils.DateUtil.*;
import utils.DateUtil;
import utils.MathUtil;
import utils.UUID;
import utils.converter.HaxeJsonDef;
import utils.converter.TypescriptJsonDef;

using StringTools;

class MainInterStellarEvent {
	public function new() {
		trace('MainInterStellarEvent');

		// generate("export/interstellar/interstellar_attendee_00010.json", 10);
		// generate("export/interstellar/interstellar_attendee_00100.json", 100);
		// generate("export/interstellar/interstellar_attendee_00176.json", 176);
		// // generate("export/interstellar/interstellar_attendee_01000.json", 1000);
		// // // generate("export/new/interstellar_attendee_10000.json", 10000);
		generateAttendees("export/rawevent/attendees_00010.json", 10);
		generateAttendees("export/rawevent/attendees_00100.json", 100);
		generateAttendees("export/rawevent/attendees_00176.json", 176);
		// generateAttendees("export/interstellar/interstellar_users_00010.json", 10);
		// generateAttendees("export/interstellar/interstellar_users_00100.json", 100);
		// generateAttendees("export/interstellar/interstellar_users_00176.json", 176);
	}

	function generateAttendees(path:String = "export/data.json", total:Int = 11) {
		// clear previous render
		var folder = 'export/rawevent';
		FileSystem.createDirectory(folder);

		var json = {};
		Reflect.setField(json, 'created', Date.now());

		var attendees = [];
		for (i in 0...total) {
			//
			var obj = {};

			var name = new Name().obj();

			var comp = new Company().obj();

			Reflect.setField(obj, "_id", '${UUID.uuid()}');
			Reflect.setField(obj, "id", '${name.firstName} ${name.lastName}');
			Reflect.setField(obj, "userName", '${name.firstName.toLowerCase().replace(' ', '_')}_${name.lastName.toLowerCase().replace(' ', '_')}');
			Reflect.setField(obj, "firstName", '${name.firstName}');
			Reflect.setField(obj, "middleName", '${name.middleName}');
			Reflect.setField(obj, "lastName", '${name.lastName}');
			Reflect.setField(obj, "email", '${new Internet().email(name)}');
			Reflect.setField(obj, "company", '${comp.name}');

			attendees.push(obj);
		}
		Reflect.setField(json, 'attendees', attendees);

		// output json
		var str = Json.stringify(json, null, '\t');
		sys.io.File.saveContent(path, str);
	}

	// function generate(path:String = "export/data.json", total:Int = 11) {
	// 	// clear previous render
	// 	var organisations = 'export/alli';
	// 	// if (FileSystem.exists(organisations)) {
	// 	// 	FileSystem.rename(organisations, '${organisations}_${Date.now().toString()}');
	// 	// }
	// 	FileSystem.createDirectory(organisations);
	// 	var json = {};
	// 	Reflect.setField(json, 'created', Date.now());
	// 	var content = [];
	// 	for (i in 0...total) {
	// 		//
	// 		var obj = {};
	// 		// trace(Gemeente.get());
	// 		var name = Gemeente.get();
	// 		Reflect.setField(obj, 'organisationIdentification', '${name}_${i}');
	// 		Reflect.setField(obj, 'name', '${name}');
	// 		Reflect.setField(obj, 'prefix', '${name.substring(0, 3).toUpperCase()}');
	// 		Reflect.setField(obj, 'functionGroup', FunctionGroup.getRandomSet());
	// 		Reflect.setField(obj, 'isEnabled', MathUtil.chance());
	// 		Reflect.setField(obj, 'substationManagement', MathUtil.chance());
	// 		Reflect.setField(obj, 'expiryDate', new Dates().future(MathUtil.randomInteger(100, 200)));
	// 		Reflect.setField(obj, 'domains', Domain.getRandomSet());
	// 		content.push(obj);
	// 	}
	// 	Reflect.setField(json, 'contents', content);
	// 	Reflect.setField(json, "totalItems", content.length);
	// 	Reflect.setField(json, "totalPages", 1);
	// 	Reflect.setField(json, "pageSize", content.length);
	// 	// output json
	// 	var str = Json.stringify(json, null, '\t');
	// 	sys.io.File.saveContent(path, str);
	// }
	// ____________________________________ main ____________________________________

	static function main() {
		var app = new MainInterStellarEvent();
	}
}
