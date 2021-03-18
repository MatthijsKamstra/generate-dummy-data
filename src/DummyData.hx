import haxe.Json;
import sys.FileSystem;
import image.Image;
import address.Address;
import name.Name;

class DummyData {
	static public var address:Address = new Address();
	static public var name:Name = new Name();
	static public var image:Image = new Image();

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
