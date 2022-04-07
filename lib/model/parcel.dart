import 'package:cloud_firestore/cloud_firestore.dart';

class Parcel {
  final String creatorId;
  final String id;
  final num pickLocationLat;
  final num pickLocationLong;
  final num dropLocationLat;
  final num dropLocationLong;
  final String dropAddress;
  final String pickAddress;
  final String coupon;
  final String mobileNumber;
  final String paymentMethod;
  final num amount;
  final bool status;
  final bool isParseOutCity;

  Parcel(
      {required this.creatorId,
      required this.pickLocationLat,
      required this.pickLocationLong,
      required this.dropLocationLat,
      required this.dropLocationLong,
      required this.dropAddress,
        required this.pickAddress,
      required this.mobileNumber,
      required this.coupon,
      required this.id,
      required this.amount,
      required this.status,
      required this.paymentMethod,
      required this.isParseOutCity,
    });

  Parcel.initial(
      {required creatorId,
      required pickLocationLat,
      required pickLocationLong,
      required dropLocationLat,
      required dropLocationLong,
      required dropAddress,
      required coupon,
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
            amount: amount,
            id: '',
            status: false,
            coupon: coupon,
            paymentMethod: paymentMethod,
            pickAddress: pickAddress);

  factory Parcel.fromJson(Map<String, dynamic> json, String id) {
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
    final coupon = json['coupon'];
    final mobileNumber = json['mobile_number'];
    return Parcel(
        creatorId: creatorId,
        pickLocationLat: pickLocationLat,
        pickLocationLong: pickLocationLong,
        dropLocationLat: dropLocationLat,
        dropLocationLong: dropLocationLong,
        dropAddress: dropAddress,
        isParseOutCity: isParseOutCity,
        amount: amount,
        id: id,
        status: status,
        coupon: coupon,
        mobileNumber: mobileNumber,
        paymentMethod: paymentMethod,
        pickAddress: pickAddress);
  }

  Parcel copyWith({String? id}) => Parcel(
      creatorId: creatorId,
      pickLocationLat: pickLocationLat,
      pickLocationLong: pickLocationLong,
      dropLocationLat: dropLocationLat,
      dropLocationLong: dropLocationLong,
      dropAddress: dropAddress,
      mobileNumber: mobileNumber,
      status: status,
      isParseOutCity: isParseOutCity,
      amount: amount,
      id: id ?? this.id,
      coupon: coupon,
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
        'status': status,
        'is_parse_out_city': isParseOutCity,
        'payment_method': paymentMethod,
        'amount': amount,
        'coupon': coupon
      };
}
