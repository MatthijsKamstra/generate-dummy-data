import art.Art;
import address.Address;
import date.Dates;
import haxe.Json;
import image.Image;
import lorem.Lorem;
import name.Name;
import sys.FileSystem;

class DummyData {
	static public var address:Address = new Address();
	static public var name:Name = new Name();
	static public var image:Image = new Image();
	static public var lorem:Lorem = new Lorem();
	static public var art:Art = new Art();
	static public var date:Dates = new Dates();

	public function new() {}

	/**
	 * save file on disk
	 * @param json
	 * @param fileName
	 */
	public static function saveFile(json:{}, fileName:String = 'data.json') {
		var str = Json.stringify(json, null, '\t');
		sys.io.File.saveContent(fileName, str);
		// trace(FileSystem.fullPath(fileName));
		trace('File (${fileName}) saved at ${FileSystem.fullPath(fileName)}');
	}
}
