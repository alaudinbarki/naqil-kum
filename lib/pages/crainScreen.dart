import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/pages/delivery.dart';
import 'package:truckdelivery/pages/onlyCars.dart';

class Crain extends StatefulWidget {
  final isOutFurniture;

  Crain({required this.isOutFurniture});

  @override
  _CrainState createState() => _CrainState();
}

class _CrainState extends State<Crain> {
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
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/crain.png'), fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff28476E), Colors.grey.withOpacity(0.1)]),
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
                            'معدات المقاولات',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'شيول')));
                                    },
                                    child: commonContainer('assets/crain3.png', 'شيول'),
                                  ),
                                ),


                                SizedBox(width: 5,),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'رصاصه')));
                                    },
                                    child: commonContainer('assets/crain2.png', 'قلاب'),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => OnlyCarDelivery(
                                                inOnlyCar: widget.isOutFurniture,
                                              )));
                                    },
                                    child: commonContainer('assets/crain1.png', 'رصاصه'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'كرين')));

                                    },
                                    child: commonContainer('assets/crain6.png', 'كرين'),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'بوكلين')));

                                    },
                                    child: commonContainer('assets/crain5.png', 'بوكلين'),
                                  ),
                                ),

                                SizedBox(width: 5,),

                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'قريدار')));

                                    },
                                    child: commonContainer('assets/crain4.png', 'قريدار'),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'لوبد')));

                                    },
                                    child: commonContainer('assets/crain9.png', 'لوبد'),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'بلدوزر')));

                                    },
                                    child: commonContainer('assets/crain8.png', 'بلدوزر'),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'ثلاجة')));

                                    },
                                    child: commonContainer('assets/crain7.png', 'ثلاجة'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => Delivery(isOutCity:  7, carTile: 'سطحة')));

                              },
                              child: commonContainer('assets/crain10.png', 'سطحة'),
                            ),

                          ],
                        ),
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

  Widget commonContainer(String imagePath, String text) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff28476E),
            ),
          )
        ],
      ),
    );
  }
}
