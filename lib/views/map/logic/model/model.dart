import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';


class WayPointPolylineModel {
  WayPointPolylineModel(
      {required this.routes,
        required this.status,
        required this.polylinePoints,
        required this.polylinePointsString});

  List<Route> routes;
  String status;
  List<LatLng> polylinePoints;
  String polylinePointsString;

  factory WayPointPolylineModel.fromJson(Map<String, dynamic> json) {
    List<LatLng> polyline = [];

    for (int i = 0;
    i < ((json["routes"] as List)[0]["legs"] as List).length;
    i++) {
      for (var step
      in ((json["routes"] as List)[0]['legs'][i]["steps"] as List)) {
        polyline.addAll(Utility.decode(step['polyline']['points']));
      }
    }

    return WayPointPolylineModel(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        polylinePointsString: Utility.encode(polyline),
        polylinePoints: polyline,
        status: json["status"]);
  }
}

class Route {
  Route({
    required this.bounds,
    required this.copyrights,
    required this.legs,
    required this.overviewPolyline,
    required this.summary,
    required this.warnings,
    required this.waypointOrder,
  });

  Bounds bounds;
  String copyrights;
  List<Leg> legs;
  PolylineData overviewPolyline;
  String summary;
  List<dynamic> warnings;
  List<int> waypointOrder;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    bounds: Bounds.fromJson(json["bounds"]),
    copyrights: json["copyrights"],
    legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
    overviewPolyline: PolylineData.fromJson(json["overview_polyline"]),
    summary: json["summary"],
    warnings: List<dynamic>.from(json["warnings"].map((x) => x)),
    waypointOrder: List<int>.from(json["waypoint_order"].map((x) => x)),
  );
}

class Bounds {
  Bounds({
    required this.northeast,
    required this.southwest,
  });

  Northeast northeast;
  Northeast southwest;

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
    northeast: Northeast.fromJson(json["northeast"]),
    southwest: Northeast.fromJson(json["southwest"]),
  );
}

class Northeast {
  Northeast({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Northeast.fromJson(Map<String, dynamic> json) => Northeast(
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
  );
}

class Leg {
  Leg({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.steps,
    required this.trafficSpeedEntry,
    required this.viaWaypoint,
  });

  Distance distance;
  Distance duration;
  String endAddress;
  Northeast endLocation;
  String startAddress;
  Northeast startLocation;
  List<Step> steps;
  List<dynamic> trafficSpeedEntry;
  List<dynamic> viaWaypoint;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    distance: Distance.fromJson(json["distance"]),
    duration: Distance.fromJson(json["duration"]),
    endAddress: json["end_address"],
    endLocation: Northeast.fromJson(json["end_location"]),
    startAddress: json["start_address"],
    startLocation: Northeast.fromJson(json["start_location"]),
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
    trafficSpeedEntry:
    List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
    viaWaypoint: List<dynamic>.from(json["via_waypoint"].map((x) => x)),
  );
}

class Distance {
  Distance({
    required this.text,
    required this.value,
  });

  String text;
  int value;

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
    text: json["text"],
    value: json["value"],
  );
}

class Step {
  Step({
    required this.distance,
    required this.duration,
    required this.endLocation,
    required this.htmlInstructions,
    required this.polyline,
    required this.startLocation,
  });

  Distance distance;
  Distance duration;
  Northeast endLocation;
  String htmlInstructions;
  PolylineData polyline;
  Northeast startLocation;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    distance: Distance.fromJson(json["distance"]),
    duration: Distance.fromJson(json["duration"]),
    endLocation: Northeast.fromJson(json["end_location"]),
    htmlInstructions: json["html_instructions"],
    polyline: PolylineData.fromJson(json["polyline"]),
    startLocation: Northeast.fromJson(json["start_location"]),
  );
}

class PolylineData {
  PolylineData({required this.points});

  String points;

  factory PolylineData.fromJson(Map<String, dynamic> json) =>
      PolylineData(points: json["points"]);

  Map<String, dynamic> toJson() => {"points": points};
}
class Utility {

  static List<LatLng> decode(String polyline, {int accuracyExponent = 5}) {
    final accuracyMultiplier = pow(10, accuracyExponent);
    final List<LatLng> coordinates = [];

    int index = 0;
    int lat = 0;
    int lng = 0;

    while (index < polyline.length) {
      int char;
      int shift = 0;
      int result = 0;

      /// Method for getting *only* `1` coorditane `latitude` or `longitude` at a time
      int getCoordinate() {
        /// Iterating while value is grater or equal of `32-bits` size
        do {
          /// Substract `63` from `codeUnit`.
          char = polyline.codeUnitAt(index++) - 63;

          /// `AND` each `char` with `0x1f` to get 5-bit chunks.
          /// Then `OR` each `char` with `result`.
          /// Then left-shift for `shift` bits
          result |= (char & 0x1f) << shift;
          shift += 5;
        } while (char >= 0x20);

        /// Inversion of both:
        ///
        ///  * Left-shift the `value` for one bit
        ///  * Inversion `value` if it is negative
        final value = result >> 1;
        final coordinateChange =
        (result & 1) != 0 ? (~BigInt.from(value)).toInt() : value;

        /// It is needed to clear `shift` and `result` for next coordinate.
        shift = result = 0;

        return coordinateChange;
      }

      lat += getCoordinate();
      lng += getCoordinate();

      coordinates
          .add(LatLng(lat / accuracyMultiplier, lng / accuracyMultiplier));
    }

    return coordinates;
  }

  static String encode(final List<LatLng> path) {
    int lastLat = 0;
    int lastLng = 0;

    final StringBuffer result = StringBuffer();

    for (final point in path) {
      int lat = (point.latitude * 1e5).round();
      int lng = (point.longitude * 1e5).round();

      int dLat = lat - lastLat;
      int dLng = lng - lastLng;

      _encode(dLat, result);
      _encode(dLng, result);

      lastLat = lat;
      lastLng = lng;
    }
    return result.toString();
  }

  static void _encode(int v, StringBuffer result) {
    v = v < 0 ? ~(v << 1) : v << 1;
    while (v >= 0x20) {
      int charCode = ((0x20 | (v & 0x1f)) + 63);
      String charCodeStr = String.fromCharCode(charCode);
      List<dynamic> chars = [];
      charCodeStr.split('').forEach((element) => chars.add(element));
      Iterable<dynamic> i = Iterable.castFrom(chars);
      result.writeAll(i);
      v >>= 5;
    }
    int charCode = (v + 63);
    String charCodeStr = String.fromCharCode(charCode);
    List<dynamic> chars = [];
    charCodeStr.split('').forEach((element) => chars.add(element));
    Iterable<dynamic> i = Iterable.castFrom(chars);
    result.writeAll(i);
  }

}
