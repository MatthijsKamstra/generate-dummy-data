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

	public function streetName():String {
		return address.StreetName.get();
	}

	public function streetAddress():String {
		return address.StreetAddress.get();
	}

	public function streetSuffix():String {
		return address.StreetSuffix.get();
	}

	public function city():String {
		return address.City.get();
	}

	public function zipcode():String {
		return address.Zipcode.get();
	}

	public function country():String {
		return address.Country.get();
	}
}
