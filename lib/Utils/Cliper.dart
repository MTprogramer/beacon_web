
import 'package:flutter/cupertino.dart';

class ExactPlanClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 25.0; // Rounded corners for the bottom and right
    double cutHeight = size.height * 0.42; // Where the slant starts on the left
    double cutWidth = size.width * 0.8;   // Where the slant ends on the top

    Path path = Path();

    // Start at the left edge where the slant begins
    path.moveTo(0, cutHeight);

    // The Slant: Line to the top edge
    path.lineTo(cutWidth, 0);

    // Top Right Corner
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Bottom Right Corner
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);

    // Bottom Left Corner
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Back to the start of the slant
    path.lineTo(0, cutHeight);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

