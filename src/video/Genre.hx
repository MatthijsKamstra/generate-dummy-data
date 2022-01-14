package video;

import utils.Util;

class Genre {
	static var arr = [
		'Actie', 'Animatie', 'Arthouse', 'Avontuur', 'Cabaret', 'Competitie', 'Consument', 'Documentaire', 'Drama', 'Familie', 'Fantasy', 'Horror',
		'Informatief', 'Kids', 'Komedie', 'Lifestyle', 'Misdaad', 'Mysterie', 'Nieuws en Actualiteit', 'Reality', 'Romantiek', 'Sciencefiction', 'Spelshow',
		'Sport', 'Talkshow en Interview', 'Thriller', 'Voorstelling'
	];

	public static function get() {
		var nr = Util.randomInteger(1, 3);
		var genreArr = [];
		for (i in 0...nr) {
			var temp = arr[Math.floor(Math.random() * arr.length)];
			if (!genreArr.contains(temp))
				genreArr.push(temp);
		}

		return genreArr;
	}

	public static function getAll() {
		return arr;
	}
}
