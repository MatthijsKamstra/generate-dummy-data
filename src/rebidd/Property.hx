package rebidd;

import utils.MathUtil;
import lorem.Lorem;

class Property {
	static var typeArr = ['Apartment', 'Storage', 'House', 'Studio', 'Retail space'];
	static var locationArr = [
		'At the edge of the forest', 'On a busy road', 'Near a park', 'On a quiet road', 'On a fairway', 'By water', 'Sheltered location',
		'Outside a developed area', 'In a wooded area', 'In the center', 'In a residential area', 'Rural location', 'Open area location'
	];
	static var imageArr = [
		"https://picsum.photos/id/10/300/200?index=1",
		"https://picsum.photos/id/1002/300/200?index=2",
		"https://picsum.photos/id/101/300/200?index=3",
		"https://picsum.photos/id/1016/300/200?index=4",
		"https://picsum.photos/id/1023/300/200?index=5",
		"https://picsum.photos/id/1031/300/200?index=6",
		"https://picsum.photos/id/1059/300/200?index=7"
	];

	public static function details():Dynamic {
		return {
			"id": 1,
			"minimumRent": '${MathUtil.randomInteger(100, 300)} Euros',
			"capPrice": '${MathUtil.randomInteger(100, 1000)} Euros',
			"tenants": "Currently tenanted",
			"contractDuration": '${MathUtil.randomInteger(1, 12)} Month',
			"type": typeArr[Math.floor(Math.random() * typeArr.length)],
			"streetAddress": "123 Fjord Avenue",
			"zipcode": "15252",
			"city": "Amsterdam",
			"state": "Norther",
			"location": locationArr[Math.floor(Math.random() * locationArr.length)],
			"description": new Lorem().description(4)
		};
	}

	public static function features():Dynamic {
		return {
			"id": 1,
			"livingArea": ${MathUtil.randomInteger(20, 100)},
			"plotArea": ${MathUtil.randomInteger(100, 200)},
			"noOfRooms": ${MathUtil.randomInteger(1, 5)},
			"noOfFloors": ${MathUtil.randomInteger(1, 3)},
			"noOfBedrooms": ${MathUtil.randomInteger(1, 3)},
			"noOfBathrooms": "4",
			"constructionType": "Existing Building",
			"constructionYear": "1906-1930",
			"finalRentalAmount": "1000 Euros",
			"depositAmount": "1 x Monthly Rent",
			"minimumIncomePerYear": "43000 Euros",
			"serviceCharge": "200 Cows",
			"televisionAndInternet": "Included",
			"utilities": "Included",
			"bathroomAmenities": "Double sinks, Bathtub",
			"separateToilet": "Yes",
			"outdoorSpace": "French balcony",
			"houseShare": "Allowed",
			"furnishings": "Not furnished",
			"garage": "Yes",
			"outdoorStorage": "Yes",
			"energyLabel": "A-label",
			"parkingType": "Own parking spot",
			"smoking": "Allowed",
			"pets": "Allowed"
		};
	}

	public static function media():Dynamic {
		var random = MathUtil.randomInteger(1, imageArr.length);
		var arr = [];
		for (i in 0...random) {
			var tag = {
				"id": i + 1,
				"_url": imageArr[i],
				"fileObjectMetadata": {
					"fileId": 1,
					"fileName": "image.jpg",
					"contentType": "image/jpeg",
					"contentDisposition": "attachment; filename=image.jpg;",
					"fileBytes": "string"
				}
			};
			arr.push(tag);
		}

		return {
			"id": 1,
			"propertyImages": arr,
			"videoLink": "www.youtube.com/video/69"
		};
	}

	public static function documents():Dynamic {
		var random = MathUtil.randomInteger(1, imageArr.length);
		var arr = [];
		for (i in 0...random) {
			var tag = {
				"id": i + 1,
				"_url": imageArr[i],
				"fileObjectMetadata": {
					"fileId": 1,
					"fileName": "image.jpg",
					"contentType": "image/jpeg",
					"contentDisposition": "attachment; filename=image.jpg;",
					"fileBytes": "string"
				},
				"documentType": "Check in report"
			};
			arr.push(tag);
		}
		return {
			"id": 1,
			"propertyFiles": arr
		};
	}
}
