package address;

/**
	- [ ] zipCode
	- [ ] zipCodeByState
	- [x] city
	- [ ] cityPrefix
	- [ ] citySuffix
	- [ ] streetName
	- [ ] streetAddress
	- [ ] streetSuffix
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

	public function city():String {
		return address.City.get();
	}

	public function country():String {
		return address.Country.get();
	}
}
