package address;

/**
	- [x] zipCode
	- [ ] zipCodeByState
	- [x] city
	- [ ] cityPrefix
	- [ ] citySuffix
	- [x] streetName
	- [x] streetAddress
	- [x] streetSuffix
	- [ ] streetPrefix
	- [ ] secondaryAddress
	- [ ] county
	- [x] country
	- [ ] countryCode
	- [ ] state
	- [ ] stateAbbr
	- [ ] latitude
	- [ ] longitude
	- [ ] direction
	- [ ] cardinalDirection
	- [ ] ordinalDirection
	- [ ] nearbyGPSCoordinate
	- [ ] timeZone
 */
class Address {
	public function new() {}

	/**
	 * use lorum for streetname, add park/gracht
	 * @return String
	 */
	public function streetName():String {
		return address.StreetName.get();
	}

	/**
	 * use lorum for streetname, add park/gracht and a number between 0/500
	 * @return String
	 */
	public function streetAddress():String {
		return address.StreetAddress.get();
	}

	/**
	 * example park/gracht
	 * @return String
	 */
	public function streetSuffix():String {
		return address.StreetSuffix.get();
	}

	/**
	 * international citioes
	 * @return String
	 */
	public function city():String {
		return address.City.get();
	}

	/**
	 * dutch zipcode
	 *
	 * @example
	 * 			`1234 DH`
	 *
	 * @return String
	 */
	public function zipcode():String {
		return address.Zipcode.get();
	}

	public function country():String {
		return address.Country.get();
	}
}
