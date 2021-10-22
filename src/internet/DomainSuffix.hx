package internet;

class DomainSuffix {
	public function new() {}

	public static function get():String {
		// var arr:Array<String> = ["com", "biz", "info", "name", "net", "org", 'nl', 'amsterdam'];
		var arr:Array<String> = ["com", "net", "org", 'nl', 'amsterdam'];
		return arr[Std.random(arr.length)];
	}
}
