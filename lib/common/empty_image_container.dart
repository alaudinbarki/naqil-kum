import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class EmptyImageContainer extends StatelessWidget {
  final double width;
  final double height;

  const EmptyImageContainer({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 1),
        image: const DecorationImage(
          image: AssetImage('assets/empty_image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
