class Profiles {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String password;
  final String phone;
  final String role;
  final String description;
  final String imageUrl;
  final String birthdayDate;

  Profiles({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.phone,
    required this.role,
    required this.description,
    required this.imageUrl,
    required this.birthdayDate,
  });

  Profiles.fromJson(Map<String, dynamic> json)
      : this(id : json['id'],
        firstName : json['firstName'],
        lastName : json['lastName'],
        userName : json['userName'],
        password : json['password'],
        phone : json['phone'],
        role : json['role'],
        description : json['description'],
        imageUrl : json['imageUrl'],
        birthdayDate : json['birthdayDate']);

        
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'phone': phone,
      'role': role,
      'description': description,
      'imageUrl': imageUrl,
      'birthdayDate': birthdayDate,
    };
  }


}
