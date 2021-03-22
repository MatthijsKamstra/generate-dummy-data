package art;

class Type {
	public static function get() {
		var arr = [
			'Painting',
			'Photography',
			'Sculpture',
			'Graphic',
			'Mixed media',
			'Work on paper',
			'Video',
			'Commisioned',
			'Other'
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
