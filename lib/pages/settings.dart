import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:truckdelivery/controller/setting_controller.dart';
import 'package:truckdelivery/model/user_model.dart';
import 'package:truckdelivery/pages/bottomAppbar.dart';
import 'package:truckdelivery/pages/login.dart';
import 'package:truckdelivery/pages/profile.dart';

import 'ads.dart';
import 'leftBalance.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingController _=Get.put(SettingController());
  UserModel? userModel;
  bool switchControl = false;
  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
      });
    } else {
      setState(() {
        switchControl = false;
      });
    }
  }

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
                padding:
                    EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 20),
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
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>BottomApp()));
                              },
                              child: Image.asset('assets/backButton.png')),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                'الاعدادات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff28476E),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<SettingController>(
                         builder: (value)
                          =>Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 30),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('assets/frame.png'),
                                          fit: BoxFit.fill),
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
                                              image: value.userModel?.image != null
                                                  ? DecorationImage(image: NetworkImage(value.userModel!.image), fit: BoxFit.cover)
                                                  : null),
                                          alignment: Alignment.center,

                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                           Text(
                                            '${value.userModel?.firstName??''} ${value.userModel?.lastName??''}',
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
                                InkWell(
                                     onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProfilePage()));
                                          },
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      'assets/edit.png',
                                      fit: BoxFit.fill,
                                      height: 60,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              // InkWell(
                              //   onTap: (){
                              //       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>LeftBalancePage()));
                              //   },
                              //   child: Card(
                              //     elevation: 3,
                              //     shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(20)),
                              //     child: Container(
                              //       padding: EdgeInsets.symmetric(
                              //           horizontal: 20, vertical: 8),
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(20),
                              //         color: Colors.white,
                              //       ),
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.end,
                              //         children: [
                              //           Text(
                              //             'الرصيد',
                              //             textAlign: TextAlign.right,
                              //             style: TextStyle(
                              //               fontSize: 18,
                              //               color: Color(0xff28476E),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 10,
                              //           ),
                              //           Image.asset('assets/money.png'),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 3,
                              ),
                              // Card(
                              //   elevation: 3,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: 20, vertical: 8),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: Colors.white,
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Text(
                              //           'دعوة اصدقائك',
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             fontSize: 18,
                              //             color: Color(0xff28476E),
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Image.asset('assets/addUser.png'),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 3,
                              ),
                              // InkWell(
                              //      onTap: (){
                              //       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AdsPage()));
                              //   },
                              //   child: Card(
                              //     elevation: 3,
                              //     shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(20)),
                              //     child: Container(
                              //       padding: EdgeInsets.symmetric(
                              //         horizontal: 20,
                              //       ),
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(20),
                              //         color: Colors.white,
                              //       ),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Transform.scale(
                              //               scale: 1.3,
                              //               child: Switch(
                              //                 onChanged: toggleSwitch,
                              //                 value: switchControl,
                              //                 activeColor: Colors.white,
                              //                 activeTrackColor: Color(0xff28476E),
                              //                 inactiveThumbColor: Colors.white,
                              //                 inactiveTrackColor: Colors.blue,
                              //               )),
                              //           Row(
                              //             children: [
                              //               Text(
                              //                 'الاشعارات',
                              //                 textAlign: TextAlign.right,
                              //                 style: TextStyle(
                              //                   fontSize: 18,
                              //                   color: Color(0xff28476E),
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 width: 10,
                              //               ),
                              //               Image.asset(
                              //                   'assets/Notification.png'),
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 3,
                              // ),
                              GestureDetector(
                                onTap: (){
                                  Share.share("www.truckDelivery.app.com");
                                },
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 9),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'مشاركة التطبيق',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff28476E),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset('assets/share.png'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              // Card(
                              //   elevation: 3,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: 17, vertical: 9),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: Colors.white,
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Text(
                              //           'تقيم الخدمة',
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             fontSize: 18,
                              //             color: Color(0xff28476E),
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Image.asset('assets/fvrt.png'),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 3,
                              ),
                              // Card(
                              //   elevation: 3,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: 16, vertical: 9),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: Colors.white,
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Text(
                              //           'انضم الى الفريق',
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             fontSize: 18,
                              //             color: Color(0xff28476E),
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Image.asset('assets/groupUser.png'),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 3,
                              ),
                              // Card(
                              //   elevation: 3,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: 14, vertical: 9),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: Colors.white,
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Text(
                              //           'الشروط والاحكام',
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             fontSize: 18,
                              //             color: Color(0xff28476E),
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Image.asset('assets/docs.png'),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 3,
                              ),
                              // Card(
                              //   elevation: 3,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: 14, vertical: 9),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: Colors.white,
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Text(
                              //           'عن التطبيق',
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             fontSize: 18,
                              //             color: Color(0xff28476E),
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Image.asset('assets/required.png'),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Card(
                              //         elevation: 3,
                              //         shape: RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(20)),
                              //         child: Container(
                              //           padding: EdgeInsets.only(
                              //             left: 20,
                              //             right: 5,
                              //             top: 9,
                              //             bottom: 9,
                              //           ),
                              //           decoration: BoxDecoration(
                              //             borderRadius:
                              //                 BorderRadius.circular(20),
                              //             color: Colors.white,
                              //           ),
                              //           child: Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.spaceEvenly,
                              //             children: [
                              //               Text(
                              //                 'اتصل بنا',
                              //                 textAlign: TextAlign.right,
                              //                 style: TextStyle(
                              //                   fontSize: 18,
                              //                   color: Color(0xff28476E),
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 width: 10,
                              //               ),
                              //               Image.asset('assets/phone.png'),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 15,
                              //     ),
                              //     // Expanded(
                              //     //   child: Card(
                              //     //     elevation: 3,
                              //     //     shape: RoundedRectangleBorder(
                              //     //         borderRadius:
                              //     //             BorderRadius.circular(20)),
                              //     //     child: Container(
                              //     //       padding: EdgeInsets.only(
                              //     //         left: 30,
                              //     //         right: 5,
                              //     //         top: 9,
                              //     //         bottom: 9,
                              //     //       ),
                              //     //       decoration: BoxDecoration(
                              //     //         borderRadius:
                              //     //             BorderRadius.circular(20),
                              //     //         color: Colors.white,
                              //     //       ),
                              //     //       child: Row(
                              //     //         mainAxisAlignment:
                              //     //             MainAxisAlignment.spaceEvenly,
                              //     //         children: [
                              //     //           Text(
                              //     //             'اللغة',
                              //     //             textAlign: TextAlign.right,
                              //     //             style: TextStyle(
                              //     //               fontSize: 18,
                              //     //               color: Color(0xff28476E),
                              //     //             ),
                              //     //           ),
                              //     //           SizedBox(
                              //     //             width: 10,
                              //     //           ),
                              //     //           Image.asset('assets/internet.png'),
                              //     //         ],
                              //     //       ),
                              //     //     ),
                              //     //   ),
                              //     // ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Card(
                              //   elevation: 3,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: InkWell(
                              //     onTap: () {
                              //       _showMyDialog();
                              //     },
                              //     child: Container(
                              //       padding: EdgeInsets.symmetric(
                              //           horizontal: 14, vertical: 9),
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(20),
                              //         color: Colors.white,
                              //       ),
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.end,
                              //         children: [
                              //           Text(
                              //             'إضافة رمز دعوة',
                              //             textAlign: TextAlign.right,
                              //             style: TextStyle(
                              //               fontSize: 18,
                              //               color: Color(0xff28476E),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 10,
                              //           ),
                              //           Image.asset('assets/letter.png'),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              GestureDetector(
                                onTap: (){
                                  _.logout();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => LoginPage()),(route) => false,);

                                },
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 9),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'تسجيل خروج',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff28476E),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.logout,color:Color(0xff336699) ,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset('assets/insta.png'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset('assets/twitter.png'),
                                        ],
                                      ),
                                      Text(
                                        'هل تريد الحصول علة مزيد من الكوبونات؟ تابعنا على',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff28476E),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
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
    );
  }

  _showMyDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            height: 230,
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'اضافة رمز دعوة',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff28476E),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الرجاء كتابة رمز دعوة صديقك',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff28476E),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'اضف كوبون',
                            hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color(0xff99DEF8),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('تقديم',
                                style: TextStyle(
                                  color: Color(0xff28476E),
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('الغاء',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
