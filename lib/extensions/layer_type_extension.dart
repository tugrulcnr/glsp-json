import '../enum/layer_type.dart';

extension LayerTypeExtension on String {
  LayerType get toLayerType {
    switch (this) {
      case 'text':
        return LayerType.text;
      case 'image':
        return LayerType.image;
      case 'rectangle':
        return LayerType.rectangle;
      case 'circle':
        return LayerType.circle;
      case 'line':
        return LayerType.line;
      case 'ellipse':
        return LayerType.ellipse;
      case 'polygon':
        return LayerType.polygon;
      default:
        throw Exception('Invalid layer type');
    }
  }
}