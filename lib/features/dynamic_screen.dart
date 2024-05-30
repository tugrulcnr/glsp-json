import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../factories/layer_widget_factory.dart';
import '../models/layers_response.dart';
import '../utils/strings.dart';

class DynamicScreen extends StatefulWidget {
  const DynamicScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DynamicScreenState createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  late Future<LayersResponse> _layersResponse;

  @override
  void initState() {
    super.initState();
    _layersResponse = loadLayers();
  }

  Future<LayersResponse> loadLayers() async {
    final jsonString = await rootBundle.loadString(Strings.assetPath);
    final jsonResponse = json.decode(jsonString);
    return LayersResponse.fromJson(jsonResponse);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<LayersResponse>(
        future: _layersResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text(Strings.loadingMessage));
          } else if (snapshot.hasError) {
            return Center(
                child: Text('${Strings.errorMessage} ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.layers.isEmpty) {
            return const Center(child: Text(Strings.noDataMessage));
          } else {
            final layers = snapshot.data!.layers;
            return Stack(
              children: layers
                  .map((layer) => LayerWidgetFactory.create(layer))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
