import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckdelivery/constant.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:intl/intl.dart';
import 'package:truckdelivery/pages/orderRequest.dart';

class TankerDetailScreen extends StatefulWidget {
  final int isOutCity;
  final String carTitle;

  TankerDetailScreen({required this.isOutCity, required this.carTitle});

  @override
  _TankerDetailScreenState createState() => _TankerDetailScreenState();
}

class _TankerDetailScreenState extends State<TankerDetailScreen> {
  DeliveryController deliveryController = Get.find();
  final ImagePicker imagePicker = ImagePicker();
  XFile? imageFile;
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();

  void _addRentCar(String date, String time) async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('إضافة طلب ...!');
    final message = await deliveryController.addRentCar(widget.isOutCity, imageFile, widget.carTitle, date, time);
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(MaterialDialogContent.networkError(), () => _addRentCar(date, time));
      return;
    }
    // final snackbar = SnackbarHelper.instance..injectContext(context);
    // if (message.isEmpty) {
    //   snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: message));
    //   return;
    // }
    // snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'تمت إضافة الطلب بنجاح..!'));
    // int count = 0;
    // Navigator.popUntil(context, (_) => count++ == 3);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => TimerClass(
              parcelId: message.id,
            )));
  }


  _showDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          backgroundColor: Colors.white.withOpacity(0.8),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * .3,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            child: GridView.count(
              crossAxisCount: 4 ,
              mainAxisSpacing: 4,
              crossAxisSpacing: 3,
              children: List.generate(6,(index){
                return GestureDetector(
                  onTap: (){
                    saveTime='${index+1}';
                    setState(() {
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 70,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('ساعة',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 18,
                            )),
                        Text('${index+1}',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  _showSizedDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          backgroundColor: Colors.white.withOpacity(0.8),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * .3,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: GridView.count(
              crossAxisCount: 5 ,
              mainAxisSpacing: 4,
              crossAxisSpacing: 3,
              children: List.generate(15,(index){
                return GestureDetector(
                  onTap: (){
                    saveSize='${index+5}';
                    setState(() {
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('3 م',
                              style: TextStyle(
                                color: blueColor,
                                fontSize: 18,
                              )),
                          Text('${index+5}',
                              style: TextStyle(
                                color: blueColor,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
  String saveSize='حجم الوايت ';
  String saveTime='مدة التوصيل';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'مياه صالحه للشرب',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff28476E),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        ///outside
                        Text(
                          'اختر الحجم',
                          style: TextStyle(
                            color: Color(0xff28476E),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showSizedDialog();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(saveSize=='حجم الوايت '?"": '3 م',
                                    style: TextStyle(
                                      color: blueColor,
                                      fontSize: 14,
                                    )),
                                Text(
                                  saveSize,
                                  style: TextStyle(
                                    color: blueColor,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(Icons.photo_size_select_large_outlined, size: 25, color: blueColor),


                              ],
                            ),
                          ),
                        ),
                        Text(
                          'وقت التوصيل    ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff28476E),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                           _showDialog();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '$saveTime ${saveTime=='مدة التوصيل'?'':'ساعة'}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff28476E),
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.timer_sharp,
                                  size: 25,
                                  color: blueColor,
                                )
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'عنوان التسليم',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff28476E),
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  '${deliveryController.dropselectedPlace!.formattedAddress}',
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Color(0xff28476E),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Expanded(child: Icon(Icons.location_on_outlined)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'طريقة الدفع',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff28476E),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'بطاقة ائتمانية',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Image.asset('assets/wallet.png')
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'الدفع كاش',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Image.asset('assets/cash.png')
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'تفاصيل الطلب',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff28476E),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: Colors.black12,
                            )
                          ]),
                          child: TextField(
                            controller: deliveryController.description,
                            maxLines: 6,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: 'اكتب هنا تفاصيل طلبك',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (deliveryController.description.text.isEmpty) {
                              final snackbar = SnackbarHelper.instance..injectContext(context);
                              snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء كتابة وصف الاغراض'));
                            }
                           else if (saveSize=='حجم الوايت ') {
                              final snackbar = SnackbarHelper.instance..injectContext(context);
                              snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء تحديد حجم العناصر'));
                            }
                           else if (saveTime=='مدة التوصيل') {
                              final snackbar = SnackbarHelper.instance..injectContext(context);
                              snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء تحديد وقت العناصر'));
                            }
                            else {
                              _addRentCar(saveSize, saveTime);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xff99DEF8),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                                child: Center(
                                  child: Text('اطلب الان',
                                      style: TextStyle(
                                        color: Color(0xff28476E),
                                        fontSize: 18,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Center(
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Positioned(
              left: 15,
              top: 40,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Image.asset('assets/backButton.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
