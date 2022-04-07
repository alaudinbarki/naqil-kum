class Furniture {
  final String creatorId;
  final String id;
  final num pickLocationLat;
  final num pickLocationLong;
  final num dropLocationLat;
  final num dropLocationLong;
  final String dropAddress;
  final String pickAddress;
  final String description;
  final String pickDropDownValue;
  final String dropDropDownValue;
  final int numberOfPerson;
  final String carTitle;
  final bool status;
  final String mobileNumber;
  final String paymentMethod;
  final num amount;
  final bool isParseOutCity;

  Furniture(
      {required this.creatorId,
      required this.pickLocationLat,
      required this.pickLocationLong,
      required this.dropLocationLat,
      required this.dropLocationLong,
      required this.dropAddress,
      required this.mobileNumber,
      required this.description,
      required this.status,
      required this.carTitle,
      required this.dropDropDownValue,
      required this.pickDropDownValue,
      required this.numberOfPerson,
      required this.id,
      required this.amount,
      required this.paymentMethod,
      required this.isParseOutCity,
      required this.pickAddress});

  Furniture.initial(
      {required creatorId,
      required pickLocationLat,
      required pickLocationLong,
      required dropLocationLat,
      required dropLocationLong,
      required dropAddress,
      required description,
      required carTitle,
      required dropDropDownValue,
      required pickDropDownValue,
      required numberOfPerson,
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
            status: false,
            dropDropDownValue: dropDropDownValue,
            pickDropDownValue: pickDropDownValue,
            numberOfPerson: numberOfPerson,
            amount: amount,
            id: '',
            paymentMethod: paymentMethod,
            pickAddress: pickAddress);

  factory Furniture.fromJson(Map<String, dynamic> json, String id) {
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
    final status = json['status'] ? json['status'] : false;

    final description = json['description'];
    final carTitle = json['car_title'];
    final dropDropDownValue = json['drop_drop_down_value'];
    final pickDropDownValue = json['pick_drop_down_value'];
    final numberOfPerson = json['number_of_person'];
    final mobileNumber = json['mobile_number'];
    return Furniture(
        creatorId: creatorId,
        pickLocationLat: pickLocationLat,
        pickLocationLong: pickLocationLong,
        status: status,
        dropLocationLat: dropLocationLat,
        dropLocationLong: dropLocationLong,
        dropAddress: dropAddress,
        isParseOutCity: isParseOutCity,
        amount: amount,
        id: id,
        description: description,
        carTitle: carTitle,
        dropDropDownValue: dropDropDownValue,
        pickDropDownValue: pickDropDownValue,
        numberOfPerson: numberOfPerson,
        mobileNumber: mobileNumber,
        paymentMethod: paymentMethod,
        pickAddress: pickAddress);
  }

  Furniture copyWith({String? id, bool? status}) => Furniture(
      creatorId: creatorId,
      pickLocationLat: pickLocationLat,
      pickLocationLong: pickLocationLong,
      dropLocationLat: dropLocationLat,
      dropLocationLong: dropLocationLong,
      dropAddress: dropAddress,
      mobileNumber: mobileNumber,
      status: this.status,
      isParseOutCity: isParseOutCity,
      amount: amount,
      id: id ?? this.id,
      description: description,
      carTitle: carTitle,
      dropDropDownValue: dropDropDownValue,
      pickDropDownValue: pickDropDownValue,
      numberOfPerson: numberOfPerson,
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
        'status': status,
        'description': description,
        'car_title': carTitle,
        'drop_drop_down_value': dropDropDownValue,
        'pick_drop_down_value': pickDropDownValue,
        'number_of_person': numberOfPerson,
      };
}
