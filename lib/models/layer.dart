import 'position.dart';

class Layer {
  final String type;
  final String? value;
  final String? url;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final String? color;
  final Position? position;
  final Position? start;
  final Position? end;
  final List<Position>? points;

  Layer({
    required this.type,
    this.value,
    this.url,
    this.width,
    this.height,
    this.radius,
    this.fontSize,
    this.color,
    this.position,
    this.start,
    this.end,
    this.points,
  });

  factory Layer.fromJson(Map<String, dynamic> json) {
    List<Position>? points;
    if (json['points'] != null) {
      points = (json['points'] as List)
          .map((pointJson) => Position.fromJson(pointJson))
          .toList();
    }
    return Layer(
      type: json['type'] ?? '',
      value: json['value'],
      url: json['url'],
      width: json['width']?.toDouble(),
      height: json['height']?.toDouble(),
      radius: json['radius']?.toDouble(),
      fontSize: json['fontSize']?.toDouble(),
      color: json['color'],
      position: json['position'] != null
          ? Position.fromJson(json['position'])
          : null,
      start: json['start'] != null ? Position.fromJson(json['start']) : null,
      end: json['end'] != null ? Position.fromJson(json['end']) : null,
      points: points,
    );
  }
}

