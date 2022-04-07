class UserModel {
  final String id, firstName, lastName, email, phone, image,type;
  final bool gender;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.id,
        required this.type,
      required this.email,
      required this.image,
      required this.phone,
      required this.gender});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final firstName = json['first_name'];
    final lastName = json['last_name'];
    final email = json['email'];
    final image = json['image'];
    final id = json['id'];
    final type=json.containsKey('type')?json['type']:'';
    final gender = json['gender'];
    final phone = json['phone'];

    return UserModel(firstName: firstName, lastName: lastName, id: id, email: email, image: image, phone: phone, gender: gender,type: type);
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? image
  }) =>
      UserModel(
         type: type, image: image??this.image, id: id ?? this.id, firstName: firstName, lastName: lastName, gender: gender, phone: phone, email: email);

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'email': email,
        'last_name': lastName,
        'image': image,
        'phone': phone,
         'type':type,
        'gender': gender,
        'id': id,
      };
}
