package lorem;

import utils.Util;

using StringTools;

/**
	- [x] word
	- [x] words
	- [x] sentence
	- [ ] slug
	- [x] sentences
	- [ ] paragraph
	- [ ] paragraphs
	- [ ] text
	- [ ] lines
 */
class Lorem {
	public function new() {}

	public function slogan(name:String = ''):String {
		return Slogan.get(name);
	}

	public function word():String {
		return lorem.Words.get(1);
	}

	public function words(total:Int = 50):String {
		return lorem.Words.get(total);
	}

	public function sentence(total:Int = 50):String {
		return Util.capitalizeFirstLetter(lorem.Words.get(total)) + ".";
	}

	public function sentences(total:Int = 50):String {
		var str = '';
		for (i in 0...total) {
			var sentence = sentence(15);
			str += sentence + ' ';
		}
		return str.ltrim();
	}
}
