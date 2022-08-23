package rebidd;

class Property {
	public static function details():Dynamic {
		return {
			"id": 1,
			"minimumRent": "100 Euros",
			"capPrice": "1000 Euros",
			"tenants": "Currently tenanted",
			"contractDuration": "1 Month",
			"type": "Apartment",
			"streetAddress": "123 Fjord Avenue",
			"zipcode": "15252",
			"city": "Amsterdam",
			"state": "Norther",
			"location": "On a quiet road",
			"description": "Beautiful townhouse"
		};
	}

	public static function features():Dynamic {
		return {
			"id": 1,
			"livingArea": "53",
			"plotArea": "23",
			"noOfRooms": "5",
			"noOfFloors": "3",
			"noOfBedrooms": "2",
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
		return {
			"id": 1,
			"propertyImages": [
				{
					"id": 1,
					"fileObjectMetadata": {
						"fileId": 1,
						"fileName": "image.jpg",
						"contentType": "image/jpeg",
						"contentDisposition": "attachment; filename=image.jpg;",
						"fileBytes": "string"
					}
				}
			],
			"videoLink": "www.youtube.com/video/69"
		};
	}

	public static function documents():Dynamic {
		return {
			"id": 1,
			"propertyFiles": [
				{
					"id": 1,
					"fileObjectMetadata": {
						"fileId": 1,
						"fileName": "image.jpg",
						"contentType": "image/jpeg",
						"contentDisposition": "attachment; filename=image.jpg;",
						"fileBytes": "string"
					},
					"documentType": "Check in report"
				}
			]
		};
	}
}
