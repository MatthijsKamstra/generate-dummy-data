import alli.Application;
import alli.Domain;
import alli.FunctionGroup;
import alli.Gemeente;
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

class MainAlli {
	public function new() {
		trace('MainAlli');

		generate("export/alli/alli_organisations_00010.json", 10);
		generate("export/alli/alli_organisations_00100.json", 100);
		generate("export/alli/alli_organisations_00176.json", 176);
		// generate("export/alli/alli_organisations_01000.json", 1000);
		// // generate("export/new/alli_organisations_10000.json", 10000);
		generateUsers("export/alli/alli_users_00010.json", 10);
		generateUsers("export/alli/alli_users_00100.json", 100);
		generateUsers("export/alli/alli_users_00176.json", 176);
	}

	function generateUsers(path:String = "export/data.json", total:Int = 11) {
		// clear previous render
		var organisations = 'export/alli';
		FileSystem.createDirectory(organisations);

		var json = {};
		Reflect.setField(json, 'created', Date.now());

		var content = [];
		for (i in 0...total) {
			//
			var obj = {};

			// trace(Gemeente.get());

			// var name = Gemeente.get();

			// Reflect.setField(obj, 'id', '${name}_${i}');
			// Reflect.setField(obj, 'name', '${name}');
			// Reflect.setField(obj, 'code', '${name.substring(0, 3).toUpperCase()}');
			// Reflect.setField(obj, 'functionGroup', FunctionGroup.getRandomSet());
			// Reflect.setField(obj, 'isEnabled', MathUtil.chance());
			// Reflect.setField(obj, 'isSubstationManagement', MathUtil.chance());
			// Reflect.setField(obj, 'expiryDate', Dates.future(MathUtil.randomInteger(100, 200)));
			// Reflect.setField(obj, 'domains', Domain.getRandomSet());

			var name = new Name().obj();

			Reflect.setField(obj, "id", '${name.firstName} ${name.lastName}');
			Reflect.setField(obj, "userName", '${name.firstName.toLowerCase()}_${name.lastName.toLowerCase()}');
			Reflect.setField(obj, "firstName", '${name.firstName}');
			Reflect.setField(obj, "middleName", '${name.middleName}');
			Reflect.setField(obj, "lastName", '${name.lastName}');
			Reflect.setField(obj, "email", '${new Internet().email(name)}');
			Reflect.setField(obj, "startDate", new Dates().future(MathUtil.randomInteger(1, 100)));
			Reflect.setField(obj, "expiryDate", new Dates().future(MathUtil.randomInteger(100, 200)));
			Reflect.setField(obj, "role", FunctionGroup.getRandomSet());
			Reflect.setField(obj, "applications", Application.getRandomSet());
			Reflect.setField(obj, "isBlocked", MathUtil.chance());

			content.push(obj);
		}
		Reflect.setField(json, 'contents', content);

		Reflect.setField(json, "totalItems", content.length);
		Reflect.setField(json, "totalPages", 1);
		Reflect.setField(json, "pageSize", content.length);

		// output json
		var str = Json.stringify(json, null, '\t');
		sys.io.File.saveContent(path, str);
	}

	function generate(path:String = "export/data.json", total:Int = 11) {
		// clear previous render
		var organisations = 'export/alli';

		// if (FileSystem.exists(organisations)) {
		// 	FileSystem.rename(organisations, '${organisations}_${Date.now().toString()}');
		// }
		FileSystem.createDirectory(organisations);

		var json = {};
		Reflect.setField(json, 'created', Date.now());

		var content = [];
		for (i in 0...total) {
			//
			var obj = {};

			// trace(Gemeente.get());

			var name = Gemeente.get();

			Reflect.setField(obj, 'id', '${name}_${i}');
			Reflect.setField(obj, 'name', '${name}');
			Reflect.setField(obj, 'code', '${name.substring(0, 3).toUpperCase()}');
			Reflect.setField(obj, 'functionGroup', FunctionGroup.getRandomSet());
			Reflect.setField(obj, 'isEnabled', MathUtil.chance());
			Reflect.setField(obj, 'isSubstationManagement', MathUtil.chance());
			Reflect.setField(obj, 'expiryDate', new Dates().future(MathUtil.randomInteger(100, 200)));
			Reflect.setField(obj, 'domains', Domain.getRandomSet());

			content.push(obj);
		}
		Reflect.setField(json, 'contents', content);

		Reflect.setField(json, "totalItems", content.length);
		Reflect.setField(json, "totalPages", 1);
		Reflect.setField(json, "pageSize", content.length);

		// output json
		var str = Json.stringify(json, null, '\t');
		sys.io.File.saveContent(path, str);
	}

	// ____________________________________ main ____________________________________

	static function main() {
		var app = new MainAlli();
	}
}
