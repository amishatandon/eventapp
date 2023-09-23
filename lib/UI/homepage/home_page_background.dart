import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  const HomePageBackground({
    super.key,
    required this.screenHeight,
  });
// ignore: prefer_typing_uninitialized_variables
  final screenHeight;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ThemeData = Theme.of(context);
    return ClipPath(
      //to clip the widget into any desired shape.
      clipper: BottomShapeClipper(),
      child: Container(
        height: screenHeight * 0.6,
        color: ThemeData.primaryColor,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveEndPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveStartPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
