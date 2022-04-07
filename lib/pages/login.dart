import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/controller/auth_controller.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:truckdelivery/pages/bottomAppbar.dart';
import 'package:truckdelivery/pages/signup.dart';
import 'dart:io' show Platform;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();
  RegExp regExp = new RegExp(p);
  AuthController _ = Get.put(AuthController());

  void _login() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('تسجيل....');
    final message = await _.login();
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(MaterialDialogContent.networkError(), () => _login());
      return;
    }
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);
    if (message.isNotEmpty) {
      snackbarHelper.showSnackbar(snackbar: SnackbarMessage.error(message: message));
      return;
    }
    snackbarHelper.showSnackbar(snackbar: SnackbarMessage.success(message: 'تم تسجيل دخول المستخدم بنجاح'));
    Future.delayed(const Duration(milliseconds: 700))
        .then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => BottomApp())));
  }

  void _googleLogin() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('تسجيل....');
    final message = await _.signInWithGoogle();
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(MaterialDialogContent.networkError(), () => _googleLogin());
      return;
    }
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);
    if (message.isEmpty) {
      snackbarHelper.showSnackbar(snackbar: SnackbarMessage.error(message: message));
      return;
    }

    snackbarHelper.showSnackbar(snackbar: SnackbarMessage.success(message: 'تم تسجيل دخول المستخدم بنجاح'));
    Future.delayed(const Duration(milliseconds: 700))
        .then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => BottomApp())));
  }

  void _appleLogin() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('تسجيل....');
    final message = await _.signInWithApple();
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(MaterialDialogContent.networkError(), () => _appleLogin());
      return;
    }
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);
    if (message.isEmpty) {
      snackbarHelper.showSnackbar(snackbar: SnackbarMessage.error(message: message));
      return;
    }
    snackbarHelper.showSnackbar(snackbar: SnackbarMessage.success(message: 'تم تسجيل دخول المستخدم بنجاح'));
    Future.delayed(const Duration(milliseconds: 700))
        .then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => BottomApp())));
  }

  @override
  Widget build(BuildContext context) {
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);

    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Obx(() {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(border: Border.all(color: Colors.white54), borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 25, color: Color(0xff28476E)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black54,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _.email.value,
                                validator: (email) {
                                  if (email!.isEmpty) {
                                    return 'الرجاء إدخال البريد الإلكتروني';
                                  }
                                  if (!regExp.hasMatch(email)) {
                                    return 'أدخل بريد إلكتروني صالح';
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: 'xwz@gmail.com',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 18)),
                              ),
                            ),
                            Text(
                              'بريد الالكتروني',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage('assets/email.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black54,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _.password.value,
                                validator: (password) {
                                  if (password!.isEmpty) {
                                    return 'الرجاء إدخال كلمة المرور';
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: '********', border: InputBorder.none, contentPadding: EdgeInsets.only(left: 20)),
                              ),
                            ),
                            Text(
                              'كلمة المرور',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage('assets/NoPath - Copy (4).png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => SignUp()));
                            },
                            child: Text(
                              'ليس لديك حساب ؟ اشتراك',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'سيت كلمة المرور؟',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => SignUp()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                              child: Center(
                                child: Text(
                                  'اشتراك',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _login();
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                                child: Center(
                                  child: Text(
                                    'دخول',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          snackbarHelper.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء الاتصال بجهاز IOS'));
                          return;
                        }
                        _appleLogin();
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          width: 200,
                          // margin: EdgeInsets.symmetric(horizontal: 70),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/black-apple-icon.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Apple المتابعة مع',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          if (Platform.isIOS) {
                            snackbarHelper.showSnackbar(snackbar: SnackbarMessage.error(message: 'الرجاء الاتصال بجهاز Android'));
                            return;
                          }
                          _googleLogin();
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            width: 200,
                            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/google-play-2-555322.png'),
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Google Play',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff28476E),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/hand.png'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'مزود الخدمة',
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
