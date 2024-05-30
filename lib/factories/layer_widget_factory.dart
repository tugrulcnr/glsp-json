import 'package:flutter/material.dart';
import 'package:glsp_json/extensions/layer_type_extension.dart';
import '../enum/layer_type.dart';
import '../models/layer.dart';
import '../widgets/circle_layer_widget.dart';
import '../widgets/ellipse_layer_widget.dart';
import '../widgets/image_layer_widget.dart';
import '../widgets/line_layer_widget.dart';
import '../widgets/polygon_layer_widget.dart';
import '../widgets/rectangle_layer_widget.dart';
import '../widgets/text_layer_widget.dart';

class LayerWidgetFactory {
  static Widget create(Layer layer) {
    switch (layer.type.toLayerType) {
      case LayerType.text:
        return TextLayerWidget(layer: layer);
      case LayerType.image:
        return ImageLayerWidget(layer: layer);
      case LayerType.rectangle:
        return RectangleLayerWidget(layer: layer);
      case LayerType.circle:
        return CircleLayerWidget(layer: layer);
      case LayerType.line:
        return LineLayerWidget(layer: layer);
      case LayerType.ellipse:
        return EllipseLayerWidget(layer: layer);
      case LayerType.polygon:
        return PolygonLayerWidget(layer: layer);
    }
  }
}