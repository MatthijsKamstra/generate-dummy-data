package video;

import lorem.Slogan;
import utils.MathUtil;

class Video {
	public function new() {}

	public function type():String {
		return video.Type.get();
	}

	public function language():String {
		return video.Language.get();
	}

	public function genre():Array<String> {
		return video.Genre.get();
	}

	public function actors():Array<String> {
		return video.Actors.get();
	}

	public function uiid():String {
		return utils.UUID.uuid();
	}

	public function title():String {
		return Slogan.get();
	}

	public function year():Int {
		return MathUtil.randomInteger(1980, Date.now().getFullYear());
	}

	public function duration():Int {
		return MathUtil.randomInteger(80, 200);
	}
}
