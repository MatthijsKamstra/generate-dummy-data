import alli.Domain;
import alli.FunctionGroup;
import alli.Gemeente;
import date.Dates;
import haxe.Json;
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
		// generate("export/alli/alli_organisations_00100.json", 100);
		// generate("export/alli/alli_organisations_01000.json", 1000);
		// // generate("export/new/alli_organisations_10000.json", 10000);
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
			Reflect.setField(obj, 'expiryDate', Dates.future(MathUtil.randomInteger(100, 200)));
			Reflect.setField(obj, 'domains', Domain.getRandomSet());

			content.push(obj);
		}
		Reflect.setField(json, 'content', content);

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
