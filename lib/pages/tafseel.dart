import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Tasfeel extends StatefulWidget {
  @override
  _TasfeelState createState() => _TasfeelState();
}

class _TasfeelState extends State<Tasfeel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
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
                padding:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/Rectangle 801.png'),
                                  fit: BoxFit.fill)),
                          child: Text(
                            'تأكيد الحجز ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff28476E),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'مجموع سعر الرحلة ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff28476E),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 120),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(70),
                                  topLeft: Radius.circular(70))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ر.س',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff99DEF8),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '70  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff99DEF8),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15,right:15),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      color: Colors.black12,
                                      offset: Offset(0, 3)),
                                ],
                                color: Colors.white,
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  'التفاصيل ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff28476E),
                                    fontSize: 20,
                                  ),
                                ),
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'فتح العداد',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff28476E),
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '+65  ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff28476E),
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                'ر.س',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xff28476E),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'المسافة (1.9) كيلومتر ',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff28476E),
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '+65  ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff28476E),
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                'ر.س',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xff28476E),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'المدة الزمنية (4) دقائق',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff28476E),
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '---',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff28476E),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Divider(),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'المجموع',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff28476E),
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '70  ',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xff28476E),
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                'ر.س',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xff28476E),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'طريقة الدفع',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff28476E),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    // width: MediaQuery.of(context).size.width*0.4,
                                    // color: Colors.blue,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'كاش',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xff28476E),
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset('assets/cash.png'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 16),
                                    // width: MediaQuery.of(context).size.width*0.4,
                                    // color: Colors.blue,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset('assets/mada.png'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                                    prefixIcon:
                                        Image.asset('assets/percent.png'),
                                    border: InputBorder.none,
                                    hintText: 'اضف كوبون',
                                    hintStyle:
                                        TextStyle(color: Color(0xffB5B5B5)))),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _showMyDialog();
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
                                  child: Text('دفع',
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
                          height: 70,
                        ),
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
            height: 200,
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              children: [
                Text(
                  'تم ارســال طلبك بنجــاح',
                  style: TextStyle(fontSize: 20,  color: Color(0xff28476E),),
                ),
                SizedBox(
                  height: 20,
                ),
                 Text(
                  'انتظر سوف يتم ارسال طلبك في الرسائل ',
                  style: TextStyle(fontSize: 18,  color: Color(0xff28476E),),
                ),
                 SizedBox(
                  height: 20,
                ),
                 InkWell(
                          onTap: () {
                            _showMyDialog();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left:80.0,right:80),
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
                                  child: Text('دفع',
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
        );
      },
    );
  }
}
