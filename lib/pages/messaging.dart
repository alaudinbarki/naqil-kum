import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottomAppbar.dart';

class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
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
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'الرسائل',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff28476E),
                          ),
                        ),
                       
                        SizedBox(
                          height: 80,
                        ),
                         Container(
                           padding: EdgeInsets.symmetric(vertical: 130,horizontal: 70),
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage('assets/message.png'))
                           ),
                           child:  Text(
                          'لاتوجد دردشاث حتى الان',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff28476E),
                          ),
                        ),
                         )
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
            Positioned(
              left: 15,
              top: 40,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>BottomApp()));
                },
                child: Center(
                  child: Image.asset('assets/backButton.png'),
                ),
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
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff28476E),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'انتظر سوف يتم ارسال طلبك في الرسائل ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff28476E),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _showMyDialog();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 90.0, right: 90),
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
                          child: Text('تم',
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
