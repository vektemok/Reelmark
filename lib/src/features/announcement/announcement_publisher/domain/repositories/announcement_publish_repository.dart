import 'dart:io';

import 'package:untitled14/src/features/announcement/announcement_provider/model/announcement_model.dart';

abstract interface class AnnouncementPublishRepository {
  Future<void> publish(AnnouncementModel announcementModel);

  Future<List<String>> publishImageList(List<File> imageList);

  Future<String> _sendAnImage(File image);
}
