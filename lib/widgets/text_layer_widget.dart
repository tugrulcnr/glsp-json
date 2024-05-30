import 'package:flutter/material.dart';
import 'package:glsp_json/utils/strings.dart';
import '../models/layer.dart';
import '../utils/error_handler.dart';
import '../extensions/color_extension.dart';

class TextLayerWidget extends StatelessWidget {
  final Layer layer;

  const TextLayerWidget({super.key, required this.layer});

  @override
  Widget build(BuildContext context) {
    return ErrorHandler.handleError(() {
      final position = layer.position!;
      return Positioned(
        left: position.x,
        top: position.y,
        child: Text(
          layer.value ?? Strings.noText,
          style: TextStyle(
            fontSize: layer.fontSize ?? 14,
            color: (layer.color ?? Strings.lineDefColor).toColor(),
          ),
        ),
      );
    });
  }
}
