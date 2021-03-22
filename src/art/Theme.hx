package art;

class Theme {
	public static function get() {
		var arr = [
			'The human face',
			'Digital world',
			'Still life',
			'Human vs. Nature',
			'Society & Urban development',
			'Colour & form',
			'Other'
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
