package date;

import utils.Util;

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
		return Util.randomInteger(period.start, period.end);
	}

	function getYearPurchase(year) {
		return Util.randomInteger(year, Date.now().getFullYear());
	}

	function getYearBirth(year) {
		return year - Util.randomInteger(20, 50);
	}

	function getYearDeath(year) {
		return year + Util.randomInteger(1, 20);
	}
}
