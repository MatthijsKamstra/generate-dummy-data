import date.Dates;
import haxe.Json;
import lorem.Lorem;
import name.Name;
import rebidd.Rebidd;
import sys.FileSystem;
import utils.DateUtil.*;
import utils.MathUtil;
import utils.UUID;

using StringTools;

class MainRebidd {
	public function new() {
		trace('MainRebidd');

		generate("export/rebidd/rebidd_tasks_00010.json", 10);
		// generate("export/rebidd/rebidd_tasks_00100.json", 100);
		// generate("export/rebidd/rebidd_tasks_01000.json", 1000);
		// // generate("export/new/rebidd_tasks_10000.json", 10000);
	}

	function generate(path:String = "export/data.json", total:Int = 11) {
		var json = {};
		Reflect.setField(json, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		Reflect.setField(json, 'updated_date', toISOString(Date.now()));

		// clear previous render
		var propertyPath = 'export/rebidd/property';
		var propertyOverviewPath = 'export/rebidd/property/overview';
		var propertyTasksPath = 'export/rebidd/property/tasks';
		var propertyDetailsPath = 'export/rebidd/property/details';

		if (FileSystem.exists(propertyPath)) {
			FileSystem.rename(propertyPath, '${propertyPath}_${Date.now().toString()}');
		}
		FileSystem.createDirectory(propertyPath);
		FileSystem.createDirectory(propertyOverviewPath);
		FileSystem.createDirectory(propertyTasksPath);
		FileSystem.createDirectory(propertyDetailsPath);

		var propertyArr = [];
		var tasksArr = [];
		for (i in 0...total) {
			var obj = {};
			Reflect.setField(obj, 'id', UUID.uuid()); // added because we need this, probably changing in the future
			Reflect.setField(obj, 'title', new Lorem().title());
			Reflect.setField(obj, 'description', new Lorem().description());
			// Reflect.setField(obj, 'description', new Lorem().paragraph(5));

			Reflect.setField(obj, 'is_todo', MathUtil.chance());

			Reflect.setField(obj, 'due_date', toISOString(new Dates().future(MathUtil.randomInteger(0, 10)))); // TODO: today, future, chance
			Reflect.setField(obj, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
			Reflect.setField(obj, 'updated_date', toISOString(Date.now()));

			// PROPERTY
			var property = {};
			var id = UUID.uuid();
			Reflect.setField(property, 'id', id);
			Reflect.setField(property, 'title', new Rebidd().propertyTitle()); // 123 Test avueneu
			Reflect.setField(property, 'user', new Rebidd().user()); // <----- not sure of the relationship with the other user (below)
			Reflect.setField(property, 'status', new Rebidd().status());
			Reflect.setField(property, 'phase', new Rebidd().phase());
			Reflect.setField(property, 'type', new Rebidd().type());
			Reflect.setField(property, 'priority', new Rebidd().priority());
			Reflect.setField(property, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(property, 'updated_date', toISOString(Date.now()));
			// set it also in the task
			Reflect.setField(obj, 'property', property);

			propertyArr.push(property);

			/// HACK
			var property_overview = {};
			Reflect.setField(property_overview, 'id', UUID.uuid());
			Reflect.setField(property_overview, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(property_overview, 'updated_date', toISOString(Date.now()));
			Reflect.setField(property_overview, 'title', new Rebidd().propertyTitle());
			Reflect.setField(property_overview, 'User', new Rebidd().user());
			Reflect.setField(property_overview, 'Team', new Rebidd().team());
			Reflect.setField(property_overview, 'Status', new Rebidd().status());
			Reflect.setField(property_overview, 'Phase', new Rebidd().phase());
			Reflect.setField(property_overview, 'Type', new Rebidd().type());
			Reflect.setField(property_overview, 'Lead', new Rebidd().lead());
			Reflect.setField(property_overview, 'Comment', new Rebidd().comment());
			Reflect.setField(property_overview, 'Landlord', new Rebidd().landlord());

			var property_tasks = {};
			Reflect.setField(property_tasks, 'id', UUID.uuid());
			Reflect.setField(property_tasks, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(property_tasks, 'updated_date', toISOString(Date.now()));

			var property_details = {};
			Reflect.setField(property_details, 'id', UUID.uuid());
			Reflect.setField(property_details, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(property_details, 'updated_date', toISOString(Date.now()));

			DummyData.saveTextFile(Json.stringify(property_overview, null, '\t'), '${propertyOverviewPath}/${id}.json');
			DummyData.saveTextFile(Json.stringify(property_tasks, null, '\t'), '${propertyTasksPath}/${id}.json');
			DummyData.saveTextFile(Json.stringify(property_details, null, '\t'), '${propertyDetailsPath}/${id}.json');

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
			Reflect.setField(user, 'created_date', toISOString(Date.now()));
			Reflect.setField(user, 'updated_date', toISOString(Date.now()));
			Reflect.setField(obj, 'user', user);

			var tags = Json.parse(Json.stringify(new Rebidd().tag()));
			Reflect.setField(obj, 'tags', tags);

			tasksArr.push(obj);
		}

		Reflect.setField(json, 'tasks', tasksArr);

		var str = Json.stringify(json, null, '\t');

		DummyData.saveTextFile(str, path);

		var jsonProperty = {};
		Reflect.setField(jsonProperty, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		Reflect.setField(jsonProperty, 'updated_date', toISOString(Date.now()));

		Reflect.setField(jsonProperty, 'properties', propertyArr);

		var str = Json.stringify(jsonProperty, null, '\t');

		DummyData.saveTextFile(str, path.replace('tasks', 'properties'));
	}

	// /**
	//  * convert date to isoStrring (not a default function in Haxe, )
	//  * // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString
	//  *
	//  * @param date // // expected output: 2011-10-05T14:48:00.000Z
	//  */
	// function toISOString(date:Date) {
	// 	var t = DateTools.format(date, "%Y-%m-%dT%H:%M:%S.000Z");
	// 	// 2016-07-08T14:44:05.000Z
	// 	return t;
	// }
	// ____________________________________ main ____________________________________

	static function main() {
		var app = new MainRebidd();
	}
}
