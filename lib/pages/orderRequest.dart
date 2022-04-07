import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckdelivery/constant.dart';
import 'package:truckdelivery/controller/setting_controller.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/pages/bottomAppbar.dart';
import 'package:truckdelivery/pages/chat.dart';
import 'package:truckdelivery/pages/map.dart';

class OrderRequest extends StatefulWidget {
  @override
  _OrderRequestState createState() => _OrderRequestState();
}

class _OrderRequestState extends State<OrderRequest> {
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
                              // InkWell(
                              //     onTap: () {
                              //       Navigator.pop(context);
                              //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>BottomApp()));
                              //     },
                              //     child: Image.asset('assets/backButton.png')),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    'طلباتي',
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
                          value.allOrder.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: value.allOrder.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(left: 10, right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                        decoration: BoxDecoration(
                                                          color: lightblueColor,
                                                          borderRadius: BorderRadius.circular(5),
                                                          border: Border.all(
                                                            color: blueColor,
                                                          ),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'منجز',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            value.allOrder[index].creatorId.firstName,
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                '${(value.allOrder[index].creatorId.reviews / value.allOrder[index].creatorId.totalCount).isNaN ? 0 : (value.allOrder[index].creatorId.reviews / value.allOrder[index].creatorId.totalCount).toPrecision(2)}',
                                                                style: TextStyle(color: Colors.grey[400], fontSize: 12),
                                                              ),
                                                              RatingBarIndicator(
                                                                rating: (value.allOrder[index].creatorId.reviews /
                                                                            value.allOrder[index].creatorId.totalCount)
                                                                        .isNaN
                                                                    ? 0
                                                                    : (value.allOrder[index].creatorId.reviews /
                                                                            value.allOrder[index].creatorId.totalCount)
                                                                        .toPrecision(2),
                                                                itemBuilder: (context, index) => Icon(
                                                                  Icons.star,
                                                                  color: Colors.amber,
                                                                ),
                                                                itemCount: 5,
                                                                itemSize: 15,
                                                                unratedColor: Colors.black12,
                                                                direction: Axis.horizontal,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 45,
                                                        height: 45,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            shape: BoxShape.circle,
                                                            image: value.allOrder[index].creatorId.yourImage.isNotEmpty
                                                                ? DecorationImage(
                                                                    image:
                                                                        NetworkImage(value.allOrder[index].creatorId.yourImage),
                                                                    fit: BoxFit.cover)
                                                                : null),
                                                        alignment: Alignment.center,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                margin: EdgeInsets.only(right: 20),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(
                                                    color: blueColor,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    value.allOrder[index].prize,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: blueColor,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                              : SizedBox(),
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

class TimerClass extends StatefulWidget {
  String parcelId;

  TimerClass({required this.parcelId});

  @override
  _TimerClassState createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
  SettingController _settingController = Get.find();
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 120;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout() {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        if (_settingController.order.isNotEmpty) {
          timer.cancel();
        } else if (timer.tick == 120) {
          _showMyDialog(context);
        }
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    _settingController.getOrders(widget.parcelId);
    print('ordrs initalaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/located.png',
                        ),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100.0,
                          ),
                          Center(
                            child: buildTimer(),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "تم إرسال طلبك للمندوبين",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          const Text(
                            "الرجاء الانتظار حتى حتى يقوم أحد المناديب بقبول طلبك",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "شكرا",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _settingController.order.isNotEmpty
                      ? Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            child: Container(
                              child: GetBuilder<SettingController>(
                                builder: (value) => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: value.order.length,
                                    itemBuilder: (context, index) {
                                      double dropLocationDistanse = value.calculateDistance(
                                          value.order[index].lat.toDouble(),
                                          value.order[index].long.toDouble(),
                                          value.order[index].dropLocationLat.toDouble(),
                                          value.order[index].dropLocationLong.toDouble());
                                      double pickLocationDistance = value.calculateDistance(
                                          value.order[index].lat.toDouble(),
                                          value.order[index].long.toDouble(),
                                          value.order[index].pickLocationLat.toDouble(),
                                          value.order[index].pickLocationLong.toDouble());

                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (ctx) => MapLocationScreen(
                                                        index: index,
                                                      )));
                                        },
                                        child: Card(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(left: 10, right: 20),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              value.updateOrderRequest(value.order[index].id);
                                                              // final snackbar = SnackbarHelper.instance..injectContext(context);
                                                              // snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'طلب القبول'));
                                                              // return;
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (ctx) => Chatapp(
                                                                            index: index,
                                                                          )));
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                              decoration: BoxDecoration(
                                                                color: lightblueColor,
                                                                borderRadius: BorderRadius.circular(5),
                                                                border: Border.all(
                                                                  color: blueColor,
                                                                ),
                                                              ),
                                                              child: const Center(
                                                                child: Text(
                                                                  'قبول',
                                                                  style: TextStyle(
                                                                    fontSize: 11,
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                              border: Border.all(
                                                                color: Colors.grey,
                                                              ),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'رفض',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors.grey,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                value.order[index].creatorId.firstName,
                                                                style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            width: 45,
                                                            height: 45,
                                                            decoration: BoxDecoration(
                                                                color: Colors.blue,
                                                                shape: BoxShape.circle,
                                                                image: value.order[index].creatorId.yourImage.isNotEmpty
                                                                    ? DecorationImage(
                                                                        image:
                                                                            NetworkImage(value.order[index].creatorId.yourImage),
                                                                        fit: BoxFit.cover)
                                                                    : null),
                                                            alignment: Alignment.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(children: [
                                                  Column(children: [
                                                    Image.asset(
                                                      'assets/location.png',
                                                      height: 35,
                                                      color: blueColor,
                                                    ),
                                                    const Text(
                                                      'تسليم',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: blueColor,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ]),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                        color: blueColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            'كم',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: blueColor,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            pickLocationDistance.toStringAsFixed(1),
                                                            style: const TextStyle(
                                                              fontSize: 11,
                                                              color: blueColor,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Column(children: [
                                                    Image.asset(
                                                      'assets/box.png',
                                                      height: 35,
                                                      color: blueColor,
                                                    ),
                                                    const Text(
                                                      'استلام',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: blueColor,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ]),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: blueColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                        color: blueColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            'كم',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: blueColor,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            dropLocationDistanse.toStringAsFixed(1),
                                                            style: const TextStyle(
                                                              fontSize: 11,
                                                              color: blueColor,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(children: [
                                                    Image.asset(
                                                      'assets/person1.png',
                                                      height: 20,
                                                      color: blueColor,
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    const Text(
                                                      'أنت',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: blueColor,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ])
                                                ]),
                                                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                    margin: EdgeInsets.only(right: 20),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                        color: blueColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        ' قيمة العرض : ريال ' + '${value.order[index].prize}',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: blueColor,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ])
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          )),
    );
  }

  Future<bool> _showMyDialog(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            height: 150,
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'إعادة إرسال طلب المتسابق',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff28476E),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                      startTimeout();
                      Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          decoration: BoxDecoration(color: Color(0xff99DEF8), borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('إعادة إرسال',
                                style: TextStyle(
                                  color: Color(0xff28476E),
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomApp()));
                        });
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
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

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget buildTimer() => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: currentSeconds / timerMaxSeconds,
              valueColor: const AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 6,
              backgroundColor: blueColor,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Icon(Icons.timer),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    timerText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
