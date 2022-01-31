package art;

import utils.MathUtil;

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
		var startY = MathUtil.randomInteger(1900, 1950);
		var endY = MathUtil.randomInteger(1950, Date.now().getFullYear());
		return {
			'name': arr[Math.floor(Math.random() * arr.length)],
			'start': startY,
			'end': endY,
		};
	}
}
