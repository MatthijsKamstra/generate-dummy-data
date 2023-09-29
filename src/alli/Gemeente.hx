package alli;

class Gemeente {
	static var arr = [
		'Aalten', 'Alkmaar', 'Almere', 'Alphen aan den Rijn', 'Amersfoort', 'Apeldoorn', 'Barneveld', 'Bergen', 'Berkelland', 'Bronckhorst', 'Den Helder',
		'Dijk en Waard', 'Doesburg', 'Doetinchem', 'Drechterland', 'Dronten', 'Duiven', 'Edam-Volendam', 'Enkhuizen', 'Ermelo', 'Elburg', 'Haarlem',
		'Harderwijk', 'Hattem', 'Heiloo', 'Hillegom', 'Hollands Kroon', 'Hoorn', 'Kaag en Braassem', 'Katwijk', 'Koggenland', 'Leiden', 'Landsmeer',
		'Leiderdorp', 'Lelystad', 'Lisse', 'Lochem', 'Medemblik', 'Montferland', 'Nieuwkoop', 'Noordwijk', 'Nunspeet', 'Nijkerk', 'Oegstgeest', 'Oldebroek',
		'Oost Gelre', 'Opmeer', 'Oostzaan', 'Oude IJsselstreek', 'Putten', 'Purmerend', 'Rheden', 'Schagen', 'Stedebroec', 'Texel', 'Teylingen',
		'Voorschoten', 'Wassenaar', 'Waterland', 'West Betuwe', 'Westervoort', 'Winterswijk', 'Wormerland', 'Zaanstad', 'Zeewolde', 'Zevenaar', 'Zoeterwoude',
		'Zuidplas', 'Zutphen', 'Flevoland'
	];

	public static function get():String {
		return arr[Math.floor(Math.random() * arr.length)];
	}

	public static function getRandomSet(min:Int = 0, max:Int = -1):Array<String> {
		var setArr = [];
		var total = Math.floor(Math.random() * arr.length);
		if (max != -1) {
			total = max;
		}
		if (min >= total) {
			total = min;
		}
		for (i in 0...total) {
			var tag = Gemeente.get();
			if (setArr.indexOf(tag) == -1)
				setArr.push(tag);
		}

		return setArr;
	}

	public static function getAll() {
		return arr;
	}
}
