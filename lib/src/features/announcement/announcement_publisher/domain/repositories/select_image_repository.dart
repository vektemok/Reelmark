import 'dart:io';

abstract interface class SelectImageRepository {
  Future<List<File>?> getImages();
}
