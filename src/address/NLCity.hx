package address;

class NLCity {
	public static function get():String {
		var arr = [
			"Amsterdam", "Rotterdam", "DenHaag", "Utrecht", "Eindhoven", "Groningen", "Tilburg", "Almere", "Breda", "Nijmegen", "Apeldoorn", "Arnhem",
			"Haarlem", "Enschede", "Haarlemmermeer", "Amersfoort", "Zaanstad", "'s-Hertogenbosch", "Zwolle", "Zoetermeer", "Leeuwarden", "Leiden",
			"Maastricht", "Ede", "Dordrecht", "Alphen aan den Rijn", "Westland", "Alkmaar", "Emmen", "Delft", "Venlo", "Deventer"
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
