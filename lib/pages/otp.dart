import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/controller/auth_controller.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:truckdelivery/pages/login.dart';

import 'adminlogin.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();
  final bool autoFocus = true;
  AuthController _authController=Get.put(AuthController());
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();

  void _checkOtp(String sms) async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('التحقق من Otp ...');
    final message = await _authController.checkedOtp(sms);
    _dialogHelper.dismissProgress();
    print('message............');
    print(message);
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(
          MaterialDialogContent.networkError(), () => _checkOtp(sms));
      return;
    }
    final snackbar = SnackbarHelper.instance..injectContext(context);
    if (message.isEmpty) {
      snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: message));
      return;
    }
    //snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'الغناء بنجاح ..!'));
    Future.delayed(const Duration(milliseconds: 700))
        .then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => LoginPage())));
  }
  @override
  Widget build(BuildContext context) {
    final snackbar = SnackbarHelper.instance..injectContext(context);

    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 15, right: 15, top: 30),
            decoration: BoxDecoration(border: Border.all(color: Colors.white54), borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/forward.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff28476E),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'التحقق من رقم الهاتف',
                        style: TextStyle(
                          color: Color(0xff28476E),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                          child: Text(
                        '. أدخل الرقم المرسل لرقم هاتفك',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff28476E),
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            autofocus: autoFocus,
                            textAlign: TextAlign.center,
                            controller: one,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                            controller: two,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                            controller: three,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                            controller: four,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                            controller: five,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                            controller: six,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                InkWell(
                  onTap: () {
                    String _otp = one.text + two.text + three.text + four.text + five.text + six.text;
                    if(_otp.length!=6){
                      snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء إدخال كافة الحقول'));
                      return;
                    }
                    _checkOtp(_otp);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 70, vertical: 100),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                    child: Center(
                      child: Text(
                        'ارسال',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
