import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/controller/auth_controller.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:truckdelivery/pages/bottomAppbar.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();
  RegExp regExp = new RegExp(p);
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  AuthController _ = Get.put(AuthController());

  void _signup() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('جاري التسجيل .....');
    final message = await _.signUp();
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(
          MaterialDialogContent.networkError(), () => _signup());
      return;
    }
    final snackbar = SnackbarHelper.instance..injectContext(context);
    if (message.isNotEmpty) {
      snackbar.showSnackbar(snackbar: SnackbarMessage.error(message: message));
      return;
    }
    snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'تم الدخول بنجاح ...!'));
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => BottomApp()));

    // Future.delayed(const Duration(milliseconds: 700))
    //     .then((_) => Navigator.pushNamedAndRemoveUntil(context, MainScreen.route, (route) => false));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Obx(()
             {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                        height: 10,
                      ),
                      Text(
                        'مستخدم جديد',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xff28476E),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: TextFormField(
                                    controller: _.lastName.value,
                                    textAlign: TextAlign.end,
                                    validator: (name){
                                      if(name!.isEmpty)  {
                                       return 'الرجاء إدخال الاسم الأخير';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: 'الاسم الاخير',
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff28476E),
                                      ),
                                      border: InputBorder.none,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xff28476E),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: TextFormField(
                                    controller: _.firstName.value,
                                    textAlign: TextAlign.end,
                                    validator: (name){
                                      if(name!.isEmpty)  {
                                        return 'الرجاء إدخال الاسم الأول';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: 'الاسم الأول',
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff28476E),
                                      ),
                                      border: InputBorder.none,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 130, top: 20),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(
                      //         color: Color(0xff28476E),
                      //         width: 1,
                      //       ),
                      //     ),
                      //   ),
                      //   child: TextFormField(
                      //       textAlign: TextAlign.end,
                      //       decoration: InputDecoration(
                      //         isDense: true,
                      //         contentPadding: EdgeInsets.zero,
                      //         hintText: 'اسم المستخدم',
                      //         hintStyle: TextStyle(
                      //           fontSize: 15,
                      //           color: Color(0xff28476E),
                      //         ),
                      //         border: InputBorder.none,
                      //       )),
                      // ),
                      Container(
                        margin: EdgeInsets.only(left: 40, top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff28476E),
                              width: 1,
                            ),
                          ),
                        ),
                        child: TextFormField(
                            controller: _.email.value,
                            textAlign: TextAlign.end,
                            validator: (email){
                              if(email!.isEmpty)  {
                                return 'الرجاء إدخال البريد الإلكتروني';
                              }
                              if(!regExp.hasMatch(email)){
                                return 'أدخل بريد إلكتروني صالح';
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'الايميل',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                              border: InputBorder.none,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 130, top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff28476E),
                              width: 1,
                            ),
                          ),
                        ),
                        child: TextFormField(
                            controller: _.password.value,
                            validator: (password){
                              if(password!.isEmpty)  {
                                return 'الرجاء إدخال كلمة المرور';
                              }
                            },
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'كلمة السر',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                              border: InputBorder.none,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40, top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff28476E),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '+966',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff28476E)),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _.phoneNumber.value,
                                validator: (phone){
                                  if(phone!.isEmpty)  {
                                    return 'الرجاء إدخال رقم الهاتف';
                                  }
                                },
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'رقم الهاتف',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff28476E),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.3,
                      //   height: MediaQuery.of(context).size.height * 0.04,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //         color: Color(0xff28476E),
                      //       ),
                      //       borderRadius: BorderRadius.all(Radius.circular(10))),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           setState(() {
                      //             _.isMale.value = !_.isMale.value;
                      //           });
                      //         },
                      //         child: Container(
                      //           padding: EdgeInsets.only(left: 20),
                      //           child: Center(
                      //             // انثى text
                      //             child: Text(
                      //               'انثى',
                      //               style: TextStyle(
                      //                   color: _.isMale.value == false ? Color(0xff28476E) : Colors.blue,
                      //                   fontWeight: FontWeight.w600,
                      //                   fontFamily: 'JF Flat',
                      //                   fontSize: 13),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         // padding: EdgeInsets.symmetric(vertical: 10),
                      //         child: VerticalDivider(
                      //           width: 30,
                      //           thickness: 2,
                      //           color: Color(0xff28476E),
                      //         ),
                      //       ),
                      //       GestureDetector(
                      //         onTap: () {
                      //           setState(() {
                      //             _.isMale.value = !_.isMale.value;
                      //           });
                      //         },
                      //         child: Container(
                      //           padding: EdgeInsets.only(right: 20),
                      //           child: Center(
                      //             child: Text(
                      //               'ذكر',
                      //               style: TextStyle(
                      //                   color: _.isMale.value == true ? Color(0xff28476E) : Colors.blue,
                      //                   fontWeight: FontWeight.w600,
                      //                   fontFamily: 'JF Flat',
                      //                   fontSize: 13),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                           _signup();
                          }
                        },
                        child: isLoading == false
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                                child: Center(
                                  child: Text(
                                    'تسجيل',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}


