class RegisterModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final int age;
  final String cityName;
  final String countryName;

  RegisterModel({
    required this.email,
    required this.password,
    required this.firstName, 
    required this.lastName,
    required this.age,
    required this.cityName,
    required this.countryName, 
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      cityName: json['cityName'],
      countryName: json['countryName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'cityName': cityName,
      'countryName': countryName,
    };
  }
}