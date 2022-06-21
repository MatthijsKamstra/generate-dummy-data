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
		// clear previous render
		var propertyPath = 'export/rebidd/property';
		// var notificationPath = 'export/rebidd/notification';
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
		var notificationArr = [];
		for (i in 0...total) {
			var taskObj = {};
			Reflect.setField(taskObj, 'id', UUID.uuid()); // added because we need this, probably changing in the future
			Reflect.setField(taskObj, 'title', new Lorem().title());
			Reflect.setField(taskObj, 'description', new Lorem().description());
			// Reflect.setField(taskObj, 'description', new Lorem().paragraph(5));

			Reflect.setField(taskObj, 'is_todo', MathUtil.chance());

			Reflect.setField(taskObj, 'due_date', toISOString(new Dates().future(MathUtil.randomInteger(0, 10)))); // TODO: today, future, chance
			Reflect.setField(taskObj, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
			Reflect.setField(taskObj, 'updated_date', toISOString(Date.now()));

			// PROPERTY VARS
			// var property_id = UUID.uuid(); // maybe fake id? easier to overwrite data `fake-id-`
			var property_id = 'fake-id-${Std.string(i).lpad('0', 10)}'; // maybe fake id? easier to overwrite data `fake-id-`
			var property_title = new Rebidd().propertyTitle();
			var property_phase = new Rebidd().phase();
			var property_landlord = new Rebidd().landlord();

			// PROPERTY
			var propertyObj = {};
			Reflect.setField(propertyObj, 'id', property_id);
			Reflect.setField(propertyObj, 'title', property_title); // 123 Test avueneu
			Reflect.setField(propertyObj, 'User', new Rebidd().user()); // <----- not sure of the relationship with the other user (below)
			Reflect.setField(propertyObj, 'Status', new Rebidd().status());
			Reflect.setField(propertyObj, 'Phase', property_phase);
			Reflect.setField(propertyObj, 'Type', new Rebidd().type());
			Reflect.setField(propertyObj, 'priority', new Rebidd().priority());
			Reflect.setField(propertyObj, 'Landlord', property_landlord);
			Reflect.setField(propertyObj, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(propertyObj, 'updated_date', toISOString(Date.now()));
			// set it also in the task
			Reflect.setField(taskObj, 'property', propertyObj);

			propertyArr.push(propertyObj);

			// CREATE PROPERTY OVERVIEW DATA
			var property_overviewObj = {};
			Reflect.setField(property_overviewObj, 'id', UUID.uuid());
			Reflect.setField(property_overviewObj, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(property_overviewObj, 'updated_date', toISOString(Date.now()));
			Reflect.setField(property_overviewObj, 'title', property_title);
			Reflect.setField(property_overviewObj, 'User', new Rebidd().user());
			Reflect.setField(property_overviewObj, 'Team', new Rebidd().team());
			Reflect.setField(property_overviewObj, 'Status', new Rebidd().status());
			Reflect.setField(property_overviewObj, 'Phase', property_phase);
			Reflect.setField(property_overviewObj, 'Type', new Rebidd().type());
			Reflect.setField(property_overviewObj, 'Lead', new Rebidd().lead());
			Reflect.setField(property_overviewObj, 'Comment', new Rebidd().comment());
			Reflect.setField(property_overviewObj, 'Landlord', property_landlord);

			// export
			DummyData.saveTextFile(Json.stringify(property_overviewObj, null, '\t'), '${propertyOverviewPath}/${property_id}.json');

			// CREATE PROPERTY TASKS DATA
			// this creates one single task... that is incorrect
			var property_tasksJson = {};
			Reflect.setField(property_tasksJson, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(property_tasksJson, 'updated_date', toISOString(Date.now()));
			var property_tasksArr = [];

			// lets start with 20 issues
			for (i in 0...20) {
				var property_tasksObj = {};
				Reflect.setField(property_tasksObj, 'id', UUID.uuid());
				Reflect.setField(property_tasksObj, 'created_date', toISOString(new Dates().past(2)));
				Reflect.setField(property_tasksObj, 'updated_date', toISOString(Date.now()));
				Reflect.setField(property_tasksObj, 'due_date', toISOString(new Dates().future(6)));
				Reflect.setField(property_tasksObj, 'title', property_title);
				Reflect.setField(property_tasksObj, 'description', new Lorem().description(4));
				Reflect.setField(property_tasksObj, 'Property', propertyObj);
				Reflect.setField(property_tasksObj, 'User', new Rebidd().user());
				Reflect.setField(property_tasksObj, 'Status', new Rebidd().status());
				Reflect.setField(property_tasksObj, 'Phase', new Rebidd().phase());
				Reflect.setField(property_tasksObj, 'Type', new Rebidd().type());
				Reflect.setField(property_tasksObj, 'Priority', new Rebidd().priority());
				Reflect.setField(property_tasksObj, 'Note', new Rebidd().note());
				Reflect.setField(property_tasksObj, 'Comment', new Rebidd().comment());
				var tags = Json.parse(Json.stringify(new Rebidd().tag()));
				Reflect.setField(property_tasksObj, 'Tag', tags);

				property_tasksArr.push(property_tasksObj);
				// // export
				// DummyData.saveTextFile(Json.stringify(property_tasksObj, null, '\t'), '${propertyTasksPath}/${property_id}.json');
			}

			Reflect.setField(property_tasksJson, 'tasks', property_tasksArr);
			// export
			DummyData.saveTextFile(Json.stringify(property_tasksJson, null, '\t'), '${propertyTasksPath}/${property_id}.json');

			var property_detailsObj = {};
			Reflect.setField(property_detailsObj, 'id', UUID.uuid());
			Reflect.setField(property_detailsObj, 'created_date', toISOString(new Dates().past(2)));
			Reflect.setField(property_detailsObj, 'updated_date', toISOString(Date.now()));
			Reflect.setField(property_detailsObj, 'WIP', {});

			// export
			DummyData.saveTextFile(Json.stringify(property_detailsObj, null, '\t'), '${propertyDetailsPath}/${property_id}.json');

			var status = new Rebidd().status();
			Reflect.setField(taskObj, 'Status', status);

			var phase = new Rebidd().phase();
			Reflect.setField(taskObj, 'Phase', phase);

			var priority = new Rebidd().priority();
			Reflect.setField(taskObj, 'Priority', priority);

			var type = new Rebidd().type();
			Reflect.setField(taskObj, 'Type', type);

			var team = new Rebidd().team();
			Reflect.setField(taskObj, 'Team', team);

			var user = new Rebidd().user();
			Reflect.setField(taskObj, 'User', user);

			var tags = Json.parse(Json.stringify(new Rebidd().tag()));
			Reflect.setField(taskObj, 'Tags', tags);

			tasksArr.push(taskObj);

			// Notification
			var notificationObj = {};
			Reflect.setField(notificationObj, 'id', UUID.uuid());
			Reflect.setField(notificationObj, 'title', new Lorem().title());
			// Reflect.setField(notificationObj, 'title', property_title);
			Reflect.setField(notificationObj, 'due_date',
				toISOString(new Dates().future(MathUtil.randomInteger(0, 10), MathUtil.randomInteger(60),
					MathUtil.randomInteger(60)))); // TODO: today, future, chance
			Reflect.setField(notificationObj, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
			Reflect.setField(notificationObj, 'updated_date', toISOString(Date.now()));
			Reflect.setField(notificationObj, 'User', new Rebidd().user());
			Reflect.setField(notificationObj, 'Type', new Rebidd().type());
			Reflect.setField(notificationObj, 'Status', new Rebidd().status());
			Reflect.setField(notificationObj, 'LinkedObject', new Rebidd().linkedObject());

			notificationArr.push(notificationObj);
		}

		var jsonTasks = {};
		var jsonProperty = {};
		var jsonNotification = {};

		var pathTasks = "export/rebidd/rebidd_tasks_00010.json";
		var pathProperty = "export/rebidd/rebidd_properties_00010.json";
		var pathNotification = "export/rebidd/rebidd_notifications_00010.json";

		// tasks
		Reflect.setField(jsonTasks, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		Reflect.setField(jsonTasks, 'updated_date', toISOString(Date.now()));
		Reflect.setField(jsonTasks, 'tasks', tasksArr);
		DummyData.saveTextFile(Json.stringify(jsonTasks, null, '\t'), pathTasks);

		// property
		Reflect.setField(jsonProperty, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		Reflect.setField(jsonProperty, 'updated_date', toISOString(Date.now()));
		Reflect.setField(jsonProperty, 'properties', propertyArr);
		DummyData.saveTextFile(Json.stringify(jsonProperty, null, '\t'), pathProperty);

		// notification
		Reflect.setField(jsonNotification, 'created_date', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		Reflect.setField(jsonNotification, 'updated_date', toISOString(Date.now()));
		Reflect.setField(jsonNotification, 'notifications', notificationArr);
		DummyData.saveTextFile(Json.stringify(jsonNotification, null, '\t'), pathNotification);
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
