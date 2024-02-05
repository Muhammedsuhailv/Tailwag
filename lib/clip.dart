// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class BottomCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final Path path = Path();
//     path.lineTo(0, size.height - 30); // Adjust the value to control the depth of the curve
//     final controlPoint = Offset(size.width / 2, size.height);
//     final endPoint = Offset(size.width, size.height - 30); // Adjust the value to control the depth of the curve
//
//     path.quadraticBezierTo(
//       controlPoint.dx,
//       controlPoint.dy,
//       endPoint.dx,
//       endPoint.dy,
//     );
//
//     path.lineTo(size.width, 0);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
