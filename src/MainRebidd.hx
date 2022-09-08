import utils.converter.TypescriptJsonDef;
import utils.converter.HaxeJsonDef;
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
		var convertTsPath = 'export/rebidd/property/ts';
		var convertHxPath = 'export/rebidd/property/hx';
		// var propertyDetailsPath = 'export/rebidd/property/details';

		if (FileSystem.exists(propertyPath)) {
			FileSystem.rename(propertyPath, '${propertyPath}_${Date.now().toString()}');
		}
		FileSystem.createDirectory(propertyPath);
		FileSystem.createDirectory(propertyOverviewPath);
		FileSystem.createDirectory(propertyTasksPath);
		FileSystem.createDirectory(convertTsPath);
		FileSystem.createDirectory(convertHxPath);
		// FileSystem.createDirectory(propertyDetailsPath);

		var propertyArr = [];
		var tasksArr = [];
		var notificationArr = [];
		for (i in 0...total) {
			// PROPERTY VARS
			// var property_id = UUID.uuid(); // maybe fake id? easier to overwrite data `fake-id-`
			var property_id = 'fake-id-${Std.string(i).lpad('0', 10)}'; // maybe fake id? easier to overwrite data `fake-id-`
			var property_title = new Rebidd().propertyTitle();
			var property_phase = new Rebidd().phase();
			var property_priority = new Rebidd().priority();
			var property_landlord = new Rebidd().landlord();
			var property_landlord_condensed = new Rebidd().landlordCondensed(property_landlord);

			var tasksArr2 = [];
			var tasksArr3 = [];
			var comptaskObj = {};
			Reflect.setField(comptaskObj, 'propertyCondensedDTO', {
				"propertyId": property_id,
				"title": property_title
			});
			Reflect.setField(comptaskObj, 'tasks', []);

			var random = MathUtil.randomInteger(4, 10);
			for (i in 0...random) {
				// TASKS
				var taskObj = {};
				var taskObj2 = {};
				// add propertyCondensedDTO

				Reflect.setField(taskObj, 'id', UUID.uuid()); // added because we need this, probably changing in the future
				Reflect.setField(taskObj, 'title', new Lorem().title());
				Reflect.setField(taskObj, 'description', new Lorem().description());
				// Reflect.setField(taskObj, 'is_todo', MathUtil.chance());
				Reflect.setField(taskObj, 'dueDate', toISOString(new Dates().future(MathUtil.randomInteger(0, 10)))); // TODO: today, future, chance
				Reflect.setField(taskObj, 'createdTimestamp', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
				Reflect.setField(taskObj, 'updatedTimestamp', toISOString(Date.now()));
				Reflect.setField(taskObj, 'propertyId', property_id);
				Reflect.setField(taskObj, 'userDTO', new Rebidd().user());
				Reflect.setField(taskObj, 'statusDTO', new Rebidd().status());
				Reflect.setField(taskObj, 'phaseDTO', new Rebidd().phase());
				Reflect.setField(taskObj, 'priorityDTO', new Rebidd().priority());
				Reflect.setField(taskObj, 'typeDTO', new Rebidd().type());
				Reflect.setField(taskObj, 'comments', new Rebidd().comment());
				Reflect.setField(taskObj, 'notes', new Rebidd().note());

				Reflect.setField(taskObj2, 'taskId', untyped taskObj.id);
				Reflect.setField(taskObj2, 'title', untyped taskObj.title);
				Reflect.setField(taskObj2, 'dueDate', untyped taskObj.dueDate);
				Reflect.setField(taskObj2, 'priorityDTO', untyped taskObj.priorityDTO);
				Reflect.setField(taskObj2, 'phaseDTO', untyped taskObj.phaseDTO);
				Reflect.setField(taskObj2, 'statusDTO', untyped taskObj.statusDTO);
				Reflect.setField(taskObj2, 'typeDTO', untyped taskObj.typeDTO);
				var userCon = untyped taskObj.userDTO;
				var obj = {
					"userId": userCon.id,
					"name": userCon.name,
					"surname": userCon.surname,
				}
				Reflect.setField(taskObj2, 'userCondensedDTO', obj);

				// // export
				// // /v1/task/property/{id}
				// DummyData.saveTextFile(Json.stringify(taskObj, null, '\t'), '${propertyTasksPath}/${property_id}.json');
				// // export only one `.ts`/`.hx`
				// if (i == 0) {
				// 	// haxe typedef
				// 	var hxjsondef = new HaxeJsonDef();
				// 	var str = hxjsondef.convert(Json.stringify(taskObj), 'Task');
				// 	DummyData.saveTextFile(str, '${convertHxPath}/Task.hx');
				// 	// typescript typedef
				// 	var tsjsondef = new TypescriptJsonDef();
				// 	var str = tsjsondef.convert(Json.stringify(taskObj), 'Task');
				// 	DummyData.saveTextFile(str, '${convertTsPath}/task.d.ts');
				// }
				tasksArr2.push(taskObj);
				tasksArr3.push(taskObj2);
			}
			// export
			// /v1/task/property/{id}
			DummyData.saveTextFile(Json.stringify(tasksArr2, null, '\t'), '${propertyTasksPath}/${property_id}.json');
			// export only one `.ts`/`.hx`
			if (i == 0) {
				// haxe typedef
				var hxjsondef = new HaxeJsonDef();
				var str = hxjsondef.convert(Json.stringify(tasksArr2), 'Task');
				DummyData.saveTextFile(str, '${convertHxPath}/Task.hx');
				// typescript typedef
				var tsjsondef = new TypescriptJsonDef();
				var str = tsjsondef.convert(Json.stringify(tasksArr2), 'Task');
				DummyData.saveTextFile(str, '${convertTsPath}/task.d.ts');
			}

			// TASK OVERVIEW
			Reflect.setField(comptaskObj, 'tasks', tasksArr3);
			tasksArr.push(comptaskObj);
			// trace(comptaskObj);

			// PROPERTY

			var propertyObj = {};
			Reflect.setField(propertyObj, 'propertyId', property_id);
			Reflect.setField(propertyObj, 'title', property_title); // 123 Test avueneu
			Reflect.setField(propertyObj, 'phaseDTO', property_phase);
			Reflect.setField(propertyObj, 'priorityDTO', property_priority);
			Reflect.setField(propertyObj, 'landlordCondensedDTO', property_landlord_condensed);
			// Reflect.setField(propertyObj, 'User', new Rebidd().user()); // <----- not sure of the relationship with the other user (below)
			// Reflect.setField(propertyObj, 'Status', new Rebidd().status());
			// Reflect.setField(propertyObj, 'Type', new Rebidd().type());
			// Reflect.setField(propertyObj, 'createdTimestamp', toISOString(new Dates().past(2)));
			// Reflect.setField(propertyObj, 'updatedTimestamp', toISOString(Date.now()));
			// set it also in the task
			// Reflect.setField(taskObj, 'Property', propertyObj);
			propertyArr.push(propertyObj);

			// CREATE PROPERTY OVERVIEW DATA
			var property_overviewObj = {};
			Reflect.setField(property_overviewObj, 'id', UUID.uuid());
			Reflect.setField(property_overviewObj, 'title', property_title);
			Reflect.setField(property_overviewObj, 'userDTO', new Rebidd().user());
			Reflect.setField(property_overviewObj, 'teamDTO', new Rebidd().team());
			Reflect.setField(property_overviewObj, 'createdTimestamp', toISOString(new Dates().past(2)));
			Reflect.setField(property_overviewObj, 'updatedTimestamp', toISOString(Date.now()));
			Reflect.setField(property_overviewObj, 'landlordDTO', property_landlord);
			Reflect.setField(property_overviewObj, 'paymentStatus', new Rebidd().paymentStatus());
			Reflect.setField(property_overviewObj, 'phase', property_phase);
			Reflect.setField(property_overviewObj, 'priority', property_priority);
			Reflect.setField(property_overviewObj, 'propertyDetails', new Rebidd().propertyDetails());
			Reflect.setField(property_overviewObj, 'propertyFeatures', new Rebidd().propertyFeatures());
			Reflect.setField(property_overviewObj, 'propertyMedia', new Rebidd().propertyMedia());
			Reflect.setField(property_overviewObj, 'propertyDocuments', new Rebidd().propertyDocuments());
			Reflect.setField(property_overviewObj, 'comments', new Rebidd().comment());
			// Reflect.setField(property_overviewObj, 'Status', new Rebidd().status());
			// Reflect.setField(property_overviewObj, 'Type', new Rebidd().type());
			// Reflect.setField(property_overviewObj, 'Lead', new Rebidd().lead());

			// export
			DummyData.saveTextFile(Json.stringify(property_overviewObj, null, '\t'), '${propertyOverviewPath}/${property_id}.json');
			// export only one `.ts`/`.hx`
			if (i == 0) {
				// haxe typedef
				var hxjsondef = new HaxeJsonDef();
				var str = hxjsondef.convert(Json.stringify(property_overviewObj), 'PropertyOverview');
				DummyData.saveTextFile(str, '${convertHxPath}/PropertyOverview.hx');
				// typescript typedef
				var tsjsondef = new TypescriptJsonDef();
				var str = tsjsondef.convert(Json.stringify(property_overviewObj), 'PropertyOverview');
				DummyData.saveTextFile(str, '${convertTsPath}/propertyOverview.d.ts');
			}

			// CREATE PROPERTY TASKS DATA
			// this creates one single task... that is incorrect
			// var property_tasksJson = {};
			// Reflect.setField(property_tasksJson, 'createdTimestamp', toISOString(new Dates().past(2)));
			// Reflect.setField(property_tasksJson, 'updatedTimestamp', toISOString(Date.now()));
			// var property_tasksArr = [];

			// // lets start with 20 issues
			// for (i in 0...20) {
			// 	var property_tasksObj = {};
			// 	Reflect.setField(property_tasksObj, 'id', UUID.uuid());
			// 	Reflect.setField(property_tasksObj, 'createdTimestamp', toISOString(new Dates().past(2)));
			// 	Reflect.setField(property_tasksObj, 'updatedTimestamp', toISOString(Date.now()));
			// 	Reflect.setField(property_tasksObj, 'due_date', toISOString(new Dates().future(6)));
			// 	Reflect.setField(property_tasksObj, 'title', property_title);
			// 	Reflect.setField(property_tasksObj, 'description', new Lorem().description(4));
			// 	Reflect.setField(property_tasksObj, 'Property', propertyObj);
			// 	Reflect.setField(property_tasksObj, 'User', new Rebidd().user());
			// 	Reflect.setField(property_tasksObj, 'Status', new Rebidd().status());
			// 	Reflect.setField(property_tasksObj, 'Phase', new Rebidd().phase());
			// 	Reflect.setField(property_tasksObj, 'Type', new Rebidd().type());
			// 	Reflect.setField(property_tasksObj, 'Priority', new Rebidd().priority());
			// 	Reflect.setField(property_tasksObj, 'Note', new Rebidd().note());
			// 	Reflect.setField(property_tasksObj, 'Comment', new Rebidd().comment());
			// 	var tags = Json.parse(Json.stringify(new Rebidd().tag()));
			// 	Reflect.setField(property_tasksObj, 'Tag', tags);

			// 	property_tasksArr.push(property_tasksObj);
			// 	// // export
			// 	// DummyData.saveTextFile(Json.stringify(property_tasksObj, null, '\t'), '${propertyTasksPath}/${property_id}.json');
			// }

			// Reflect.setField(property_tasksJson, 'tasks', property_tasksArr);
			// // export
			// DummyData.saveTextFile(Json.stringify(property_tasksJson, null, '\t'), '${propertyTasksPath}/${property_id}.json');
			// // export only one `.ts`/`.hx`
			// if (i == 0) {
			// 	// haxe typedef
			// 	var hxjsondef = new HaxeJsonDef();
			// 	var str = hxjsondef.convert('Root', Json.stringify(property_tasksJson));
			// 	DummyData.saveTextFile(str, '${propertyTasksPath}/${property_id}.hx');
			// 	// typescript typedef
			// 	var tsjsondef = new TypescriptJsonDef();
			// 	var str = tsjsondef.convert(Json.stringify(property_tasksJson), 'Root');
			// 	DummyData.saveTextFile(str, '${propertyTasksPath}/${property_id}.ts');
			// }

			// var property_detailsObj = {};
			// Reflect.setField(property_detailsObj, 'id', UUID.uuid());
			// Reflect.setField(property_detailsObj, 'createdTimestamp', toISOString(new Dates().past(2)));
			// Reflect.setField(property_detailsObj, 'updatedTimestamp', toISOString(Date.now()));
			// Reflect.setField(property_detailsObj, 'WIP', {});

			// export
			// DummyData.saveTextFile(Json.stringify(property_detailsObj, null, '\t'), '${propertyDetailsPath}/${property_id}.json');

			// tasksArr.push(taskObj);

			// Notification
			var notificationObj = {};
			Reflect.setField(notificationObj, 'id', UUID.uuid());
			Reflect.setField(notificationObj, 'title', new Lorem().title());
			// Reflect.setField(notificationObj, 'title', property_title);
			Reflect.setField(notificationObj, 'due_date',
				toISOString(new Dates().future(MathUtil.randomInteger(0, 10), MathUtil.randomInteger(60),
					MathUtil.randomInteger(60)))); // TODO: today, future, chance
			Reflect.setField(notificationObj, 'createdTimestamp', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
			Reflect.setField(notificationObj, 'updatedTimestamp', toISOString(Date.now()));
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
		// Reflect.setField(jsonTasks, 'createdTimestamp', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		// Reflect.setField(jsonTasks, 'updatedTimestamp', toISOString(Date.now()));
		// DummyData.saveTextFile(Json.stringify(jsonTasks, null, '\t'), pathTasks);
		DummyData.saveTextFile(Json.stringify(tasksArr, null, '\t'), pathTasks);

		// haxe typedef
		var hxjsondef = new HaxeJsonDef();
		var str = hxjsondef.convert(Json.stringify(tasksArr), 'TaskOverview');
		DummyData.saveTextFile(str, '${convertHxPath}/TaskOverview.hx');
		// typescript typedef
		var tsjsondef = new TypescriptJsonDef();
		var str = tsjsondef.convert(Json.stringify(tasksArr), 'TaskOverview');
		DummyData.saveTextFile(str, '${convertTsPath}/taskOverview.d.ts');

		// property
		// Reflect.setField(jsonProperty, 'createdTimestamp', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		// Reflect.setField(jsonProperty, 'updatedTimestamp', toISOString(Date.now()));
		// Reflect.setField(jsonProperty, 'properties', propertyArr);
		// DummyData.saveTextFile(Json.stringify(jsonProperty, null, '\t'), pathProperty);
		DummyData.saveTextFile(Json.stringify(propertyArr, null, '\t'), pathProperty);

		var hxjsondef = new HaxeJsonDef();
		var str = hxjsondef.convert(Json.stringify(propertyArr), 'Properties');
		DummyData.saveTextFile(str, '${convertHxPath}/Properties.hx');
		// typescript typedef
		var tsjsondef = new TypescriptJsonDef();
		var str = tsjsondef.convert(Json.stringify(propertyArr), 'Properties');
		DummyData.saveTextFile(str, '${convertTsPath}/properties.d.ts');

		// notification
		Reflect.setField(jsonNotification, 'createdTimestamp', toISOString(new Dates().past(MathUtil.randomInteger(0, 10))));
		Reflect.setField(jsonNotification, 'updatedTimestamp', toISOString(Date.now()));
		Reflect.setField(jsonNotification, 'notifications', notificationArr);
		DummyData.saveTextFile(Json.stringify(jsonNotification, null, '\t'), pathNotification);

		var hxjsondef = new HaxeJsonDef();
		var str = hxjsondef.convert(Json.stringify(jsonNotification), 'Notification');
		DummyData.saveTextFile(str, '${convertHxPath}/Notifications.hx');
		// typescript typedef
		var tsjsondef = new TypescriptJsonDef();
		var str = tsjsondef.convert(Json.stringify(jsonNotification), 'Notification');
		DummyData.saveTextFile(str, '${convertTsPath}/notifications.d.ts');
	}

	// /**
	//  * convert date to isoString (not a default function in Haxe, )
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
