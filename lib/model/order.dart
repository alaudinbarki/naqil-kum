import 'package:truckdelivery/model/user_model.dart';
import 'package:truckdelivery/model/user_model2.dart';

class Order {
  final UserModelRider creatorId;
  final String id;
  final String orderId;
  final UserModel userId;
  final String prize;
  final bool completed;
  final bool cancel;
  final num lat;
  final num long;
  final num pickLocationLat;
  final num pickLocationLong;
  final num dropLocationLat;
  final num dropLocationLong;
  final bool status;
  final String orderStatus;

  Order(
      {required this.creatorId,
      required this.id,
      required this.orderId,
      required this.userId,
      required this.prize,
      required this.lat,
      required this.long,
      required this.cancel,
      required this.completed,
      required this.pickLocationLat,
      required this.pickLocationLong,
      required this.dropLocationLat,
      required this.dropLocationLong,
      required this.status,
      required this.orderStatus});

  Order.initial({
    required creatorId,
    required orderId,
    required userId,
    required lat,
    required long,
    required pickLocationLat,
    required pickLocationLong,
    required dropLocationLat,
    required dropLocationLong,
    required prize,
  }) : this(
          creatorId: UserModelRider.fromJson({'id': creatorId}),
          orderId: orderId,
          userId: userId,
          prize: prize,
          lat: lat,
          long: long,
          completed: false,
          cancel: false,
          pickLocationLat: pickLocationLat,
          pickLocationLong: pickLocationLong,
          dropLocationLat: dropLocationLat,
          dropLocationLong: dropLocationLong,
          status: false,
          orderStatus: 'موقع الإستلام',
          id: '',
        );

  factory Order.fromJson(Map<String, dynamic> json, String id, UserModelRider creatorId) {
    final orderId = json['order_id'];
    final userId = UserModel.fromJson({'id': json['user_id']});
    final prize = json['prize'];
    final lat = json.containsKey('lat') ? json['lat'] : 0;
    final long = json.containsKey('long') ? json['long'] : 0;
    final completed = json.containsKey('completed') ? json['completed'] : false;
    final cancel = json.containsKey('cancel') ? json['cancel'] : false;
    final pickLocationLat = json.containsKey('pick_location_lat') ? json['pick_location_lat'] : 0;
    final pickLocationLong = json.containsKey('pick_location_long') ? json['pick_location_long'] : 0;
    final dropLocationLat = json.containsKey('drop_location_lat') ? json['drop_location_lat'] : 0;
    final dropLocationLong = json.containsKey('drop_location_long') ? json['drop_location_long'] : 0;
    final status = json.containsKey('status') ? json['status'] : '';
    final orderStatus = json.containsKey('order_status') ? json['order_status'] : '';

    return Order(
      creatorId: creatorId,
      orderId: orderId,
      userId: userId,
      status: status,
      lat: lat,
      cancel: cancel,
      long: long,
      completed: completed,
      pickLocationLat: pickLocationLat,
      pickLocationLong: pickLocationLong,
      dropLocationLat: dropLocationLat,
      dropLocationLong: dropLocationLong,
      orderStatus: orderStatus,
      prize: prize,
      id: id,
    );
  }

  Order copyWith({String? id, bool? status, bool? completed, bool? cancel}) => Order(
        creatorId: creatorId,
        orderId: orderId,
        userId: userId,
        prize: prize,
        lat: lat,
        cancel: cancel ?? this.cancel,
        long: long,
        completed: completed ?? this.completed,
        pickLocationLat: pickLocationLat,
        pickLocationLong: pickLocationLong,
        dropLocationLat: dropLocationLat,
        dropLocationLong: dropLocationLong,
        status: status ?? this.status,
        orderStatus: orderStatus,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => {
        'creator_id': creatorId.id,
        'user_id': userId.id,
        'order_id': orderId,
        'prize': prize,
        'lat': lat,
        'long': long,
        'cancel': cancel,
        'completed': completed,
        'pick_location_lat': pickLocationLat,
        'pick_location_long': pickLocationLong,
        'drop_location_lat': dropLocationLat,
        'drop_location_long': dropLocationLong,
        'order_status': orderStatus,
        'status': status
      };
}
