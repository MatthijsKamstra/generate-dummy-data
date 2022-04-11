package date;

import utils.MathUtil;

/**
	- [ ] past
	- [ ] future
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
	 * @param days    number of days in the past
	 */
	public function past(days:Int = 1) {
		return Date.now();
	}

	/**
	 * get a date in the future
	 *
	 * @param days    number of days in the past
	 */
	public function future(days:Int = 1) {
		return Date.now();
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

	function getYearPurchase(year) {
		return MathUtil.randomInteger(year, Date.now().getFullYear());
	}

	function getYearBirth(year) {
		return year - MathUtil.randomInteger(20, 50);
	}

	function getYearDeath(year) {
		return year + MathUtil.randomInteger(1, 20);
	}
}
