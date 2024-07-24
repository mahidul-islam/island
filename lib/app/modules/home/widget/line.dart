import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  LinePainter(
      {required this.key, required Listenable repaint, required this.points})
      : super(repaint: repaint);

  final List<Offset?> points;
  final GlobalKey key;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
            _globalToLocal(points[i]!), _globalToLocal(points[i + 1]!), paint);
      }
    }
  }

  Offset _globalToLocal(Offset globalOffset) {
    // print(globalOffset.toString());
    final renderObject = key.currentContext?.findRenderObject() as RenderBox;
    final offset = renderObject.globalToLocal(globalOffset);
    // print(offset.toString());
    return offset;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
