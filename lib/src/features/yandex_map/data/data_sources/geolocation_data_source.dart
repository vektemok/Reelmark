import 'package:geolocator/geolocator.dart';

import '../../domain/entities/geolocation_entity.dart';

abstract interface class IGeolocationDataSources {
  Future<GeolocationEntity> getPosition();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}

final class GeolocationDataSources implements IGeolocationDataSources {
  @override
  Future<GeolocationEntity> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition()
        .then((value) =>
            GeolocationEntity(lat: value.latitude, long: value.longitude))
        .catchError((_) => BaseLocationEntity());
  }

  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }
}
