package company;

class Suffix {
	public function new() {}

	public static function get():String {
		var arr:Array<String> = ["BV", "V.O.F.", "Groep", "NV", "Bedrijf", "en Zonen", "Combinatie"];
		return arr[Std.random(arr.length)];
	}
}
