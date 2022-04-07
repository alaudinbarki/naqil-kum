import 'package:flutter/material.dart';
import 'package:truckdelivery/constant.dart';

class PlaceHolderImage extends StatelessWidget {
  final double width;
  final double height;

  const PlaceHolderImage({
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: height,
        height: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        border: Border.all(color:Colors.blue, width: 1),
      ),
        child: const Center(child:  CircularProgressIndicator(backgroundColor: blueColor,)),
      );
  }
}
