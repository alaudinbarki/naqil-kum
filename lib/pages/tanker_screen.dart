import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/pages/delivery.dart';
import 'package:truckdelivery/pages/onlyCars.dart';

class TankerScreen extends StatefulWidget {
  final isOutFurniture;

  TankerScreen({required this.isOutFurniture});

  @override
  _TankerScreenState createState() => _TankerScreenState();
}

class _TankerScreenState extends State<TankerScreen> {
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
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/tanker.png'), fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff28476E), Colors.grey.withOpacity(0.2)]),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/backButton.png')),
                        Center(
                          child: Text(
                            'صهاريج ماء',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) => Delivery(isOutCity: 5, carTile: 'مياه صالحة للشرب')));
                                },
                                child: Container(
                                  height: 70,
                                  width: 120,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/tankr.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 170,
                                padding: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.white),
                                child: Text(
                                  'مياه صالحة للشرب',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) => Delivery(isOutCity: 5, carTile: 'صهريج صرف صحي')));
                                },
                                child: Container(
                                  height: 70,
                                  width: 120,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/tanker2.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 170,
                                padding: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.white),
                                child: Text(
                                  'صهريج صرف صحي',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) => Delivery(isOutCity: 5, carTile: 'مياه لاستخدام المسابح وغيره')));
                                },
                                child: Container(
                                  height: 70,
                                  width: 120,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/tanker3.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 170,
                                padding: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.white),
                                child: Text(
                                  'مياه لاستخدام المسابح وغيره',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
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
