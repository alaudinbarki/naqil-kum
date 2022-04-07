class UserModelRider {
  final String id,
      firstName,
      lastName,
      email,
      phone,
      type,
      yourImage,
      carFrontImage,
      carBackImage,
      idImage,
      licenseImage,
      idNumber,
      serviceType,
      nationality,
      age;
  final bool gender, online;
  final num reviews, totalCount;

  UserModelRider(
      {required this.firstName,
      required this.lastName,
      required this.id,
      required this.type,
      required this.email,
      required this.yourImage,
      required this.carBackImage,
      required this.carFrontImage,
      required this.idImage,
      required this.licenseImage,
      required this.age,
      required this.serviceType,
      required this.online,
      required this.nationality,
      required this.idNumber,
      required this.reviews,
      required this.totalCount,
      required this.phone,
      required this.gender});

  factory UserModelRider.fromJson(Map<String, dynamic> json) {
    final firstName = json['first_name'];
    final lastName = json['last_name'];
    final email = json['email'];
    final yourImage = json['your_image'];
    final carBackImage = json['car_back_image'];
    final carFrontImage = json['car_front_image'];
    final idImage = json['id_image'];
    final licenseImage = json['license_image'];
    final age = json['age'];
    final online = json.containsKey('online') ? json['online'] : false;
    final serviceType = json['service_Type'];
    final nationality = json['nationality'];
    final idNumber = json['id_number'];
    final id = json['id'];
    final type = json.containsKey('type') ? json['type'] : '';
    final reviews = json.containsKey('reviews') ? json['reviews'] : 0;
    final totalCount = json.containsKey('totalCount') ? json['totalCount'] : 0;
    final gender = json['gender'];
    final phone = json['phone'];

    return UserModelRider(
        firstName: firstName,
        lastName: lastName,
        id: id,
        email: email,
        yourImage: yourImage,
        phone: phone,
        gender: gender,
        type: type,
        age: age,
        reviews: reviews,
        totalCount: totalCount,
        carBackImage: carBackImage,
        carFrontImage: carFrontImage,
        idImage: idImage,
        idNumber: idNumber,
        online: online,
        licenseImage: licenseImage,
        nationality: nationality,
        serviceType: serviceType);
  }

  UserModelRider copyWith(
          {String? id,
          String? name,
          String? image,
          String? yourImage,
          String? carBackImage,
          String? carFrontImage,
          String? idImage,
          String? idNumber,
          String? age,
          String? nationality,
          String? firstName,
          String? lastName,
          bool? online,
          bool? gender,
          String? serviceType,
          String? phone,
          num? reviews,
          num? totalCount,
          String? licenseImage}) =>
      UserModelRider(
          type: type,
          yourImage: yourImage ?? this.yourImage,
          age: age ?? this.age,
          totalCount: totalCount ?? this.totalCount,
          reviews: reviews ?? this.reviews,
          carBackImage: carBackImage ?? this.carBackImage,
          carFrontImage: carFrontImage ?? this.carFrontImage,
          idImage: idImage ?? this.idImage,
          idNumber: idNumber ?? this.idNumber,
          licenseImage: licenseImage ?? this.licenseImage,
          nationality: nationality ?? this.nationality,
          serviceType: serviceType ?? this.serviceType,
          id: id ?? this.id,
          online: online ?? this.online,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          gender: gender ?? this.gender,
          phone: phone ?? this.phone,
          email: email);

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'age': age,
        'email': email,
        'id_number': idNumber,
        'your_image': yourImage,
        'car_back_image': carBackImage,
        'car_front_image': carFrontImage,
        'id_image': idImage,
        'license_image': licenseImage,
        'nationality': nationality,
        'phone': phone,
        'type': type,
        'reviews': reviews,
        'totalCount': totalCount,
        'gender': gender,
        'online': online,
        'service_Type': serviceType,
      };
}
