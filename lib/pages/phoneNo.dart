import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:truckdelivery/controller/auth_controller.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';

import 'otp.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController inputcontroller = TextEditingController();
  AuthController _authController=Get.put(AuthController());
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();

  void _phoneNumberVerify() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('إرسال Otp ....');
    final message = await _authController.phoneVerify();
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(
          MaterialDialogContent.networkError(), () => _phoneNumberVerify());
      return;
    }
    final snackbar = SnackbarHelper.instance..injectContext(context);
    if (message.isNotEmpty) {
      snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: message));
    }
    //snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'الغناء بنجاح ..!'));
    Future.delayed(const Duration(milliseconds: 700))
        .then((_) => Navigator.push(context, MaterialPageRoute(builder: (ctx) => OTP())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(30)),
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
                        'هل نسيت كلمة السر',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff28476E),
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
                          'أدخل رقم هاتفك أدناه وسنرسل إليك رسالة نصية تحتوي على رمز التحقق لتغيير كلمة المرور الخاصة بك',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff28476E),
                          ),
                        )),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(
                      left: 30, right: 30, top: 150, bottom: 50),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff28476E),
                        width: 1,
                      ),
                    ),
                  ),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _authController.phoneNumber.value,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintText: 'رقم الهاتف',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xff28476E),
                        ),
                        border: InputBorder.none,
                      )),
                ),
                SizedBox(
                  height: 150,
                ),
                InkWell(
                  onTap: () {
                    _phoneNumberVerify();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 70),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        'ارسال',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
