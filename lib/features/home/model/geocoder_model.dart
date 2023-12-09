import 'dart:convert';

class GeocodingModel {
  String name;
  double lat;
  double lon;
  String country;

  GeocodingModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory GeocodingModel.fromRawJson(String str) =>
      GeocodingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeocodingModel.fromJson(Map<String, dynamic> json) => GeocodingModel(
        name: json["name"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
        "lon": lon,
        "country": country,
      };
}
