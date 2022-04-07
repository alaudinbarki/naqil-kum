import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckdelivery/controller/setting_controller.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:truckdelivery/pages/newpassword.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SettingController _ = Get.find();
  final ImagePicker imagePicker = ImagePicker();

  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);

    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: GetBuilder<SettingController>(
        builder: (value) => Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.5)),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>BottomApp()));
                                  },
                                  child: Image.asset('assets/backButton.png')),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    'الاعدادات',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff28476E),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage('assets/frame.png'), fit: BoxFit.fill),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: 80,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  shape: BoxShape.circle,
                                                  image: imageFile != null
                                                      ? DecorationImage(
                                                          image: FileImage(File(imageFile!.path)), fit: BoxFit.cover)
                                                      : value.userModel!.image != null
                                                          ? DecorationImage(
                                                              image: NetworkImage(value.userModel!.image), fit: BoxFit.cover)
                                                          : null),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              '${value.userModel?.firstName ?? ''} ${value.userModel?.lastName ?? ''}',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff28476E),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                        left: 45,
                                        top: 30,
                                        child: GestureDetector(
                                          onTap: () async {
                                            final image = await imagePicker.pickImage(source: ImageSource.gallery);
                                            if (image == null) return;
                                            imageFile = image;
                                            setState(() {});
                                          },
                                          child: Image.asset(
                                            'assets/camera.png',
                                            color: Colors.white,
                                          ),
                                        ))
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    'assets/edit.png',
                                    fit: BoxFit.fill,
                                    height: 60,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 40),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      'الاسم الاخير',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff28476E),
                                      ),
                                    ),
                                    Text(
                                      'الاسم الاول',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff28476E),
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 30, left: 40),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff28476E),
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                              child: Text(
                                            '${value.userModel?.firstName ?? ''}',
                                          ))),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff28476E),
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                              child: Text(
                                            '${value.userModel?.lastName ?? ''}',
                                          ))),
                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 22),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: value.userModel?.phone ?? 'أدخل رقم الهاتف المتحرك',
                                              hintStyle: TextStyle(
                                                color: Color(0xff28476E),
                                              ),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(left: 18)),
                                        ),
                                      ),
                                      Text(
                                        'رقم الجوال',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Center(
                                        child: Image(
                                          image: AssetImage('assets/phone.png'),
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          enabled: false,
                                          showCursor: false,
                                          decoration: InputDecoration(
                                              hintText: value.userModel?.email ?? '',
                                              hintStyle: TextStyle(
                                                color: Color(0xff28476E),
                                              ),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(left: 20)),
                                        ),
                                      ),
                                      Text(
                                        'الايميل',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Center(
                                        child: Image(
                                          image: AssetImage('assets/email.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () async {
                                    final user = await _.getStorageHelper.user();
                                    if (user == null) return null;
                                    if (user.type == 'google') {
                                      final snackbarHelper = SnackbarHelper.instance..injectContext(context);
                                      snackbarHelper.showSnackbar(
                                          snackbar: SnackbarMessage.error(
                                              message: 'تسجيل الدخول إلى Google لا يمكنه تغيير كلمة المرور'));
                                      return;
                                    }
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => NewPasswordPage()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xff28476E),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'تغير كلمة المرور',
                                              style: TextStyle(fontSize: 15, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'كلمة المرور',
                                              style: TextStyle(fontSize: 15, color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Center(
                                              child: Image(
                                                  image: AssetImage(
                                                    'assets/lock.png',
                                                  ),
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     Navigator.push(context, MaterialPageRoute(builder: (ctx) => NewEmailPage()));
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(30),
                                //       color: Color(0xff28476E),
                                //     ),
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //       children: [
                                //         Row(
                                //           children: [
                                //             Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
                                //             SizedBox(
                                //               width: 25,
                                //             ),
                                //             Text(
                                //               'تغير الإيميل',
                                //               style: TextStyle(fontSize: 15, color: Colors.white),
                                //             ),
                                //           ],
                                //         ),
                                //         Row(
                                //           children: [
                                //             Text(
                                //               'الايميل',
                                //               textAlign: TextAlign.right,
                                //               style: TextStyle(fontSize: 15, color: Colors.white),
                                //             ),
                                //             SizedBox(
                                //               width: 15,
                                //             ),
                                //             Center(
                                //               child: Image(
                                //                   image: AssetImage(
                                //                     'assets/email.png',
                                //                   ),
                                //                   color: Colors.white),
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 50,
                                // ),
                                InkWell(
                                  onTap: () {
                                    value.updateUser(imageFile);
                                    //Navigator.push(context, MaterialPageRoute(builder: (ctx) => LeftBalancePage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xff99DEF8),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            )),
                                        child: Center(
                                          child: Text('تحديث',
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 18,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
