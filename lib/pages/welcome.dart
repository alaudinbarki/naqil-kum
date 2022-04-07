import 'package:flutter/material.dart';
import 'package:truckdelivery/pages/bottomAppbar.dart';


class AdminWelcome extends StatefulWidget {
  @override
  _AdminWelcomeState createState() => _AdminWelcomeState();
}

class _AdminWelcomeState extends State<AdminWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
       
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
               decoration: BoxDecoration(
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(30)),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
            
                  
                Image.asset('assets/mainlogo.png'),
              SizedBox(
                height: 80,
              ),
              Text(
                'اهلا وسهلا بك',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff28476E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                'انقر للبداية',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff28476E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => BottomApp()));
                  },
                  child: Image.asset('assets/tap.png')),
              SizedBox(
                height: 100,
              ),
            ])),
      ),
    );
  }
}
