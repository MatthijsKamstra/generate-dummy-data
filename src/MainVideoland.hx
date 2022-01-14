import video.Kijkwijzer;
import video.Genre;
import utils.Util;
import lorem.Lorem;
import utils.UUID;
import video.Video;
import haxe.Json;

using StringTools;

class MainVideoland {
	public function new() {
		trace('MainVideoland');

		generate("export/videoland_00010.json", 10);
		generate("export/videoland_00100.json", 100);
		generate("export/videoland_01000.json", 1000);
		// generate("export/videoland_10000.json", 10000);
	}

	function generate(path:String = "export/videoland.json", total:Int = 11) {
		var json = {};
		Reflect.setField(json, 'created', Date.now());

		var arr = [];
		for (i in 0...total) {
			var obj = {};
			Reflect.setField(obj, 'id', i);
			Reflect.setField(obj, 'uiid', UUID.uuid());

			Reflect.setField(obj, 'title', new Video().title());
			Reflect.setField(obj, 'description', new Lorem().paragraph());
			Reflect.setField(obj, 'year', new Video().year());
			Reflect.setField(obj, 'type', new Video().type());
			Reflect.setField(obj, 'duration', new Video().duration());

			Reflect.setField(obj, 'stars', Util.randomInteger(1, 5));
			Reflect.setField(obj, 'genre', new Video().genre());
			Reflect.setField(obj, 'actors', new Video().actors());
			Reflect.setField(obj, 'language', new Video().language());

			Reflect.setField(obj, 'images', getPicture(i));
			Reflect.setField(obj, 'videos', getVideo(i));

			var kijkObj = {};
			var _age:String = Kijkwijzer.getAge();
			var _typeArr:Array<String> = Kijkwijzer.getType();
			var _typeArrCopy = _typeArr.slice(0);
			_typeArrCopy.unshift(_age);
			Reflect.setField(kijkObj, 'age', _age);
			Reflect.setField(kijkObj, 'type', _typeArr);
			Reflect.setField(kijkObj, 'list', _typeArrCopy);

			Reflect.setField(obj, 'kijkwijzer', kijkObj);

			arr.push(obj);
		}

		Reflect.setField(json, 'items', arr);
		Reflect.setField(json, 'type', video.Type.getAll());
		Reflect.setField(json, 'genre', video.Genre.getAll());
		Reflect.setField(json, 'language', video.Language.getAll());
		Reflect.setField(json, 'kijkwijzer', Kijkwijzer.getAll());

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

	function getVideo(id:Int = 0) {
		id++; // make sure the value doesn't start at zero
		var obj = {
			'trailer': 'https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4',
			'movie': 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
		}
		return obj;
	}

	// ____________________________________ main ____________________________________

	static function main() {
		var app = new MainVideoland();
	}
}
