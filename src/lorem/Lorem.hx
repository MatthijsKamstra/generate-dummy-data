package lorem;

import utils.Util;
import utils.MathUtil;

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
			total = MathUtil.randomInteger(3, 10);
		return Util.capitalizeFirstLetter(lorem.Words.get(total)) + ".";
	}

	/**
	 * get a sentence with total number of works
	 * @param total 	total words (default random between 3 and 10)
	 * @return String
	 */
	public function sentences(?total:Int):String {
		if (total == null)
			total = MathUtil.randomInteger(2, 6);
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

	// ____________________________________ clean up!!! ____________________________________
	var text = "One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. \"What's happened to me?\" he thought. It wasn't a dream. His room, a proper human room although a little too small, lay peacefully between its four familiar walls. A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather.";

	function getBody() {
		var l = text.length;
		return Util.capitalizeFirstLetter(text.substr(MathUtil.randomInteger(Math.round(l * 0.5), l)).trim());
	}

	function getDescription() {
		var l = text.length;
		return Util.capitalizeFirstLetter(text.substr(MathUtil.randomInteger(Math.round(l * 0.5), l)).trim());
	}
}
