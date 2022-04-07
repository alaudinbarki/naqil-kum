import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/helper/get_storage_helper.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:truckdelivery/pages/orderRequest.dart';

class PaymentMethod extends StatefulWidget {
  final int isOutCity;
  final String carTitle;

  PaymentMethod({required this.isOutCity, required this.carTitle});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}



class _PaymentMethodState extends State<PaymentMethod> {
  DeliveryController deliveryController = Get.find();
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();
  GetStorageHelper getStorageHelper=GetStorageHelper.instance;
  UserPicUp? userPicUp;
  UserDrop? userDrop;

  @override
  void initState() {
    getPickUp();
    super.initState();
  }

  getPickUp()async{
     userPicUp= await getStorageHelper.getPickUp();
     userDrop= await getStorageHelper.getDrop();
  }
  void _addParcel() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('إضافة طلب ...!');

    final message = await deliveryController.addParcel(
        widget.isOutCity,userPicUp?.pickLocationLat??0,userPicUp?.pickLocationLong??0,userPicUp?.pickAddress??'');
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(MaterialDialogContent.networkError(), () => _addParcel());
      return;
    }
    final snackbar = SnackbarHelper.instance..injectContext(context);
    // if (message.isEmpty) {
    //   snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: message));
    //   return;
    // }
    // snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'تمت إضافة الطلب بنجاح..!'));
    //Navigator.push(context, MaterialPageRoute(builder: (ctx) => BottomApp()));
    // Navigator.pop(context);
    // Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => TimerClass(
                  parcelId: message.id,
                )));

    // Future.delayed(const Duration(milliseconds: 700))
    //     .then((_) => Navigator.pushNamedAndRemoveUntil(context, MainScreen.route, (route) => false));
  }

  void _addFurniture() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('إضافة طلب ...!');
    final message = await deliveryController.addFurniture(
        widget.isOutCity, _dropDownValuePick??'', _dropDownValueDrop??'', widget.carTitle, counter,userPicUp?.pickLocationLat??0,userPicUp?.pickLocationLong??0,userPicUp?.pickAddress??'');
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(MaterialDialogContent.networkError(), () => _addParcel());
      return;
    }
    final snackbar = SnackbarHelper.instance..injectContext(context);
    // if (message.isEmpty) {
    //   snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: message));
    //   return;
    // }
    // snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'تمت إضافة الطلب بنجاح..!'));
    // int count = 0;
    // Navigator.popUntil(context, (_) => count++ == 4);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => TimerClass(
                  parcelId: message.id,
                )));
  }

  List<String> _items = [
    'متجر تجاري',
    'مصنع ',
    'مستودع',
    'الدور الارضي',
    'منزل - الدور الاول',
    'منزل - الدور الثاني',
    'منزل - اعلى من الدور الثالث',
    'خيارت اخرى'
  ];
  String? _dropDownValuePick;
  String? _dropDownValueDrop;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: GetBuilder<DeliveryController>(
          builder: (_deliveryController) => Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset('assets/backButton.png')),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.isOutCity == 0 || widget.isOutCity == 1 ? 'بيانات الطلب ' :
                            widget.isOutCity==7?
                                'لقد كتب لنا هاتفًاأصيل حتى نتمكن من مساعدتك':
                            'بيانات الأثاث',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff28476E),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'مكان استلام الطرد',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff28476E),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${userPicUp?.pickAddress??0}',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                                Expanded(
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff28476E),
                                    radius: 10,
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'مكان تسليم الطرد',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff28476E),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${deliveryController.dropselectedPlace!.formattedAddress}',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                                Expanded(child: Image.asset('assets/location.png')),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(_deliveryController.pickselectedPlace!.geometry!.location.lat,
                                        _deliveryController.pickselectedPlace!.geometry!.location.lng),
                                    zoom: 15),
                                myLocationEnabled: true,
                                tiltGesturesEnabled: true,
                                compassEnabled: true,
                                scrollGesturesEnabled: true,
                                zoomGesturesEnabled: true,
                                onMapCreated: _deliveryController.onMapCreated,
                                markers: Set<Marker>.of(_deliveryController.markers.values),
                                polylines: Set<Polyline>.of(_deliveryController.polylines.values),
                              ),
                              height: 250,
                            ),
                          ),
                          widget.isOutCity == 0 || widget.isOutCity == 1 || widget.isOutCity == 3
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text('تفاصيل الطلب',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: TextField(
                                            controller: deliveryController.orderDetail,
                                            textAlign: TextAlign.right,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: ' أدخل وصف تفاصيل الطلب',
                                                hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text('رقم الهاتف المحمول',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: TextField(
                                            controller: deliveryController.mobileNumber,
                                            textAlign: TextAlign.right,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'أدخل رقم الهاتف المحمول',
                                                hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: widget.isOutCity == 0 || widget.isOutCity == 1
                                ? () {
                                    final snackbar = SnackbarHelper.instance..injectContext(context);
                                    if (deliveryController.orderDetail.text.isEmpty) {
                                      snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء إدخال الوصف..!'));
                                      return;
                                    } else if (deliveryController.mobileNumber.text.isEmpty) {
                                      snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء إدخال الرقم..!'));
                                      return;
                                    }
                                    _showMyDialog();
                                  }
                                : () {
                                    _showBottomSheet(context);
                                  },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xff28476E),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                              child: Center(
                                child: Text(widget.isOutCity == 0 || widget.isOutCity == 1 || widget.isOutCity == 3 ?
                                'تأكيد الطلب' :
                                widget.isOutCity==7?'تأكيد':
                                'وصف الأغراض',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 40,
                child: Center(
                  child: Image.asset('assets/logo.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showMyDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            height: 125,
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              children: [
                Text(
                  'تم ارســال طلبك بنجــاح',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _addParcel();
                    // Navigator.push(context, MaterialPageRoute(builder: (ctx) => Tasfeel()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xff28476E),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Center(
                      child: Text('تأكيد الطلب',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        shape: RoundedRectangleBorder(
          //the rounded corner is created here
          borderRadius: BorderRadius.circular(30.0),
        ),
        //backgroundColor: Colors.white,
        builder: (_) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                          widget.isOutCity==7?
                              'لقد كتب لنا هاتفًا أصيل حتى نتمكن من مساعدتك':
                          'وصف الأغراض',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ),
                    Center(
                      child: Text(
                          widget.carTitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ),
                    Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Colors.blueGrey,
                      child: TextFormField(
                        autofocus: false,
                        maxLines: 4,
                        controller: deliveryController.description,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText:
                                widget.isOutCity=='7'?
                                    'عدد الأليات , الاشتراطات , اخرى':
                                'اكتب وصفا كاملا للأغراض المراد نقلها , مثل أثاث المنزل (ثلاجة , غسالة ملابس , مكيفات هواء ) مع عدد الأغراض , أيضا المنزل في أي طابق',
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white, width: 2.0))),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                   widget.isOutCity==7?
                   SizedBox():
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             padding: EdgeInsets.symmetric(horizontal: 5),
                             decoration: BoxDecoration(
                                 color: Color(0xff99DEF8),
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                             child: DropdownButton(
                                 hint: _dropDownValueDrop == null
                                     ? Text('وصف لموقع الاستلام')
                                     : Text(
                                   _dropDownValueDrop!,
                                   style: TextStyle(color: Colors.black),
                                 ),
                                 isExpanded: false,
                                 underline: DropdownButtonHideUnderline(child: Container()),
                                 iconSize: 30.0,
                                 style: TextStyle(color: Colors.blue),
                                 items: _items.map(
                                       (val) {
                                     return DropdownMenuItem<String>(
                                       value: val,
                                       child: Text(val),
                                     );
                                   },
                                 ).toList(),
                                 onChanged: (newVal) {
                                   setState(() {
                                     _dropDownValueDrop = newVal as String?;
                                   });
                                 }),
                           ),
                           Container(
                             padding: EdgeInsets.symmetric(horizontal: 5),
                             decoration: BoxDecoration(
                                 color: Color(0xff99DEF8),
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                             child: DropdownButton(
                                 hint: _dropDownValuePick == null
                                     ? Text('وصف لموقع الاستلام')
                                     : Text(
                                   _dropDownValuePick!,
                                   style: TextStyle(color: Colors.black),
                                 ),
                                 isExpanded: false,
                                 iconSize: 30.0,
                                 underline: DropdownButtonHideUnderline(child: Container()),
                                 style: TextStyle(color: Colors.blue),
                                 items: _items.map(
                                       (val) {
                                     return DropdownMenuItem<String>(
                                       value: val,
                                       child: Text(val),
                                     );
                                   },
                                 ).toList(),
                                 onChanged: (newVal) {
                                   setState(() {
                                     _dropDownValuePick = newVal as String?;
                                   });
                                 }),
                           )
                         ],
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             children: [
                               IconButton(
                                   onPressed: () {
                                     setState(() {
                                       counter++;
                                     });
                                   },
                                   icon: Icon(Icons.add_circle)),
                               Text(
                                 '$counter',
                                 style: TextStyle(fontSize: 20),
                               ),
                               IconButton(
                                   onPressed: () {
                                     setState(() {
                                       if (counter == 0) return;
                                       counter--;
                                     });
                                   },
                                   icon: Icon(Icons.remove_circle)),
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.only(right: 5),
                             child: Text('عامل تحميل وتنزيل'),
                           ),
                         ],
                       ),
                       SizedBox(height: 20),
                     ],
                   ),
                    widget.isOutCity==7?
                    InkWell(
                      onTap: () {
                        final snackbar = SnackbarHelper.instance..injectContext(context);
                        if (deliveryController.description.text.isEmpty) {
                          Navigator.pop(context);
                          snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء كتابة وصف الاغراض'));
                        }  else {
                          Navigator.pop(context);
                          _addFurniture();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xff99DEF8),
                        ),
                        child: Center(
                          child: Text('تأكيد',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ):
                    InkWell(
                      onTap: () {
                        final snackbar = SnackbarHelper.instance..injectContext(context);
                        if (deliveryController.description.text.isEmpty) {
                          Navigator.pop(context);
                          snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء كتابة وصف الاغراض'));
                        } else if (_dropDownValuePick == null) {
                          Navigator.pop(context);
                          snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'وصف لموقع الاستلام'));
                        } else if (_dropDownValueDrop == null) {
                          Navigator.pop(context);
                          snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'وصف لموقع الواجهه'));
                        } else {
                          Navigator.pop(context);
                          _addFurniture();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xff99DEF8),
                        ),
                        child: Center(
                          child: Text('دفع',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
