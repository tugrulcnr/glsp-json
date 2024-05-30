import 'package:flutter/material.dart';
import 'package:glsp_json/utils/strings.dart';
import '../models/layer.dart';
import '../utils/error_handler.dart';
import '../extensions/color_extension.dart';

class RectangleLayerWidget extends StatelessWidget {
  final Layer layer;

  const RectangleLayerWidget({super.key, required this.layer});

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
          color: (layer.color ?? Strings.defColor).toColor(),
        ),
      );
    });
  }
}
