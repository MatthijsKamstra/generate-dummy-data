package rebidd;

import address.Address;
import address.StreetName;
import address.NLCity;
import name.Name;
import utils.UUID;
import haxe.Json;
import utils.MathUtil;

class Rebidd {
	public function new() {}

	public function type():String {
		return Type.get();
	}

	public function phase() {
		return Phase.get();
	}

	public function status() {
		return Status.get();
	}

	public function priority() {
		return Priority.get();
	}

	public function team() {
		return Team.get();
	}

	public function lead() {
		return Lead.get();
	}

	// public function comment() {
	// 	return Comment.get();
	// }

	public function landlord() {
		return Landlord.get();
	}

	public function propertyTitle() {
		return '${new Address().streetAddress()} ${NLCity.get()}';
	}

	public function user():Dynamic {
		return User.get();
	}

	public function role() {
		var random = MathUtil.randomInteger(1, 3);
		var arr = [];
		for (i in 0...random) {
			var role = Roles.get();
			if (!containsObject(role, arr)) {
				arr.push(role);
			}
		}
		return arr;
	}

	function containsObject(obj:Dynamic, list:Array<Dynamic>):Bool {
		for (i in 0...list.length) {
			// trace(list[i] + " == " + obj);
			if (Json.stringify(list[i]) == Json.stringify(obj)) {
				return true;
			}
		}
		return false;
	}

	public function tag():Array<Dynamic> {
		var random = MathUtil.randomInteger(1, 5);
		var arr = [];
		for (i in 0...random) {
			var tag = Tag.get();
			// trace(tag);
			// trace(containsObject(tag, arr));
			if (!containsObject(tag, arr)) {
				arr.push(tag);
			}
		}
		return arr;
	}

	public function note():Array<Dynamic> {
		return comment();
	}

	public function comment():Array<Dynamic> {
		var random = MathUtil.randomInteger(1, 5);
		var arr = [];
		for (i in 0...random) {
			var tag = Comment.get();
			// trace(tag);
			// trace(containsObject(tag, arr));
			if (!containsObject(tag, arr)) {
				arr.push(tag);
			}
		}
		return arr;
	}
}
