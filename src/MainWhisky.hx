import utils.MathUtil;
import image.Image;
import whisky.Volume;
import whisky.Flavor;
import whisky.Brands;
import whisky.Country;
import whisky.Whisky;
import video.Kijkwijzer;
import video.Genre;
import utils.MathUtil;
import lorem.Lorem;
import utils.UUID;
import video.Video;
import haxe.Json;

using StringTools;

class MainWhisky {
	public function new() {
		trace('MainWhisky');

		generate("export/whisky_00010.json", 10);
		generate("export/whisky_00100.json", 100);
		generate("export/whisky_01000.json", 1000);
		generate("export/whisky_10000.json", 10000);
	}

	function generate(path:String = "export/whisky.json", total:Int = 11) {
		var json = {};
		Reflect.setField(json, 'created', Date.now());

		var arr = [];
		for (i in 0...total) {
			var obj = {};
			Reflect.setField(obj, 'id', i);
			Reflect.setField(obj, 'uiid', UUID.uuid());

			Reflect.setField(obj, 'title', new Video().title());
			Reflect.setField(obj, 'description', new Lorem().paragraph(5));

			var brand = new Whisky().brand();
			Reflect.setField(obj, 'brand', brand);
			var type = new Whisky().type();
			Reflect.setField(obj, 'type', type);
			var volume = new Whisky().volume();
			Reflect.setField(obj, 'volume', volume);

			Reflect.setField(obj, 'title', '${brand} ${type} ${volume}');

			Reflect.setField(obj, 'country', new Whisky().country());
			Reflect.setField(obj, 'flavor', new Whisky().flavor());

			var price = new Whisky().price();
			Reflect.setField(obj, 'price', price);
			Reflect.setField(obj, 'pricevalue', new Whisky().priceValue(price));

			// Reflect.setField(obj, 'year', new Video().year());
			// Reflect.setField(obj, 'duration', new Video().duration());

			// Reflect.setField(obj, 'stars', MathUtil.randomInteger(1, 5));
			// Reflect.setField(obj, 'genre', new Video().genre());
			// Reflect.setField(obj, 'actors', new Video().actors());
			// Reflect.setField(obj, 'language', new Video().language());

			Reflect.setField(obj, 'recommended', MathUtil.chance(20));
			Reflect.setField(obj, 'rating', MathUtil.randomInteger(1, 5));

			Reflect.setField(obj, 'image', new Image().image('${i + 1}', 200, 500));
			Reflect.setField(obj, 'images', new Image().imageSizes('${i + 1}', {width: 200, height: 500}));

			arr.push(obj);
		}

		Reflect.setField(json, 'items', arr);
		Reflect.setField(json, 'brands', Brands.getAll());
		Reflect.setField(json, 'country', whisky.Country.getAll());
		Reflect.setField(json, 'flavor', Flavor.getAll());
		Reflect.setField(json, 'type', whisky.Type.getAll());
		Reflect.setField(json, 'volume', Volume.getAll());

		var str = Json.stringify(json, null, '\t');

		DummyData.saveTextFile(str, path);
	}

	// 'thumb': 'https://picsum.photos/200/200?random=${id}',
	function getPicture(id:Int = 0) {
		id++; // make sure the value doesn't start at zero
		var obj = {
			'thumb': 'https://picsum.photos/seed/${id}/277/415',
			'banner': 'https://picsum.photos/seed/${id}/355/530',
			'large': 'https://picsum.photos/seed/${id}_hero/1920/1080',
		}
		return obj;
	}

	// ____________________________________ main ____________________________________

	static function main() {
		var app = new MainWhisky();
	}
}
