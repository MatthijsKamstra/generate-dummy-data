package name;

class FirstName {
	public static var maleNLArr = [
		'Noah', 'Daan', 'Lucas', 'Levi', 'Sem', 'Finn', 'Liam', 'James', 'Milan', 'Luuk', 'Bram', 'Noud', 'Sam', 'Mees', 'Jesse', 'Adam', 'Max', 'Thomas',
		'Benjamin', 'Boaz', 'Julian', 'Mason', 'Siem', 'Luca', 'Lars', 'Gijs', 'Mats', 'Hugo', 'Teun', 'David', 'Jack', 'Stijn', 'Thijs', 'Guus', 'Olivier',
		'Ruben', 'Dex', 'Vince', 'Jens', 'Jan', 'Joep', 'Daniël', 'Ties', 'Cas', 'Morris', 'Sven', 'Jayden', 'Abel', 'Floris', 'Tobias', 'Ryan', 'Owen',
		'Tom', 'Fedde', 'Otis', 'Jaxx', 'Willem', 'Tim', 'Tijn', 'Jax', 'Jace', 'Pim', 'Quinn', 'Pepijn', 'Jason', 'Senn', 'Boris', 'Jurre', 'Xavi', 'Amir',
		'Zayn', 'Samuel', 'Hidde', 'Mohamed', 'Alexander', 'Oliver', 'Nathan', 'Dani', 'Mohammed', 'Mick', 'Roan', 'Kai', 'Stan', 'Jake', 'Tygo', 'Lenn',
		'Niek', 'Dean', 'Joshua', 'Aiden', 'Rayan', 'Pieter', 'Sepp', 'Duuk', 'Casper', 'Oscar', 'Ezra', 'Elias', 'Job', 'Felix'
	];

	public static var femaleNLArr = [
		'Emma', 'Mila', 'Sophie', 'Zoë', 'Julia', 'Tess', 'Sara', 'Anna', 'Evi', 'Saar', 'Nora', 'Lieke', 'Olivia', 'Yara', 'Liv', 'Noor', 'Eva', 'Lotte',
		'Lauren', 'Milou', 'Sofie', 'Maud', 'Nina', 'Nova', 'Sarah', 'Lynn', 'Fleur', 'Elin', 'Fenna', 'Isa', 'Emily', 'Roos', 'Hannah', 'Loïs', 'Sofia',
		'Mia', 'Lina', 'Ella', 'Noa', 'Esmee', 'Lisa', 'Julie', 'Vera', 'Bo', 'Hailey', 'Sophia', 'Amy', 'Luna', 'Isabella', 'Fien', 'Lara', 'Norah', 'Maria',
		'Elena', 'Liz', 'Jasmijn', 'Feline', 'Ivy', 'Lena', 'Kiki', 'Charlotte', 'Cato', 'Anne', 'Merel', 'Veerle', 'Suze', 'Amber', 'Floor', 'Hanna', 'Jill',
		'Juul', 'Liva', 'Lizzy', 'Naomi', 'Lily', 'Amira', 'Rosa', 'Lize', 'Puck', 'Isabel', 'Linde', 'Fenne', 'Fay', 'Sanne', 'Suus', 'Rosalie', 'Livia',
		'Charlie', 'Femke', 'Johanna', 'Chloë', 'Evy', 'Sam', 'Eline', 'Elise', 'Inaya', 'Tessa', 'Philou', 'Iris', 'Laura'
	];

	public static function get():String {
		var arr:Array<String> = [
			"Elina", "Martin", "Lowell", "Corazon", "Diedre", "Slyvia", "Latrice", "Chantell", "Jeff", "Zulma", "Deonna", "Kortney", "Sunshine", "Alysa",
			"Zane", "Shaina", "Queenie", "Ingeborg", "Jarrod", "Angle"
		];
		return arr[Std.random(arr.length)];
	}

	public static function male():String {
		return return maleNLArr[Std.random(maleNLArr.length)];
	}

	public static function female():String {
		return return femaleNLArr[Std.random(femaleNLArr.length)];
	}
}
