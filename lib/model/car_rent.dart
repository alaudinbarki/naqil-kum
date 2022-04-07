class RentCar {
  final String creatorId;
  final String id;
  final num pickLocationLat;
  final num pickLocationLong;
  final num dropLocationLat;
  final num dropLocationLong;
  final String dropAddress;
  final String pickAddress;
  final String description;
  final String carImage;
  final String date;
  final String time;
  final bool status;
  final num amountPerKilo;
  final String carTitle;
  final String mobileNumber;
  final String paymentMethod;
  final num amount;
  final bool isParseOutCity;

  RentCar(
      {required this.creatorId,
      required this.pickLocationLat,
      required this.pickLocationLong,
      required this.dropLocationLat,
      required this.dropLocationLong,
      required this.dropAddress,
      required this.mobileNumber,
      required this.description,
      required this.carTitle,
      required this.carImage,
      required this.date,
      required this.status,
      required this.time,
      required this.amountPerKilo,
      required this.id,
      required this.amount,
      required this.paymentMethod,
      required this.isParseOutCity,
      required this.pickAddress});

  RentCar.initial(
      {required creatorId,
      required pickLocationLat,
      required pickLocationLong,
      required dropLocationLat,
      required dropLocationLong,
      required dropAddress,
      required description,
      required carTitle,
      required carImage,
      required date,
      required time,
      required amountPerKilo,
      required mobileNumebr,
      required amount,
      required paymentMethod,
      required isParseOutCity,
      required pickAddress})
      : this(
            creatorId: creatorId,
            mobileNumber: mobileNumebr,
            pickLocationLat: pickLocationLat,
            pickLocationLong: pickLocationLong,
            dropLocationLat: dropLocationLat,
            dropLocationLong: dropLocationLong,
            dropAddress: dropAddress,
            isParseOutCity: isParseOutCity,
            description: description,
            carTitle: carTitle,
            carImage: carImage,
            date: date,
            status: false,
            time: time,
            amountPerKilo: amountPerKilo,
            amount: amount,
            id: '',
            paymentMethod: paymentMethod,
            pickAddress: pickAddress);

  factory RentCar.fromJson(Map<String, dynamic> json, String id) {
    final creatorId = json['creator_id'];
    final pickLocationLat = json['pick_location_lat'];
    final pickLocationLong = json['pick_location_long'];
    final dropLocationLat = json['drop_location_lat'];
    final dropLocationLong = json['drop_location_long'];
    final dropAddress = json['drop_address'];
    final pickAddress = json['pick_address'];
    final isParseOutCity = json['is_parse_out_city'];
    final paymentMethod = json['payment_method'];
    final amount = json['amount'];
    final description = json['description'];
    final status = json['status'] ? json['status'] : false;
    final carTitle = json['car_title'];
    final carImage = json['car_image'];
    final date = json['date'];
    final time = json['time'];
    final amountPerKilo = json['amount_per_kilo'];

    final mobileNumber = json['mobile_number'];
    return RentCar(
        creatorId: creatorId,
        pickLocationLat: pickLocationLat,
        pickLocationLong: pickLocationLong,
        dropLocationLat: dropLocationLat,
        dropLocationLong: dropLocationLong,
        dropAddress: dropAddress,
        isParseOutCity: isParseOutCity,
        amount: amount,
        id: id,
        description: description,
        carTitle: carTitle,
        status: status,
        carImage: carImage,
        amountPerKilo: amountPerKilo,
        date: date,
        time: time,
        mobileNumber: mobileNumber,
        paymentMethod: paymentMethod,
        pickAddress: pickAddress);
  }

  RentCar copyWith({String? id,bool? status}) => RentCar(
      creatorId: creatorId,
      pickLocationLat: pickLocationLat,
      pickLocationLong: pickLocationLong,
      dropLocationLat: dropLocationLat,
      dropLocationLong: dropLocationLong,
      dropAddress: dropAddress,
      mobileNumber: mobileNumber,
      isParseOutCity: isParseOutCity,
      amount: amount,
      status: status??this.status,
      id: id ?? this.id,
      description: description,
      carTitle: carTitle,
      carImage: carImage,
      amountPerKilo: amountPerKilo,
      date: date,
      time: time,
      paymentMethod: paymentMethod,
      pickAddress: pickAddress);

  Map<String, dynamic> toJson() => {
        'creator_id': creatorId,
        'pick_location_lat': pickLocationLat,
        'pick_location_long': pickLocationLong,
        'drop_location_lat': dropLocationLat,
        'drop_location_long': dropLocationLong,
        'drop_address': dropAddress,
        'pick_address': pickAddress,
        'mobile_number': mobileNumber,
        'is_parse_out_city': isParseOutCity,
        'payment_method': paymentMethod,
        'amount': amount,
        'status':status,
        'description': description,
        'car_title': carTitle,
        'date': date,
        'time': time,
        'car_image': carImage,
        'amount_per_kilo': amountPerKilo,
      };
}
