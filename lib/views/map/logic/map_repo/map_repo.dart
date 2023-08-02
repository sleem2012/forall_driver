import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forall_driver/views/map/logic/model/model.dart';
import 'package:forall_driver/views/map/logic/model/place.dart';
import 'package:forall_driver/views/map/logic/model/search_results_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String apiKey = 'AIzaSyB_4B59IxChSRS5-VHdYmSs6DWIVWkIro4';

class MapRepo {
  late Dio dio;

  WayPointPolylineModel? wayPointPolylineModel;

  MapRepo() {
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 20) ,
      connectTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<String> getDetailedAddress(LatLng? location) async {
    const String getDetailedAddressBase = 'https://maps.googleapis.com/maps/api/geocode/json?';
    try {
      Map<String, dynamic> prams = {
        'latlng': '${location?.latitude},${location?.longitude}',
        'region': 'eg',
        'country': 'egypt',
        'key': apiKey,
        'language': 'en'
      };
      final response = await dio.get(getDetailedAddressBase, queryParameters: prams);
      debugPrint('================= ${response.data['results'][0]['formatted_address']} ');
      return response.data['results'][0]['formatted_address'];
    } catch (e) {
      debugPrint('================= $e  ');
      return 'failed to get detailed address';
    }
  }

  Future<WayPointPolylineModel?> getDirections(LatLng origin, LatLng destination) async {
    const String getDirectionsBase = "https://maps.googleapis.com/maps/api/directions/json";
    try {
      Map<String, dynamic> prams = {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'mode': 'driving',
        'key': apiKey,
        'units': 'metric'
      };
      final response = await dio.get(getDirectionsBase, queryParameters: prams);
      wayPointPolylineModel = WayPointPolylineModel.fromJson(response.data);
      // debugPrint(response.data.toString());
      return wayPointPolylineModel;
    } catch (e) {
      debugPrint('================= $e  ');
      return null;
    }
  }

  SearchModel? _searchModel;
  Future<SearchModel?> search(
  String place, ) async {
    const suggestionsBaseUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    try {
      Response response = await dio.get(
        suggestionsBaseUrl,
        queryParameters: {
          'input': place,
          'types': 'geocode',
          'components': 'country:eg',
          'key': apiKey,
          // 'sessiontoken': sessionToken
        },
      );
      _searchModel = SearchModel.fromJson(response.data);
      return _searchModel;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }
  Place? _place;
  Future<Place?> getPlaceLocation(String placeId,
      // String sessionToken
      ) async {
    const placeLocationBaseUrl =
        'https://maps.googleapis.com/maps/api/place/details/json';
    try {
      Response response = await dio.get(
        placeLocationBaseUrl,
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': apiKey,
          // 'sessiontoken': sessionToken
        },
      );
      debugPrint(response.data.toString());
      _place = Place.fromJson(response.data);
      return _place;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }


}



