package alli;

class Gemeente {
	public static function get():String {
		var arr = [
			'Aalten', 'Alkmaar', 'Almere', 'Alphen aan den Rijn', 'Amersfoort', 'Apeldoorn', 'Barneveld', 'Bergen', 'Berkelland', 'Bronckhorst',
			'Den Helder ', 'Dijk en Waard', 'Doesburg', 'Doetinchem', 'Drechterland', 'Dronten', 'Duiven', 'Edam-Volendam ', 'Enkhuizen', 'Ermelo', 'Elburg',
			'Haarlem', 'Harderwijk', 'Hattem', 'Heiloo', 'Hillegom', 'Hollands Kroon', 'Hoorn', 'Kaag en Braassem', 'Katwijk', 'Koggenland', 'Leiden',
			'Landsmeer', 'Leiderdorp', 'Lelystad', 'Lisse', 'Lochem', 'Medemblik', 'Montferland', 'Nieuwkoop', 'Noordwijk', 'Nunspeet', 'Nijkerk',
			'Oegstgeest', 'Oldebroek', 'Oost Gelre ', 'Opmeer', 'Oostzaan', 'Oude IJsselstreek', 'Putten', 'Purmerend', 'Rheden', 'Schagen', 'Stedebroec',
			'Texel', 'Teylingen', 'Voorschoten', 'Wassenaar', 'Waterland', 'West Betuwe', 'Westervoort', 'Winterswijk', 'Wormerland', 'Zaanstad', 'Zeewolde',
			'Zevenaar', 'Zoeterwoude', 'Zuidplas', 'Zutphen', 'Flevoland'
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
