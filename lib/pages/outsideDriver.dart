import 'package:flutter/material.dart';

class OutSideDriver extends StatefulWidget {
  @override
  _OutSideDriverState createState() => _OutSideDriverState();
}

class _OutSideDriverState extends State<OutSideDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/header2.png'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff28476E), Colors.white10]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding:
                    EdgeInsets.only(top: 50, right: 15, left: 15, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/backButton.png')),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          ' سطحة ( خارج المدينة )',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/batch.png'),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Transform.rotate(
                                            angle: 32,
                                            child: Text(
                                              '170',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Transform.rotate(
                                            angle: 32,
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'ريال',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'سطحة عادية',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'سعر الطلب يبدأ من ',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      decoration: BoxDecoration(
                                          color: Color(0xff99DEF8),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50))),
                                      child: Center(
                                          child: Image.asset(
                                              'assets/TruckEmpty.png')),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            elevation: 5,
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/batch.png'),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Transform.rotate(
                                            angle: 32,
                                            child: Text(
                                              '17',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Transform.rotate(
                                            angle: 32,
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'ريال',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'سطحة هيدروليك',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'سعر الطلب يبدأ من ',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      decoration: BoxDecoration(
                                          color: Color(0xff99DEF8),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50))),
                                      child: Center(
                                          child:
                                              Image.asset('assets/Truck2.png')),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            elevation: 5,
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/batch.png'),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Transform.rotate(
                                            angle: 32,
                                            child: Text(
                                              '170',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Transform.rotate(
                                            angle: 32,
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'ريال',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'سطحة مغطاه نزول كامل',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'سعر الطلب يبدأ من ',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      decoration: BoxDecoration(
                                          color: Color(0xff99DEF8),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50))),
                                      child: Center(
                                          child:
                                              Image.asset('assets/Truck3.png')),
                                    ),
                                  ],
                                )),
                          ),
                         
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
