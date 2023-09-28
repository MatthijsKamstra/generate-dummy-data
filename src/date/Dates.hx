package date;

import utils.MathUtil;

/**
	- [x] past
	- [x] future
	- [ ] between
	- [ ] betweens
	- [ ] recent
	- [ ] soon
	- [ ] month
	- [ ] weekday
 */
class Dates {
	public function new() {}

	/**
	 * get a date in the past
	 *
	 * @param days    	number of days in the past (default 1)
	 * @param hours		number of hours in the past (default 0)
	 * @param minutes	number of minutes in the past (default 0)
	 */
	public function past(days:Int = 1, hours:Int = 0, minutes:Int = 0) {
		var today = Date.now();
		var past = DateTools.delta(today, -(DateTools.days(days) + DateTools.hours(hours) + DateTools.minutes(minutes)));
		return past;
	}

	/**
	 * get a date in the future
	 *
	 * @param days    	number of days in the future (default 1)
	 * @param hours		number of hours in the future (default 0)
	 * @param minutes	number of minutes in the future (default 0)
	 */
	public function future(days:Int = 1, hours:Int = 0, minutes:Int = 0) {
		var today = Date.now();
		var future = DateTools.delta(today, DateTools.days(days) + DateTools.hours(hours) + DateTools.minutes(minutes));
		return future;
	}

	/**
	 * gehhh kinda stupid
	 */
	public function curent() {
		return Date.now();
	}

	public function getYear(period) {
		return MathUtil.randomInteger(period.start, period.end);
	}

	public function getYearPurchase(year) {
		return MathUtil.randomInteger(year, Date.now().getFullYear());
	}

	public function getYearBirth(year) {
		return year - MathUtil.randomInteger(20, 50);
	}

	public function getYearDeath(year) {
		return year + MathUtil.randomInteger(1, 20);
	}
}
