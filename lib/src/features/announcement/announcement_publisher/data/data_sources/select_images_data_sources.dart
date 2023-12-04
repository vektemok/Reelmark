import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:untitled14/src/common/utils/failures/logger.dart';

abstract interface class ISelectImagesDataSources {
  ///If the user does not select any images we will return [null]
  Future<List<File>?> getImages();
}

class SelectImagesDataSources implements ISelectImagesDataSources {
  @override
  Future<List<File>?> getImages() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom,
          allowedExtensions: ['jpg']
      );

      if (result != null) {
        List<File> files = result.paths.map((e) => File(e!)).toList();
        return files;
      }
      return null;
    } on Object catch (error, stackTrace) {
      logger.f('FF: get images', error: error, stackTrace: stackTrace);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
