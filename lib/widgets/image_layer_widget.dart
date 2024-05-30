import 'package:flutter/material.dart';
import '../models/layer.dart';
import '../utils/error_handler.dart';

class ImageLayerWidget extends StatelessWidget {
  final Layer layer;

  const ImageLayerWidget({super.key, required this.layer});

  @override
  Widget build(BuildContext context) {
    return ErrorHandler.handleError(() {
      final position = layer.position!;
      return Positioned(
        left: position.x,
        top: position.y,
        child: Image.network(
          layer.url ?? '',
          width: layer.width,
          height: layer.height,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      );
    });
  }
}