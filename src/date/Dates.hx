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

	function getYear(period) {
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
