import 'package:flutter/material.dart';
import '../models/layer.dart';
import '../utils/error_handler.dart';
import '../extensions/color_extension.dart';
import '../utils/strings.dart';

class CircleLayerWidget extends StatelessWidget {
  final Layer layer;

  const CircleLayerWidget({super.key, required this.layer});

  @override
  Widget build(BuildContext context) {
    return ErrorHandler.handleError(() {
      final position = layer.position!;
      return Positioned(
        left: position.x,
        top: position.y,
        child: Container(
          width: (layer.radius ?? 0) * 2,
          height: (layer.radius ?? 0) * 2,
          decoration: BoxDecoration(
            color: (layer.color ?? Strings.defColor).toColor(),
            shape: BoxShape.circle,
          ),
        ),
      );
    });
  }
}
