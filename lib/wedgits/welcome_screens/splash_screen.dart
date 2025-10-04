import 'package:flutter/material.dart';

class StylishSplashScreen extends StatelessWidget {
  const StylishSplashScreen({super.key});

  // Define the colors based on the image
  static const Color backgroundColor = Color(0xFF1B1B25); // Dark background
  static const Color stylishColor = Color(0xFF9C27B0);      // Purple color from image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main logo
            LazaLogo(),
            SizedBox(height: 40), // Space between logo and text
            // Powered by text
            Text(
              'Powered by Team 1',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LazaLogo extends StatelessWidget {
  const LazaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    // Larger font size to match the image
    const double fontSize = 60.0;
    const Color stylishColor = StylishSplashScreen.stylishColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // The main 'laza' text
        const Text(
          'Stylish',
          style: TextStyle(
            color: stylishColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 8), // Small spacing between text and underline
        // Use CustomPaint for more accurate curved underline
        CustomPaint(
          size: const Size(80, 15), // Width and height for the canvas
          painter: LazaUnderlinePainter(stylishColor),
        ),
      ],
    );
  }
}


class LazaUnderlinePainter extends CustomPainter {
  final Color lineColor;

  LazaUnderlinePainter(this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final Path path = Path();

    // Start under 'z' - positioned slightly to the left
    path.moveTo(5, size.height * 0.3);

    // Draw a curved line that goes under 'za' with a subtle swoosh
    // The curve starts flat under 'z' and curves down then up under 'a'
    path.quadraticBezierTo(
      size.width * 0.4, // Control Point X (middle of curve)
      size.height * 0.9, // Control Point Y (pulls the curve down)
      size.width - 5, // End Point X (under 'a')
      size.height * 0.2, // End Point Y (slightly up from start)
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
