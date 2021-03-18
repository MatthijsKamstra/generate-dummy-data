package address;

class City {
	public static function get():String {
		var arr = [
			'Tokyo', 'Jakarta', 'Delhi', 'Seoul', 'Manila', 'Mumbai', 'Karachi', 'Shanghai', 'New York', 'Sao Paolo', 'Beijing', 'Mexico City', 'Guangzhou',
			'Osaka', 'Moscow', 'Shaka', 'Cairo', 'Bangkok', 'Los Angeles', 'Kolkata', 'Buenos Aires', 'Tehran', 'Istanbul', 'Lagos', 'Shenzhen',
			'Rio de Janeiro', 'Kinshasa', 'Tianjin', 'Lima', 'Paris', 'Chengdu', 'Lahore', 'London', 'Bangalore', 'Ho Chi Minh City', 'Nagoya', 'Chennai',
			'Bogota', 'Chicago', 'Johannesburg', 'Taipei', 'Dongguan', 'Hyderabad', 'Wuhan', 'Hangzhou', 'Hanoi', 'Chongqing', 'Onitsha', 'Ahmadabad',
			'Kuala Lumpur',
		];
		return arr[Math.floor(Math.random() * arr.length)];
	}
}
