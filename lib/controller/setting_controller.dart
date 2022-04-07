import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckdelivery/helper/firebase_auth_helper.dart';
import 'package:truckdelivery/helper/firebase_storage_helper.dart';
import 'package:truckdelivery/helper/firestore_database_helper.dart';
import 'package:truckdelivery/helper/get_storage_helper.dart';
import 'package:truckdelivery/model/order.dart';
import 'package:truckdelivery/model/user_model.dart';
import 'package:truckdelivery/model/user_model2.dart';

class SettingController extends GetxController {
  FirebaseAuthHelper _firebaseAuthHelper = FirebaseAuthHelper.instance;
  GetStorageHelper getStorageHelper=GetStorageHelper.instance;
  FirebaseStorageHelper _firebaseStorageHelper=FirebaseStorageHelper.instance;
  FirestoreDatabaseHelper _firestoreDatabaseHelper=FirestoreDatabaseHelper.instance;
  UserModel? userModel;
  Stream<QuerySnapshot<Map<String, dynamic>>>? _stream;
  List<Order> order=[];
  List<Order> allOrder=[];

  Future<void> logout() async {
    _firebaseAuthHelper.signout();
    getStorageHelper.clear();
  }

  @override
  void onInit() async{
     final user=await getStorageHelper.user();
     if(user==null)return null;
     userModel=user;
     getOrderRequest();
     update();
     notifyChildrens();
    super.onInit();
  }

  Future<void> updateUser(XFile? file) async {
    final previousUser = await getStorageHelper.user();
    if (previousUser == null) throw Exception();
    final imagePath = file != null ? await _firebaseStorageHelper.uploadImage(File(file.path)) : previousUser.image;
    if (imagePath == null) return;

    final updatedUser = previousUser.copyWith(image: imagePath);
    await _firestoreDatabaseHelper.updateUser(updatedUser);
    await getStorageHelper.storeUser(updatedUser);
    final user=await getStorageHelper.user();
    if(user==null)return null;
    userModel=user;
    update();
  }

  Future getOrderRequest() async {
    final user = await getStorageHelper.user();
    if (user == null) return null;
    allOrder = await _firestoreDatabaseHelper.getOrderRequest(user.id);
    print('alllllllllllllorder=?$allOrder');
    update();
    notifyChildrens();
  }

  Future getOrders(String orderId) async {
    final user = await getStorageHelper.user();
    if (user == null) return;
    _stream = null;
    _stream =  _firestoreDatabaseHelper.getOrders(user.id,orderId);
    _stream?.listen((event) async {
      final documentReferences = event.docChanges;

      final orders = <String, Order>{};
      for (final data in documentReferences) {
        if (orders[data.doc.id] != null) continue;
        UserModelRider? userModel = await _firestoreDatabaseHelper.getRider(data.doc.data()!['creator_id']);
        if (userModel != null) {
          final orderss = Order.fromJson(data.doc.data()!, data.doc.id, userModel);
          orders[data.doc.id] = orderss;
        } else {
          final orderss = Order.fromJson(data.doc.data()!, data.doc.id,UserModelRider.fromJson({'id': ''}));
          orders[data.doc.id] = orderss;
        }
      }
      final orderValue=orders.values.toList();
      // order.clear();
      order.isEmpty ? order.addAll(orderValue) : order.insertAll(0, orderValue);
      print('parcels');
      print(order);
      update();
      notifyChildrens();
      print('parcels');
      print(order);
    }, onError: (e,s) {
      print(e);
      print(s);
      print("onError");
    });
  }
  void orderStatusUpdate(String orderId, orderValue) {
    _firestoreDatabaseHelper.updateOrderStatus(orderId, orderValue);
  }
  void orderStatusCancel(String orderId) {
    _firestoreDatabaseHelper.updateOrderCancel(orderId);
  }


  Future<void> updateOrderRequest(String id) async {
    _firestoreDatabaseHelper.updateOrder(id);
  }

  Future<void> updateReviews(String id,num reviews,num totalCount) async {
    _firestoreDatabaseHelper.updateReviews(id,reviews,totalCount);
  }
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
