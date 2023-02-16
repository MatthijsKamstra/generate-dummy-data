package;

import haxe.Json;
import sys.FileSystem;

class MainRawGenius {
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

		var str = Json.stringify(json, null, '\t');

		sys.io.File.saveContent(path, str);
	}

	static public function main() {
		var app = new MainRawGenius();
	}
}
