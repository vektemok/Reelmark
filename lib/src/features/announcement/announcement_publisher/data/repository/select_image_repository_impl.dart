import 'dart:io';

import 'package:untitled14/src/features/announcement/announcement_publisher/data/data_sources/select_images_data_sources.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/domain/repositories/select_image_repository.dart';

class SelectImageRepositoryImpl implements SelectImageRepository {
  SelectImageRepositoryImpl({required this.selectImagesDataSources});

  final ISelectImagesDataSources selectImagesDataSources;

  @override
  Future<List<File>?> getImages() async {
    return await selectImagesDataSources.getImages();
  }
}
