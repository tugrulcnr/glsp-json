import 'package:flutter/material.dart';
import '../models/layer.dart';
import '../models/position.dart';
import '../utils/error_handler.dart';
import '../extensions/color_extension.dart';
import '../utils/strings.dart';

class LineLayerWidget extends StatelessWidget {
  final Layer layer;

  const LineLayerWidget({super.key, required this.layer});

  @override
  Widget build(BuildContext context) {
    return ErrorHandler.handleError(() {
      final start = layer.start!;
      final end = layer.end!;
      return Positioned(
        left: 0,
        top: 0,
        child: CustomPaint(
          painter: _LinePainter(
            start,
            end,
            (layer.color ?? Strings.lineDefColor).toColor(),
            layer.width ?? 1,
          ),
        ),
      );
    });
  }
}

class _LinePainter extends CustomPainter {
  final Position start;
  final Position end;
  final Color color;
  final double strokeWidth;

  _LinePainter(this.start, this.end, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(start.x, start.y), Offset(end.x, end.y), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
