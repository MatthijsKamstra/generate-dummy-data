package name;

class FirstName {
	public static function get():String {
		var arr:Array<String> = [
			"Elina", "Martin", "Lowell", "Corazon", "Diedre", "Slyvia", "Latrice", "Chantell", "Jeff", "Zulma", "Deonna", "Kortney", "Sunshine", "Alysa",
			"Zane", "Shaina", "Queenie", "Ingeborg", "Jarrod", "Angle"
		];
		return arr[Std.random(arr.length)];
	}

	public static function male():String {
		return '';
	}

	public static function female():String {
		return '';
	}
}
