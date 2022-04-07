import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/common/empty_image_container.dart';
import 'package:truckdelivery/common/placeholder_image.dart';
import 'package:truckdelivery/constant.dart';
import 'package:truckdelivery/controller/setting_controller.dart';
import 'package:truckdelivery/pages/crainScreen.dart';
import 'package:truckdelivery/pages/localDriver.dart';
import 'package:truckdelivery/pages/profile.dart';
import 'package:truckdelivery/pages/shifting.dart';
import 'package:truckdelivery/pages/tanker_screen.dart';
import 'delivery.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL6bmlIucVIfLAFFsZQ6A51YM3JwBOCMoryw&usqp=CAU',
    'https://cdn.pixabay.com/photo/2020/12/22/14/44/car-5852408_960_720.jpg',
  ];

  SettingController settingController = Get.put(SettingController());

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
                padding: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
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
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<SettingController>(
                                builder: (value) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => ProfilePage()));
                                  },
                                  child:
                                  CachedNetworkImage(
                                    imageUrl: value.userModel!.image,
                                    imageBuilder: (context, imageProvider) => Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: blueColor, width: 1),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => const PlaceHolderImage(width: 50, height: 50),
                                    errorWidget: (context, url, error) => const EmptyImageContainer(width: 50, height: 50),
                                  ),


                                  // child: Container(
                                  //   width: 100,
                                  //   height: 40,
                                  //   decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Colors.blue,
                                  //       image: value.userModel?.image != null || value.userModel!.image.isNotEmpty
                                  //           ? DecorationImage(image: NetworkImage(value.userModel!.image), fit: BoxFit.cover)
                                  //           : DecorationImage(image: AssetImage('assets/empty_image.png'),fit: BoxFit.cover)),
                                  //   alignment: Alignment.center,
                                  // ),
                                ),
                              ),
                              // Image.asset('assets/mic.png'),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'الدعم',
                                textAlign: TextAlign.right,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Swiper(
                              itemCount: imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Image(
                                  image: NetworkImage(imageList[index]),
                                  fit: BoxFit.cover,
                                );
                              },
                              layout: SwiperLayout.DEFAULT,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => Delivery(
                                                    isOutCity: 0,
                                                    carTile: '',
                                                  )));
                                    },
                                    child: myContainer('نقل بضائع عامة', 'assets/home3.png'),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => Delivery(
                                                    isOutCity: 1,
                                                    carTile: '',
                                                  )));
                                    },
                                    child: myContainer('نقل طرود', 'assets/home2.png'),
                                  )),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (ctx) =>Delivery(
                                                      isOutCity: 3,
                                                      carTile: '',
                                                    )));
                                          },
                                          child: myContainer('نقل مواشي', 'assets/animals.png'))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => Shifting(
                                                    isOutFurniture: false,
                                                  )));
                                    },
                                    child: myContainer('نقل عفش', 'assets/home4.png'),
                                  )),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => TankerScreen(
                                                isOutFurniture: false,
                                                  )));
                                    },
                                    child: myContainer('صهاريج الماء', 'assets/tanker.png'),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => LocalDriver(
                                                isOutTruck: true,
                                              )));
                                    },
                                    child: myContainer('نقل سيارات', 'assets/home6.png'),
                                  )),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (ctx) => Crain(
                                                    isOutFurniture: true,
                                                  )));
                                        },
                                        child: myContainer('معدات المقاولات', 'assets/crain.png'),
                                      )),
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
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

  Widget myContainer(String text, image) {
    return Container(
      height: 120,
      // padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.only(bottom: 10, top: 10,right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff698db3), Colors.black.withOpacity(0.1)]),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
