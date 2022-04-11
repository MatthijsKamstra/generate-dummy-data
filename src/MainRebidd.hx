import haxe.Json;
import lorem.Lorem;
import date.Dates;
import name.Name;
import rebidd.Rebidd;
import utils.UUID;
import video.Video;

using StringTools;

class MainRebidd {
	public function new() {
		trace('MainRebidd');

		generate("export/en/rebidd_tasks_00010.json", 10);
		generate("export/en/rebidd_tasks_00100.json", 100);
		generate("export/en/rebidd_tasks_01000.json", 1000);
		// generate("export/en/rebidd_tasks_10000.json", 10000);
	}

	function generate(path:String = "export/data.json", total:Int = 11) {
		var json = {};
		Reflect.setField(json, 'created_date', Date.now());
		Reflect.setField(json, 'updated_date', Date.now());

		var arr = [];
		for (i in 0...total) {
			var obj = {};
			Reflect.setField(obj, 'title', new Lorem().title());
			Reflect.setField(obj, 'description', new Lorem().description());
			// Reflect.setField(obj, 'description', new Lorem().paragraph(5));

			Reflect.setField(obj, 'due_date', new Dates().future(2)); // TODO: today, future, chance
			Reflect.setField(obj, 'created_date', new Dates().past(2));
			Reflect.setField(obj, 'updated_date', Date.now());

			var property = {};
			Reflect.setField(property, 'title', new Rebidd().propertyTitle()); // 123 Test avueneu
			Reflect.setField(property, 'user', new Rebidd().user()); // <----- not sure of the relationship  with the other user (below)
			Reflect.setField(property, 'status', new Rebidd().status());
			Reflect.setField(property, 'phase', new Rebidd().phase());
			Reflect.setField(property, 'type', new Rebidd().type());
			Reflect.setField(property, 'created_date', new Dates().past(2));
			Reflect.setField(property, 'updated_date', Date.now());
			Reflect.setField(obj, 'property', property);

			var status = new Rebidd().status();
			Reflect.setField(obj, 'status', status);

			var phase = new Rebidd().phase();
			Reflect.setField(obj, 'phase', phase);

			var priority = new Rebidd().priority();
			Reflect.setField(obj, 'priority', priority);

			var type = new Rebidd().type();
			Reflect.setField(obj, 'type', type);

			var team = new Rebidd().team();
			Reflect.setField(obj, 'team', team);

			// assigned
			var user = {};
			Reflect.setField(user, 'id', UUID.uuid());
			Reflect.setField(user, 'name', new Name().firstName());
			Reflect.setField(user, 'team', team); // <------ set earlier
			Reflect.setField(user, 'role', new Rebidd().role());
			Reflect.setField(user, 'created_date', Date.now());
			Reflect.setField(user, 'updated_date', Date.now());
			Reflect.setField(obj, 'user', user);

			var tags = Json.parse(Json.stringify(new Rebidd().tag()));
			Reflect.setField(obj, 'tags', tags);

			arr.push(obj);
		}

		Reflect.setField(json, 'tasks', arr);

		var str = Json.stringify(json, null, '\t');

		DummyData.saveTextFile(str, path);
	}

	// ____________________________________ main ____________________________________

	static function main() {
		var app = new MainRebidd();
	}
}
