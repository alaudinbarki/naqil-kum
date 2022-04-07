import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:truckdelivery/constant.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool switchControl = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              Card(
                elevation: 3,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 20, bottom: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Settings()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Text(
                          'الإعدادت',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: blueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'الطلبات',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: blueColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  Text(
                    '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: blueColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              image:
                              //DecorationImage(image: NetworkImage(value.userModel!.yourImage), fit: BoxFit.cover):
                              null),
                          alignment: Alignment.center,
                        ),
                      Column(children: [

                           Text(
                            '',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          unratedColor: Colors.grey[300],
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // container for detail


              SingleChildScrollView(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (ctx) => OrderDetail(index: index,)));
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
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Image.asset('assets/timer.png'),
                                                          Row(
                                                            children: const [
                                                              Text(
                                                                'دقيقة',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: blueColor,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                '1',
                                                                style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: blueColor,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
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
                                                            'دفع اونلاين',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
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
                                                            'دفع كاش',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors.grey,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '',
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                        ),
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
                                                            image:
                                                                 // DecorationImage(
                                                                 //    image: NetworkImage(value.parcelList[index].creatorId.image),
                                                                 //    fit: BoxFit.cover)
                                                                // :
                                                            null),
                                                        alignment: Alignment.center,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(right: 70),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: const [
                                                  Text(
                                                    'عصير تفاح الربيع',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '1',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' + ',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'ببسي',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '1',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w600,
                                                    ),
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
                                                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(
                                                    color: blueColor,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        'كم',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: blueColor,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        '1',
                                                        style: TextStyle(
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
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(
                                                      color: blueColor,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      children: const [
                                                        Text(
                                                          'كم',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: blueColor,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          '1',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: blueColor,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                              const CircleAvatar(
                                                radius: 12,
                                                backgroundColor: lightblueColor,
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: blueColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
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
                                            ])
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )


            ]),
          ),
        ),
      ),
    );
  }
}
