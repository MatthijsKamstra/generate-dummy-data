package lorem;

using StringTools;

class Slogan {
	static public function get(name:String = ''):String {
		var ARRAY_1:Array<String> = [
			"Elina", "Martin", "Lowell", "Corazon", "Diedre", "Slyvia", "Latrice", "Chantell", "Jeff", "Zulma", "Deonna", "Kortney", "Sunshine", "Alysa",
			"Zane", "Shaina", "Queenie", "Ingeborg", "Jarrod", "Angle"
		];
		var ARRAY_2:Array<String> = [
			"destroy", "is like", "hate", "kill", "cook", "rap about", "smile at", "sing with", "vote against", "isn't about", "grew up with", "used to know",
			"makes fun of", "knows all about", "had sex with", "design", "steal", "own", "is afraid of", "examined", "invented", "went to school with",
			"poke it's fingers in", "tell lies about", "bought", "sleep better because of", "shoot at", "scared", "kissed", "lost", "sweet talked",
			"died for", "tagged on", "talk about", "eat", "trade in", "is reborn as", "lived with", "apologize about", "is down with", "recognized",
			"throw mud at", "squeeze", "smoke", "listen to", "tell jokes about", "is better than", "crippled", "resemble", "pray for", "fight for",
			"don't understand", "sell", "smell of", "fly over", "made fun of", "chuckle at", "adore", "fry", "scream at", "gave me", "move like",
			"represent ", "read about", "found", "flirt with", "share files with", "left", "feel like", "hack", "carry", "cheer for", "love", "is fan of",
			"battled", "wonder about", "deal with", "ended up with", "welcome", "despise", "loathe", "remember", "spend some time with", "always ask for",
			"made", "keep up with", "strangled", "chewed on", "tried", "hang around with", "taste of", "tampered with", "cuddle", "sound like", "bite",
			"go against", "miss", "admire", "change into", "have beef with", "throw darts at", "paint over", "look down on", "look up to", "burn"
		];
		var ARRAY_3:Array<String> = [
			"other people", "a ton of lettuce", "George W's brain", "your girlfriend", "fish", "a baboon", "all people", "a washing machine",
			"a silent witness", "your source code", "the right answers", "your parents", "one in ten lawyers", "my feet", "your favourite rappers",
			"the pope", "your favourite site", "a bag of marbles", "problems", "cookies", "beautiful flowers", "yo mama", "randomness", "pencils", "cheese",
			"robots", "large breasts", "the government", "the army", "Microsoft", "nobody", "the lord", "your place of birth", "older browsers",
			"graphic design", "family values", "our leader", "strong language", "alcohol", "weed", "midgets", "women", "men", "his bosses",
			"the unknown soldier", "the police", "slogans", "apples", "walls", "country music", "freaks", "winos", "my skull", "strangers",
			"his worst enemies", "tourists", "politicians", "propaganda", "rubber duckies", "the truth", "electric boogie", "soccer", "Cuban fruit", "fear",
			"ice", "his friends", "Arthur Schopenhauer", "fashion", "dirty laundry", "beer", "coconuts", "bug spray", "glowsticks", "balloons", "his egos",
			"Miss World", "sunshine", "the blues", "the majority", "tattoos", "knives", "all this", "tubesocks", "his teeth", "his live", "your death",
			"his comeback", "the revolution", "keywords", "his age", "his job", "the common cause", "the good life", "imaginary friends", "god", "amateurs",
			"the light", "empty bottles", "the world", "each other", "the devil", "the working classes", "cell phones", "windmills"
		];
		var ARRAY_4:Array<String> = [
			"on the moon", "in the rain", "during springtime", "back in the eighties", "without fear", "in Africa", "as if it's OK", "with passion",
			"in between shows", "without eyes", "for some time", "on the beach", "in cars", "in the cold", "on prime time tv", ", youknowha'mean?",
			"beneath the surface", "because they're like that", "the way you like it", "in the shower", ", yeah right...", "by hand", "on the web",
			"just for fun", "almost every night", "thanks to his sponsors", "under eighteen", "for money", "to survive", "and why not", "in the dark",
			"in broad daylight", "during the break", "and that's it", "for a living", "from Holland", "at home", "by that tree there", "by accident",
			"on purpose", "to appear confident", "buttnaked", "at every opportunity", "on the first date", "and like it", "for you", ", so what?",
			"near those bushes", "for my birthday", "in every bar", "in his birthday suit", ", word!", "in his dungeon", "up north", "down south",
			"down by the waterside", "on the roof", "across the globe", "in them there hills", "in a theatre near you", "but only at home", "just like you",
			"dressed like clowns", "once a week", ", but why?", "according to the media", "for free", "in swimming pools", "from time to time",
			"every other day", ", all in good taste", ", and you?", ", can you dig it?", "in shopping malls", "on rollerskates", "on a bike", "at first",
			"without protection", "in times of war", "in the sky with diamonds", "on horseback", "under one roof", "in technicolor", "in one go",
			"as a hobby", "in the future", ", real funny", "full stop", "in the front seat", "after midnight", "after dinner", "in his sleep",
			"near the station", "up above", ", as promised", ", unlike others", "on a regular basis", "I presume", ", as usual"
		];
		var _ran1 = ARRAY_1[Std.random(ARRAY_1.length)];

		if (name != '')
			_ran1 = name;

		var _ran2 = ARRAY_2[Std.random(ARRAY_2.length)];
		var _ran3 = ARRAY_3[Std.random(ARRAY_3.length)];
		var _ran4 = ARRAY_4[Std.random(ARRAY_4.length)];

		var _sentence = _ran1 + " " + _ran2 + " " + _ran3 + " " + _ran4 + ".";
		// $cleansentence = str_replace(array(" , " , "!." ,"  ", "?."),array(", " , "!" , " " , "?") , $sentence);
		return _sentence.replace(' , ', ', ').replace('?.', '?');
	}
}
