import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/pages/onlyCars.dart';

class Shifting extends StatefulWidget {
  final isOutFurniture;

  Shifting({required this.isOutFurniture});

  @override
  _ShiftingState createState() => _ShiftingState();
}

class _ShiftingState extends State<Shifting> {
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
                      image: AssetImage(widget.isOutFurniture == true ? 'assets/home3.png' : 'assets/home4.png'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff28476E), Colors.black.withOpacity(0.3)]),
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
                          child: Text('نقل عفش',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                        )
                      ],
                    ),
                    Text(
                      'اختار ( مركبة او مركبة تحميل )',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => OnlyCarDelivery(inOnlyCar: widget.isOutFurniture,)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                    child: Image.asset(
                                      'assets/van.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'مركبات فقط',
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
                              height: 20,
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => OnlyCarDelivery(inOnlyCar: false,)));

                      },
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                    child: Image.asset(
                                      'assets/delivery.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      'مركبات مع تحميل وتنزيل',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff28476E),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
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
}
