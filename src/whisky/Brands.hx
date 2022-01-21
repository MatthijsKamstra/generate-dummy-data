package whisky;

import utils.Util;

class Brands {
	static var arr = [
		'Famous Grouse', 'Glen Talloch', 'Johnnie Walker', 'Grant\'S', 'White Lion', 'Jameson', 'Glenfiddich', 'Jack Daniels', 'Chivas Regal', 'Dalwhinnie',
		'Glenlivet', 'Jim Beam', 'Lagavulin', 'Laphroaig', 'Ballantines', 'Loch Lomond', 'Dewar\'S', 'Nikka', 'Macallan', 'Arran', 'Frysk Hynder',
		'Smokehead', 'Teeling', 'Bruichladdich', 'The Busker', 'Signatory', 'Overig'
	];

	public static function get() {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getAll() {
		return arr;
	}
}
