import 'package:flutter/material.dart';
import '../models/layer.dart';
import '../extensions/color_extension.dart';
import '../utils/error_handler.dart';
import '../utils/strings.dart';

class EllipseLayerWidget extends StatelessWidget {
  final Layer layer;

  const EllipseLayerWidget({super.key, required this.layer});

  @override
  Widget build(BuildContext context) {
    return ErrorHandler.handleError(() {
      final position = layer.position!;
      return Positioned(
        left: position.x,
        top: position.y,
        child: Container(
          width: layer.width ?? 0,
          height: layer.height ?? 0,
          decoration: BoxDecoration(
            color: (layer.color ?? Strings.defColor).toColor(),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.elliptical(
                (layer.width ?? 0) / 2, (layer.height ?? 0) / 2)),
          ),
        ),
      );
    });
  }
}
