import 'layer.dart';

class LayersResponse {
  final List<Layer> layers;

  LayersResponse({required this.layers});

  factory LayersResponse.fromJson(Map<String, dynamic> json) {
    var layersJson = json['layers'] as List;
    List<Layer> layersList = layersJson.map((i) => Layer.fromJson(i)).toList();
    return LayersResponse(layers: layersList);
  }
}