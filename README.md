# Generate dummy data

![](icon.png)

To test websites and applications you need data.

I'm to impatient to wait for the data base to be filled with "real" data.

To prevent waiting I created so I have files to work with.

This is a [Haxe](http://www.haxe.org) project, read more about it in the [README_HAXE.MD](README_HAXE.MD)!

## why reinvent the wheel?

This is probably what a lot of developers do: I have more controle and gives me practical code to do code exercises with.

So why not `faker.js`?

I used faker to get a better idea how it would work...

And now there is this:

- https://www.theverge.com/2022/1/9/22874949/developer-corrupts-open-source-libraries-projects-affected

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
