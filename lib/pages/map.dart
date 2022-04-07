import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:truckdelivery/controller/setting_controller.dart';

class MapLocationScreen extends StatefulWidget {
  var  index;
  MapLocationScreen({this.index});

  @override
  _MapLocationScreenState createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {

  List<Marker> _markers = <Marker>[];
  BitmapDescriptor? pinMarker;

  SettingController orderController=Get.find();
  GoogleMapController? _controller;
  var bitmapIcon;
  var bitmapIcon2;
  var bitmapIcon3;

  setMarkerIcons()async{
    bitmapIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size:  Size(48,48)), 'assets/add.png');
    bitmapIcon2 = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(48,48)), 'assets/alarm.png');
    bitmapIcon3 = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(48,48)), 'assets/applw_ic.png');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
   });

    _markers.add(
        Marker(
            markerId: const MarkerId("My Pickup"),
            position: LatLng(orderController.order[widget.index].pickLocationLat.toDouble(),orderController.order[widget.index].pickLocationLong.toDouble()),
            // icon: pinMarker.toJson(),
            infoWindow: InfoWindow(
                title: "My Pickup Location"
            )
        )
    );
    _markers.add(
        Marker(
            markerId: const MarkerId('My Drop'),
            position: LatLng(orderController.order[widget.index].dropLocationLat.toDouble(),orderController.order[widget.index].dropLocationLong.toDouble()),
            // icon: bitmapIcon2,
            infoWindow: InfoWindow(
                title: "My Drop Location"
            )
        )
    );
    _markers.add(
        Marker(
            markerId: MarkerId('Delivery Boy'),
            position: LatLng(orderController.order[widget.index].lat.toDouble() ,orderController.order[widget.index].long.toDouble()),
            // icon: bitmapIcon3,
            infoWindow: InfoWindow(
                title: orderController.userModel?.firstName??''
            )
        )
    );

  }

  @override
  Widget build(BuildContext context) {


    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(orderController.order[widget.index].dropLocationLat.toDouble(),orderController.order[widget.index].dropLocationLong.toDouble()),
        zoom: 12.0,
      ),
      mapType: MapType.normal,
      markers: Set<Marker>.of(_markers),
      onMapCreated: (GoogleMapController controller) {
        _controller=controller;
      },
      myLocationEnabled: true,
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
    );
  }


}