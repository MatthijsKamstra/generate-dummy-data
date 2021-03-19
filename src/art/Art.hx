package art;

class Art {
	public function new() {}

	public function type():String {
		return art.Type.get();
	}

	public function period():{} {
		return art.Period.get();
	}

	public function theme():String {
		return art.Theme.get();
	}
}
