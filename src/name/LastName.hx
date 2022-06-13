package name;

class LastName {
	public static function get():String {
		var arr:Array<String> = [
			"De Jong", "Jansen", "De Vries", "Van den Berg", "Van Dijk", "Bakker", "Janssen", "Visser", "Smit", "Meijer", "De Boer", "Mulder", "De Groot",
			"Bos", "Vos", "Peters", "Hendriks", "Van Leeuwen", "Dekker", "Brouwer", "De Wit", "Dijkstra", "Smits", "De Graaf", "Van der Meer"
		];

		return arr[Std.random(arr.length)];
	}
}
