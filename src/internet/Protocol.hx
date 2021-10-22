package internet;

class Protocol {
	public function new() {}

	public static function get():String {
		var arr:Array<String> = ['http', 'https'];
		return arr[Std.random(arr.length)];
	}
}
