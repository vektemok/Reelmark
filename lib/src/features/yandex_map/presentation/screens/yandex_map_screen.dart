import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:untitled14/src/features/yandex_map/data/data_sources/geolocation_data_source.dart';
import 'package:untitled14/src/features/yandex_map/domain/entities/geolocation_entity.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter/material.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart' as yandexGeocoder;

class YandexMapScreen extends StatefulWidget {
  const YandexMapScreen({super.key});

  @override
  State<YandexMapScreen> createState() => _YandexMapScreenState();
}

class _YandexMapScreenState extends State<YandexMapScreen> {
  late final YandexMapController _mapController;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: YandexMap(
        // mode2DEnabled: true,
        nightModeEnabled: true,
        onMapCreated: (controller) {
          mapControllerCompleter.complete(controller);
        },
        onMapTap: (Point point) {
          geolocationFromAddress(point);
        },
      ),
    );
  }



  Future<void> _initPermission() async {
    if (!await GeolocationDataSources().checkPermission()) {
      await GeolocationDataSources().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> geolocationFromAddress(Point point) async {
    try {
      final geocoder = yandexGeocoder.YandexGeocoder(
          apiKey: 'Please enter your geo api key ');
      await geocoder
          .getGeocode(yandexGeocoder.GeocodeRequest(
              geocode: yandexGeocoder.PointGeocode(
                  latitude: point.latitude, longitude: point.longitude)))
          .then((
            value,
          ) =>
              debugPrint(value.firstAddress!.formatted));
    } on Object catch (e, stackTrace) {
      debugPrint('${e.toString()}, ${stackTrace.toString()}');
    }
  }






  Future<void> _fetchCurrentLocation() async {
    GeolocationEntity location;
    final defLocation = BaseLocationEntity();
    try {
      location = await GeolocationDataSources().getPosition();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }


  Future<void> _moveToCurrentLocation(
    GeolocationEntity appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }
}
