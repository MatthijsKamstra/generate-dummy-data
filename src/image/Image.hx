package image;

import utils.Util;

/**
	- [x] image
	- [x] avatar
	- [x] imageUrl
	- [ ] abstract
	- [ ] animals
	- [ ] business
	- [ ] cats
	- [ ] city
	- [ ] food
	- [ ] nightlife
	- [ ] fashion
	- [ ] people
	- [ ] nature
	- [ ] sports
	- [ ] technics
	- [ ] transport
	- [ ] dataUri
	- [ ] lorempixel
	- [ ] unsplash
	- [ ] lorempicsum
	// https://avatars.dicebear.com/docs/http-api
 */
class Image {
	public function new() {}

	/**
	 * get an image based upon the following data
	 * @param seed 		used to show the same image in every version
	 * @param w 		width image
	 * @param h 		height image
	 * @return String	url image hosted on picsum
	 */
	public function image(seed:String = 'x', w:Int = 200, h:Int = 300):String {
		return 'https://picsum.photos/seed/${seed}/${w}/${h}';
	}

	/**
	 * get an image based upon the following data
	 * @param seed 		used to show the same image in every version
	 * @param w 		width image
	 * @param h 		height image
	 * @return String	url image hosted on picsum
	 */
	public function avatar(seed:String = 'x', w:Int = 50, h:Int = 50):String {
		return 'https://picsum.photos/seed/${seed}/${w}/${h}';
	}

	// public function imageUrl():String {
	// 	return 'https://picsum.photos/200';
	// }

	public function dimensions(min:Int = 10, max:Int = 2000):ImageObj {
		var w = Util.randomInteger(min, max);
		var h = Util.randomInteger(min, max);
		var direction = Direction.Landscape;
		if (w <= h) {
			direction = Direction.Portrait;
		}
		return {
			'width': w,
			'height': h,
			'direction': direction
		};
	}

	/**
	 * [Description]
	 * @param seed
	 * @param dimensions
	 */
	public function imageSizes(seed:String, dimensions:ImageObj) {
		var obj = dimensions;
		var _obj = {
			'thumb': 'https://picsum.photos/seed/${seed}/200/200',
			'half': 'https://picsum.photos/seed/${seed}/${Std.int(obj.width / 2)}/${Std.int(obj.height / 2)}',
			'original': 'https://picsum.photos/seed/${seed}/${obj.width}/${obj.height}',
			'large': 'https://picsum.photos/seed/${seed}/${(obj.width * 2)}/${(obj.height * 2)}',
		}
		return _obj;
	}

	// public function obj():ImageObj {
	// 	return {};
	// }
}

typedef ImageObj = {
	var width:Int; // ': w,
	var height:Int; // ': h,
	var direction:Direction; // ': direction
};

enum Direction {
	Landscape;
	Portrait;
}
