import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:truckdelivery/pages/delivery.dart';

class LocalDriver extends StatefulWidget {
  final bool isOutTruck;

  LocalDriver({required this.isOutTruck});

  @override
  _LocalDriverState createState() => _LocalDriverState();
}

class _LocalDriverState extends State<LocalDriver> {
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
                      image: AssetImage('assets/home6.png'), fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff457ab1), Colors.black26.withOpacity(0.1)]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 50, right: 15, left: 15, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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

                        Text('نقل سيارات',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          Delivery(isOutCity:6, carTile: 'سطحة عادية')));
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 140,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                        decoration: BoxDecoration(
                                            color: Color(0xff99DEF8),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
                                        child: Center(child: Image.asset('assets/TruckEmpty.png')),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          Delivery(isOutCity: 6, carTile: 'سطحة هيدروليك')));
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 140,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                        decoration: BoxDecoration(
                                            color: Color(0xff99DEF8),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
                                        child: Center(child: Image.asset('assets/Truck2.png')),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Delivery(
                                          isOutCity:6, carTile: ' سطحة مغطاه نزول كامل')));
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 140,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                        decoration: BoxDecoration(
                                            color: Color(0xff99DEF8),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
                                        child: Center(child: Image.asset('assets/Truck3.png')),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Delivery(
                                          isOutCity: 6, carTile: 'ونش رفع')));
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 140,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'ونش رفع',
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
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                        decoration: BoxDecoration(
                                            color: Color(0xff99DEF8),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
                                        child: Center(child: Image.asset('assets/TruckEmpty.png')),
                                      ),
                                    ],
                                  )),
                            ),
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
