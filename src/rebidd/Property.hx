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

	public static function details(id:String, title:String):Dynamic {
		return {
			"id": id,
			"minimumRent": ${MathUtil.randomInteger(100, 300)},
			"capPrice": ${MathUtil.randomInteger(100, 1000)},
			"tenants": "*Currently tenanted",
			"contractDuration": '${MathUtil.randomInteger(1, 12)} Month',
			"type": typeArr[Math.floor(Math.random() * typeArr.length)],
			"streetAddress": "*123 Fjord Avenue",
			"zipcode": "*15252",
			"city": "*Amsterdam",
			"state": "*Norther",
			"country": "*Netherlands",
			"availableFromDate": "2022-08-28",
			"location": locationArr[Math.floor(Math.random() * locationArr.length)],
			"description": new Lorem().description(20)
		};
	}

	public static function features(id:String):Dynamic {
		return {
			"id": id,
			"livingArea": '${MathUtil.randomInteger(20, 100)}',
			"plotArea": '${MathUtil.randomInteger(100, 200)}',
			"noOfRooms": '${MathUtil.randomInteger(1, 5)}',
			"noOfFloors": '${MathUtil.randomInteger(1, 3)}',
			"noOfBedrooms": '${MathUtil.randomInteger(1, 3)}',
			"noOfBathrooms": '${MathUtil.randomInteger(1, 3)}',
			"constructionType": "Existing Building",
			"constructionYear": "1906-1930",
			"finalRentalAmount": '${MathUtil.randomInteger(1000, 3000)}',
			"depositAmount": "*1 x Monthly Rent",
			"minimumIncomePerYear": '${MathUtil.randomInteger(1000, 3000)}',
			"serviceCharge": '${MathUtil.randomInteger(100, 300)}',
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
