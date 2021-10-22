import address.StreetAddress;
import address.NLCity;
import address.Zipcode;
import company.Company;

class MainCSV {
	public function new() {
		trace('MainCSV');

		generate("export/advisors_00010.csv", 10);
		generate("export/advisors_00100.csv", 100);
		generate("export/advisors_01000.csv", 1000);
		generate("export/advisors_10000.csv", 10000);
	}

	function generate(path:String = "export/advisors.csv", total:Int = 11) {
		/*
			Bedrijfsnaam;Adres;Postcode;Woonplaats;Website
			Intermediair X;Teststraat 101;1234AA;Testplaats;www.intermediairx.nl
			Intermediair X;Teststraat 101;1234AA;Testplaats;www.intermediairx.nl
			;;;;
		 */
		var csv = 'Bedrijfsnaam;Adres;Postcode;Woonplaats;Website\n';

		for (i in 0...total) {
			var obj = new Company().hypotheek();

			var _bedrijfsnaam = obj.name;
			var _adres = obj.address;
			var _postcode = obj.zipcode;
			var _woonplaats = obj.city;
			var _website = obj.website;
			csv += '${_bedrijfsnaam};${_adres};${_postcode};${_woonplaats};${_website}\n';
		}
		// DummyData.saveTextFile(csv, "export/advisors.csv");
		DummyData.saveTextFile(csv, path);
	}

	static public function main() {
		var app = new MainCSV();
	}
}
