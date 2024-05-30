import 'package:flutter/material.dart';
import 'package:glsp_json/utils/strings.dart';
import '../models/layer.dart';
import '../utils/error_handler.dart';
import '../extensions/color_extension.dart';

class PolygonLayerWidget extends StatelessWidget {
  final Layer layer;

  const PolygonLayerWidget({super.key, required this.layer});

  @override
  Widget build(BuildContext context) {
    return ErrorHandler.handleError(() {
      final path = Path();
      final points = layer.points ?? [];
      if (points.isNotEmpty) {
        path.moveTo(points.first.x, points.first.y);
        for (var point in points.skip(1)) {
          path.lineTo(point.x, point.y);
        }
        path.close();
      }
      return Positioned(
        left: 0,
        top: 0,
        child: CustomPaint(
          painter: _PolygonPainter(
            path,
            (layer.color ?? Strings.defColor).toColor(),
          ),
        ),
      );
    });
  }
}

class _PolygonPainter extends CustomPainter {
  final Path path;
  final Color color;

  _PolygonPainter(this.path, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
