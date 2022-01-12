package video;

import utils.Util;

class Genre {
	public static function get() {
		var arr = [
			'Actie', 'Animatie', 'Arthouse', 'Avontuur', 'Cabaret', 'Competitie', 'Consument', 'Documentaire', 'Drama', 'Familie', 'Fantasy', 'Horror',
			'Informatief', 'Kids', 'Komedie', 'Lifestyle', 'Misdaad', 'Mysterie', 'Nieuws en Actualiteit', 'Reality', 'Romantiek', 'Sciencefiction',
			'Spelshow', 'Sport', 'Talkshow en Interview', 'Thriller', 'Voorstelling'
		];
		var nr = Util.randomInteger(1, 3);
		var genreArr = [];
		for (i in 0...nr) {
			genreArr.push(arr[Math.floor(Math.random() * arr.length)]);
		}

		return genreArr;
	}
}
