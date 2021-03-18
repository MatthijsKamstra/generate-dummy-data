package address;

class Country {
	public static function get():String {
		var arr = [
			'Australia', 'Austria', 'Argentina', 'Belgium', 'Brazil', 'Bulgaria', 'China', 'Colombia', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany',
			'Hungary', 'Hong Kong', 'Ireland', 'Italy', 'India', 'Indonesia', 'Japan', 'Kazakhstan', 'Luxembourg', 'Latvia', 'Lithuania', 'Malaysia',
			'Mongolia', 'Mexico', 'Monaco', 'Norway', 'Netherlands', 'Poland', 'Portugal', 'Philippines', 'Romania', 'Russia', 'Singapore', 'Spain',
			'South Korea', 'Slovakia', 'Sweden', 'Taiwan', 'Thailand', 'Turkey', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States',
			'Vietnam'
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
