package company;

import internet.Internet;
import address.StreetAddress;
import address.Zipcode;
import address.Address;
import address.NLCity;
import name.LastName;
import name.Name;

/**


	company

	- [x] suffixes
	- [x] companyName
	- [x] companySuffix
	- [ ] catchPhrase
	- [ ] bs
	- [ ] catchPhraseAdjective
	- [ ] catchPhraseDescriptor
	- [ ] catchPhraseNoun
	- [ ] bsAdjective
	- [ ] bsBuzz
	- [ ] bsNoun


 */
class Company {
	public function new() {}

	public function suffix():String {
		return company.Suffix.get();
	}

	public function companyName():String {
		return name();
	}

	public function name():String {
		return LastName.get();
	}

	public function city(locales:String = 'nl'):String {
		var v = address.City.get();
		switch (locales) {
			case 'nl':
				var v = address.NLCity.get();
		}
		return v;
	}

	public function hypotheek():CompanyObj {
		var _name = LastName.get();
		var _suffix = company.Suffix.get();
		var hypoPreffixArr = [
			'Hypotheker',
			'Hypotheekshop',
			'Hypotheek Visie',
			'Assurantie Beheer',
			'Financieel Adviesbureau'
		];
		var hypoPreffix = hypoPreffixArr[Std.random(hypoPreffixArr.length)];
		var hypoSuffixArr = [
			'Financiele Dienstverlening', 'Finance Groep', 'Krediet', 'Financiën Services', 'Advies', 'Consultancy', 'Verzekeringsgroep', 'Invest',
			'Financial Coaching', 'Advies en Bemiddeling', 'All-In', ' Financiele Planning', 'Adviesgroep'
		];
		var hypoSuffix = hypoSuffixArr[Std.random(hypoSuffixArr.length)];

		var _companyname = '${_name} ${_suffix}';
		var r = Std.random(6);
		switch (r) {
			case 0:
				_companyname = '${_name} ${_suffix}';
			case 1:
				_companyname = '${_name} ${hypoSuffix} ${_suffix}';
			case 2:
				_companyname = '${hypoPreffix} ${_name} ${_suffix}';
			case 3:
				_companyname = '${hypoPreffix} ${_name}';
			case 5:
				_companyname = '${hypoPreffix} ${_name} ${hypoSuffix} ${_suffix}';
			default:
				_companyname = '${_name} ${_suffix}';
		}

		return {
			suffix: _suffix,
			name: _companyname,
			address: StreetAddress.get(),
			zipcode: Zipcode.get(),
			city: NLCity.get(),
			website: new Internet().url(_companyname),
		};
	}

	/**
	 * @example
	 * 			var _obj = new Company().obj();
	 * @return CompanyObj
	 */
	public function obj():CompanyObj {
		var _name = LastName.get();
		var _suffix = company.Suffix.get();
		var _companyname = '${_name} ${_suffix}';
		return {
			suffix: _suffix,
			name: _companyname,
			address: StreetAddress.get(),
			zipcode: Zipcode.get(),
			city: NLCity.get(),
			website: new Internet().url(_companyname),
		};
	}
}

typedef CompanyObj = {
	var suffix:String;
	var name:String;
	var address:String;
	var zipcode:String;
	var city:String;
	var website:String;
}
