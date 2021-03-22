package art;

import utils.Util;

class Period {
	public static function get() {
		var arr = [
			'Magic realism',
			'CoBrA',
			'Photo realism',
			'Pop-art',
			'North Netherlands figuration',
			'Post-internet',
			'Other',
		];
		var startY = Util.randomInteger(1900, 1950);
		var endY = Util.randomInteger(1950, Date.now().getFullYear());
		return {
			'name': arr[Math.floor(Math.random() * arr.length)],
			'start': startY,
			'end': endY,
		};
	}
}
