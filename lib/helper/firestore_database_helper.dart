import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truckdelivery/model/car_rent.dart';
import 'package:truckdelivery/model/chat.dart';
import 'package:truckdelivery/model/furniture.dart';
import 'package:truckdelivery/model/order.dart';
import 'package:truckdelivery/model/parcel.dart';
import 'package:truckdelivery/model/user_model.dart';
import 'package:truckdelivery/model/user_model2.dart';

class FirestoreDatabaseHelper {
  static final FirestoreDatabaseHelper instance = FirestoreDatabaseHelper._internal();
  static const String _USER = 'user';
  static const String _PARCEL ='parcel';
  static const String _FURNITURE= 'furniture';
  static const String _RENT_CAR='rent_car';
  static const String _ORDER = 'order';
  static const String USER_RIDER = 'service_provider';
  static const String _CHAT='chat';

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirestoreDatabaseHelper._internal() {
    _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
  }

  final _timeoutDuration = const Duration(seconds: 15);

  Future<UserModel?> addUser(UserModel user) async {
    print('add user');
      await _firebaseFirestore.collection(_USER).doc(user.id).set(user.toJson()).timeout(_timeoutDuration);
      return user.copyWith(id: user.id);
    }

  Future<void> sendMessage(Chat chat) =>
      _firebaseFirestore.collection(_CHAT).add(chat.toJson(FieldValue.serverTimestamp())).timeout(_timeoutDuration);


  Future<UserModelRider?> getRider(String id) async {
    final documentReference = await _firebaseFirestore.collection(USER_RIDER).doc(id).get().timeout(_timeoutDuration);
    if (documentReference.data() == null) return null;
    return UserModelRider.fromJson(documentReference.data()!);
  }
  Future<List<Order>> getOrderRequest(String userId) async {
    print('userID==>$userId');
    final documentReferences = await Future.wait([
      _firebaseFirestore.collection(_ORDER).
      where('user_id', isEqualTo: userId).
      where('completed', isEqualTo: true).
      get(const GetOptions(source: Source.server)).timeout(_timeoutDuration),
    ]);

    print('document reference===>${documentReferences.first}');

    final order = <String, Order>{};
    for (final querySnapshot in documentReferences) {
      for (final data in querySnapshot.docs) {
        if (order[data.id] != null) continue;
        UserModelRider? userModel = await getRider(data.data()['creator_id']);
        if (userModel != null) {
          final orders = Order.fromJson(data.data(), data.id, userModel);
          order[data.id] = orders;
        } else {
          final orders = Order.fromJson(data.data(), data.id, UserModelRider.fromJson({'id': ''}));
          order[data.id] = orders;
        }
      }
    }
    return order.values.toList();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrders(String userId,String orderId) {
    print('get my orderssssssssssssss');
    return _firebaseFirestore
        .collection(_ORDER)
        .where('user_id', isEqualTo: userId)
        .where('order_id',isEqualTo: orderId)
        .snapshots();
  }
  Future<void> updateOrderStatus(String orderId,String orderValue) =>
      _firebaseFirestore.collection(_ORDER).doc(orderId).update({'order_status': orderValue}).timeout(_timeoutDuration);
  Stream<QuerySnapshot<Map<String, dynamic>>> myMessage(String chatId) => _firebaseFirestore
      .collection(_CHAT)
      .where('chat_id', isEqualTo: chatId)
      .orderBy('time_stamp', descending: true)
      .snapshots();

  Future<UserModel?> getUser(String id) async {
      final documentReference = await _firebaseFirestore.collection(_USER).doc(id).get().timeout(_timeoutDuration);
      if (documentReference.data() == null) return null;
      return UserModel.fromJson(documentReference.data()!);
  }

  Future<Order?> getSingleOrderRequest(String id) async {
    final documentReference = await _firebaseFirestore.collection(_ORDER).doc(id).get().timeout(_timeoutDuration);
    if (documentReference.data() == null) return null;
    return Order.fromJson(documentReference.data()!,id, UserModelRider.fromJson({id:''}));
  }

  Future<Parcel> addParcel(Parcel parcel) async {
    final documentReference = await _firebaseFirestore.collection(_PARCEL).add(parcel.toJson()).timeout(_timeoutDuration);
    return parcel.copyWith(id: documentReference.id);
  }
  Future<void> updateOrderCancel(String orderId) =>
      _firebaseFirestore.collection(_ORDER).doc(orderId).update({'cancel': true}).timeout(_timeoutDuration);

  Future<Furniture> addFurniture(Furniture furniture) async {
    final documentReference = await _firebaseFirestore.collection(_FURNITURE).add(furniture.toJson()).timeout(_timeoutDuration);
    return furniture.copyWith(id: documentReference.id);
  }
  Future<RentCar> addRentCar(RentCar rentCar) async {
    final documentReference = await _firebaseFirestore.collection(_RENT_CAR).add(rentCar.toJson()).timeout(_timeoutDuration);
    return rentCar.copyWith(id: documentReference.id);
  }
  Future<void> updateOrder(String id) =>
      _firebaseFirestore.collection(_ORDER).doc(id).update({'status':true}).timeout(_timeoutDuration);

  Future<void> updateReviews(String id,num reviews,num totalNumber) =>
      _firebaseFirestore.collection(USER_RIDER).doc(id).update({'reviews':reviews,'totalCount':totalNumber}).timeout(_timeoutDuration);

  Future<void> updateUser(UserModel user) =>
      _firebaseFirestore.collection(_USER).doc(user.id).update(user.toJson()).timeout(_timeoutDuration);
}
