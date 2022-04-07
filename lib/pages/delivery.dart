import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:truckdelivery/constant.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/helper/get_storage_helper.dart';
import 'package:truckdelivery/pages/detail.dart';
import 'package:truckdelivery/pages/paymethod.dart';
import 'package:truckdelivery/pages/tanker_detail_screen.dart';

class Delivery extends StatefulWidget {
  final int isOutCity;
  final String carTile;

  Delivery({required this.isOutCity, required this.carTile});

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  DeliveryController deliveryController = Get.put(DeliveryController());
  GetStorageHelper getStorageHelper = GetStorageHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<DeliveryController>(builder: (_deliveryController) {
          final kInitialPosition =
              LatLng(_deliveryController.position?.latitude ?? 0, _deliveryController.position?.longitude ?? 0);
          return SafeArea(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.isOutCity == 0
                                  ? 'assets/home3.png'
                                  : widget.isOutCity == 1
                                  ? 'assets/home2.png'
                                  : widget.isOutCity == 3
                                  ? 'assets/animals.png'
                                  : widget.isOutCity == 4
                                  ? 'assets/home4.png'
                                  : widget.isOutCity == 5
                                  ? 'assets/tanker.png'
                                  : widget.isOutCity == 6
                                  ? 'assets/home6.png'
                                  : 'assets/crain.png'),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff457ab1), Colors.black.withOpacity(0.2)]),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/backButton.png')),
                        Expanded(
                          child: Text(
                            widget.isOutCity == 0
                                ? 'نقل بضائع عامة'
                                : widget.isOutCity == 1
                                ? 'نقل طرود'
                                : widget.isOutCity == 3
                                ? 'نقل مواشي'
                                : widget.isOutCity == 4
                                ? 'نقل عفش'
                                : widget.isOutCity == 5
                                ? 'صهاريج الماء'
                                : widget.isOutCity == 6
                                ? 'نقل سيارات'
                                : 'معدات المقاولات',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: PlacePicker(
                    apiKey: 'AIzaSyDFqEeg_cOa37dAhv1GG5ANkPJ9T2gxv2g',
                    initialPosition: kInitialPosition,
                    useCurrentLocation: true,
                    selectInitialPosition: true,
                    usePlaceDetailSearch: true,
                    onPlacePicked: (result) {
                      _deliveryController.isCheckedPick == true
                          ? _deliveryController.pickselectedPlace = result
                          : _deliveryController.dropselectedPlace = result;
                      // Navigator.of(context).pop();
                      // setState(() {});
                    },
                    forceSearchOnZoomChanged: true,
                    automaticallyImplyAppBarLeading: false,
                    usePinPointingSearch: true,
                    enableMyLocationButton: false,
                    hintText: 'الصق احداثيات جوجل ماب او اختر من الخريطة',

                    // autocompleteLanguage: "ko",
                    // region: 'au',
                    selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                      print("state: $state, isSearchBarFocused: $selectedPlace");
                      if (_deliveryController.isCheckedPick == true) {
                        _deliveryController.pickselectedPlace = selectedPlace;
                        UserPicUp userPickUp = UserPicUp(
                          pickLocationLat: selectedPlace?.geometry?.location.lat ?? 0,
                          pickLocationLong: selectedPlace?.geometry?.location.lng ?? 0,
                          pickAddress: selectedPlace?.formattedAddress.toString() ?? '',
                        );
                        getStorageHelper.storePickUp(userPickUp);
                      } else {
                        _deliveryController.dropselectedPlace = selectedPlace;
                        // UserDrop userDrop = UserDrop(
                        //     dropLocationLat: selectedPlace!.geometry!.location.lat,
                        //     dropLocationLong: selectedPlace.geometry!.location.lng);
                        // getStorageHelper.storeDrop(userDrop);
                      }
                      return isSearchBarFocused
                          ? Container()
                          : FloatingCard(
                              bottomPosition: 10.0,
                              // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                              leftPosition: 20.0,
                              rightPosition: 20.0,
                              width: 400,
                              borderRadius: BorderRadius.circular(12.0),
                              child: state == SearchingState.Searching
                                  ? Center(child: CircularProgressIndicator())
                                  : Container(
                                      child: Column(children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: Color(0xffE3F3F9),
                                              borderRadius:
                                                  BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _deliveryController.isCheckedPick == true
                                                      ? 'مكان استلام الطرد'
                                                      : 'مكان تسليم الطرد',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(color: Color(0xff28476E), fontSize: 25),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.white,
                                              thickness: 2,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '${selectedPlace?.formattedAddress}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: TextStyle(color: Color(0xff28476E), fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Row(
                                            //   children: [
                                            //     Text(
                                            //       '${selectedPlace?.geometry?.location.lat},${selectedPlace?.geometry?.location.lat}',
                                            //       textAlign: TextAlign.right,
                                            //       style: TextStyle(color: Color(0xff28476E), fontSize: 15),
                                            //     ),
                                            //   ],
                                            // ),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (_deliveryController.isCheckedPick == true) {
                                              _deliveryController.isCheckedPick = false;
                                              setState(() {});
                                            } else {
                                              _deliveryController.addMarker();
                                              _deliveryController.isCheckedPick = true;
                                              if (widget.isOutCity == 6) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (ctx) => DetailPage(
                                                              isOutCity: widget.isOutCity,
                                                              carTitle: widget.carTile,
                                                            )));
                                              }
                                              else if (widget.isOutCity == 5) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (ctx) => TankerDetailScreen(
                                                          isOutCity: widget.isOutCity,
                                                          carTitle: widget.carTile,
                                                        )));
                                              }
                                              else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (ctx) => PaymentMethod(
                                                              isOutCity: widget.isOutCity,
                                                              carTitle: widget.carTile,
                                                            )));
                                              }
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20),
                                              ),
                                              color: _deliveryController.isCheckedPick ? Color(0xff99DEF8) : Color(0xff28476E),
                                            ),
                                            child: Center(
                                              child: Text(
                                                _deliveryController.isCheckedPick == true
                                                    ? 'تأكيد مكان استلام الطرد'
                                                    : 'تأكيد مكان تسليم الطرد',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: _deliveryController.isCheckedPick ? Color(0xff28476E) : Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ));
                    },
                    pinBuilder: (context, state) {
                      if (state == PinState.Idle) {
                        return Image.asset(
                          'assets/tanker1.png',
                          //color: blueColor,
                          width: 50,
                          height: 50,
                        );
                      } else {
                        return Icon(
                          Icons.not_listed_location,
                          size: 50,
                          color: blueColor,
                        );
                      }
                    },
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 50),
                //   child: Row(
                //     children: [
                //       InkWell(
                //           onTap: () {
                //             Navigator.pop(context);
                //           },
                //           child: Image.asset('assets/backButton.png')),
                //       Expanded(
                //         child: Text(
                //           widget.isOutCity == 0
                //               ? 'نقل بضائع عامة'
                //               : widget.isOutCity == 1
                //                   ? 'نقل طرود'
                //                   : widget.isOutCity == 3
                //                       ? 'نقل مواشي'
                //                       : widget.isOutCity == 4
                //                           ? 'نقل عفش'
                //                           : widget.isOutCity == 5
                //                               ? 'صهاريج الماء'
                //                               : widget.isOutCity == 6
                //                                   ? 'نقل سيارات'
                //                                   : 'معدات المقاولات',
                //           maxLines: 1,
                //           textAlign: TextAlign.center,
                //           style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

              ],
            ),
          );
        }));
  }
}
