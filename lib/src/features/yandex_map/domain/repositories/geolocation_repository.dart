import 'package:untitled14/src/features/yandex_map/domain/entities/geolocation_entity.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

abstract interface class GeolocationRepository{
  Future<GeolocationEntity> getPosition();
}

class GeoCoder {
  final YandexGeocoder geo = YandexGeocoder(apiKey: 'Your Api Key');
Future<void> getPosition(Point point) async{
  final GeocodeResponse _address = await geo.getGeocode(
    GeocodeRequest(
      geocode: PointGeocode(latitude: point.latitude, longitude: point.longitude),
    ),
  );
}
}