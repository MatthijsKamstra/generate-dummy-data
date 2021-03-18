import address.Address;

class MainTest {
	public function new() {
		trace('>>> MainTest');

		// trace(DummyData.address.country());
		// trace(DummyData.address.city());

		// trace(DummyData.name.firstName());
		// trace(DummyData.name.lastName());
		// trace(DummyData.name.obj());

		// // trace(DummyData.art.dimensions());
		// // trace(DummyData.art.obj());

		// trace(DummyData.image.avatar());
		// // trace(DummyData.image.obj());

		var json = {};

		Reflect.setField(json, 'created', Date.now());

		var arr = [];
		var total = 10;
		for (i in 0...total) {
			var obj = {};
			Reflect.setField(obj, 'id', i);
			var nameObj = DummyData.name.obj();
			Reflect.setField(obj, 'firstname', nameObj.firstName);
			Reflect.setField(obj, 'name', nameObj);
			var dim = DummyData.image.dimensions();
			Reflect.setField(obj, 'image', DummyData.image.imageSizes('$i', dim));
			arr.push(obj);
		}

		Reflect.setField(json, 'data', arr);

		DummyData.saveFile(json, "test.json");
	}

	static public function main() {
		var app = new MainTest();
	}
}
