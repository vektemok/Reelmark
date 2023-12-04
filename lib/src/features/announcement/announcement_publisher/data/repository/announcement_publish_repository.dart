import 'dart:io';

import 'package:untitled14/src/features/announcement/announcement_provider/model/announcement_model.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/data/data_sources/announcement_publish_data_sources.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/domain/repositories/announcement_publish_repository.dart';

final class AnnouncementPublishRepositoryImpl
    implements AnnouncementPublishRepository {
  AnnouncementPublishRepositoryImpl(
      {required this.announcementPublisherDataSources});

  final IAnnouncementPublisherDataSources announcementPublisherDataSources;

  @override
  Future<void> publish(AnnouncementModel announcementModel) async {
    return await announcementPublisherDataSources.publish(announcementModel);
  }

  @override
  Future<List<String>> publishImageList(List<File> imageList) async {
    return await announcementPublisherDataSources.publishImageList(imageList);
  }

  @override
  Future<String> _sendAnImage(File image) async {
    return await announcementPublisherDataSources.sendAnImage(image);
  }
}
