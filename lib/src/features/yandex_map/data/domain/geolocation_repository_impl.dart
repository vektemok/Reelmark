import 'package:untitled14/src/features/yandex_map/data/data_sources/geolocation_data_source.dart';
import 'package:untitled14/src/features/yandex_map/domain/entities/geolocation_entity.dart';
import 'package:untitled14/src/features/yandex_map/domain/repositories/geolocation_repository.dart';

final class GeolocationRepositoryImpl implements GeolocationRepository {
  final IGeolocationDataSources iGeolocationDataSources;

  GeolocationRepositoryImpl({required this.iGeolocationDataSources});

  @override
  Future<GeolocationEntity> getPosition() async {
    return await iGeolocationDataSources.getPosition();
  }
}
