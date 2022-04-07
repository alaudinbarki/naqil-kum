import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:intl/intl.dart';
import 'package:truckdelivery/pages/orderRequest.dart';

class DetailPage extends StatefulWidget {
  final int isOutCity;
  final String carTitle;

  DetailPage({required this.isOutCity, required this.carTitle});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DeliveryController deliveryController = Get.find();
  final ImagePicker imagePicker = ImagePicker();
  XFile? imageFile;
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();
  final f = new DateFormat('yyyy-MM-dd');
  final timeFormat = new DateFormat('hh:mm');
  String date = '';
  String time = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        date = f.format(selectedDate);
      });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        time = '${selectedTime.hour.hours}:${selectedTime.minute.minutes}';
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
    date = f.format(selectedDate);
    time = selectedTime.format(context);
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
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'سطحة عادية',
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

                        ///inside
                        widget.isOutCity == 6
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 100),
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'ريال',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'ابتداء من',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset('assets/speed.png'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'ريال',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'كيلومتر',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset('assets/clock.png'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            :

                            ///outside
                            Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'الوقت',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _selectTime(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/timer.png', fit: BoxFit.fill),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      time,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color(0xff28476E),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'التاريخ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _selectDate(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/date.png', fit: BoxFit.fill),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      date,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color(0xff28476E),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),

                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(color: Color(0xff99DEF8), borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'عنوان التحميل',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xff28476E),
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        '${deliveryController.pickselectedPlace!.formattedAddress}',
                                        textAlign: TextAlign.right,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Color(0xff28476E),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff28476E),
                                  radius: 8,
                                  child: CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(color: Color(0xff28476E), borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'عنوان التسليم',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        '${deliveryController.dropselectedPlace!.formattedAddress}',
                                        textAlign: TextAlign.right,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(child: Image.asset('assets/location.png')),
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
                              'عندك أي ملاحظات؟',
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
                            decoration: InputDecoration(
                                border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'اضف صورة السيارة',
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
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final image = await imagePicker.pickImage(source: ImageSource.gallery);
                                if (image == null) return;
                                imageFile = image;
                                setState(() {});
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  color: Colors.white,
                                  child: Image.asset('assets/camera.png')),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: 100,
                                child: Text(
                                  imageFile == null ? '' : imageFile!.path.split('0').last,
                                  overflow: TextOverflow.ellipsis,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (deliveryController.description.text.isEmpty) {
                              final snackbar = SnackbarHelper.instance..injectContext(context);
                              snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء كتابة وصف الاغراض'));
                            } else if (imageFile == null) {
                              final snackbar = SnackbarHelper.instance..injectContext(context);
                              snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'اضف صورة السيارة'));
                            } else {
                              _addRentCar(date, time);
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
