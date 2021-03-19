package lorem;

import utils.Util;

using StringTools;

/**
	- [x] word
	- [x] words
	- [x] sentence
	- [ ] slug
	- [x] slogan
	- [x] sentences
	- [x] paragraph
	- [x] paragraphs
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

	/**
	 * get words
	 * @param total 		total number of works (default 3)
	 * @return String
	 */
	public function words(total:Int = 3):String {
		return lorem.Words.get(total);
	}

	/**
	 * get a sentence with total number of works
	 * @param total 	total words (default random between 3 and 10)
	 * @return String
	 */
	public function sentence(?total:Int):String {
		if (total == null)
			total = Util.randomInteger(3, 10);
		return Util.capitalizeFirstLetter(lorem.Words.get(total)) + ".";
	}

	/**
	 * get a sentence with total number of works
	 * @param total 	total words (default random between 3 and 10)
	 * @return String
	 */
	public function sentences(?total:Int):String {
		if (total == null)
			total = Util.randomInteger(2, 6);
		var str = '';
		for (i in 0...total) {
			var sentence = sentence();
			str += sentence + ' ';
		}
		return str.rtrim();
	}

	public function paragraph(total:Int = 3):String {
		var str = '';
		for (i in 0...total) {
			var sentence = sentence();
			str += sentence + ' ';
		}
		return str.rtrim();
	}

	public function paragraphs(total:Int = 3):String {
		var str = '';
		for (i in 0...total) {
			var paragraph = paragraph();
			str += paragraph + '\n\r';
		}
		return str;
	}
}
