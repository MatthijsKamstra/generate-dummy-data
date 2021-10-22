# Generate dummy data

![](icon.png)

To test websites and applications you need data.

I'm to impatient to wait for the data base to be filled with "real" data.

To prevent waiting I created so files to work with

This is a [Haxe](http://www.haxe.org) project, read more about it in the [README_HAXE.MD](README_HAXE.MD)!

## example

Create a 1000 dummy companies in a `.csv`

```haxe
var csv = 'Bedrijfsnaam;Adres;Postcode;Woonplaats;Website\n';
for (i in 0...1000) {
	var obj = new Company().obj();
	csv += '${obj.name};${obj.address};${obj.zipcode};${obj.city};${obj.website}\n';
}
DummyData.saveTextFile(csv, "export/advisors.csv");
```

## goal is a smaller Haxe version of Faker

- https://github.com/marak/Faker.js/

```

```
