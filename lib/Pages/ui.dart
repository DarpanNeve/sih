import 'package:flutter/material.dart';

class ColorGradientBackground extends StatelessWidget {
  const ColorGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: BackgroundPainter(),
        child: const Center(
          child: Text("Hello  world"),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color.fromARGB(136, 104, 195, 204); // Change the color as needed
    final path = Path();
    final startPoint = Offset(0, size.height * 0.2);
    final endPoint = Offset(size.width, size.height * 0.8);
    path.moveTo(startPoint.dx, startPoint.dy);
    path.lineTo(endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
