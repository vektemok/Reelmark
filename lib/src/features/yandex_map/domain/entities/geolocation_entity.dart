class GeolocationEntity {
  final double lat;
  final double long;

  GeolocationEntity({required this.lat, required this.long});
}

class BaseLocationEntity extends GeolocationEntity {
  BaseLocationEntity({super.lat = 42.8746, super.long = 74.5698});
}
