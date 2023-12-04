import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled14/src/common/utils/failures/logger.dart';
import '../../../announcement_provider/model/announcement_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract interface class IAnnouncementPublisherDataSources {
  Future<void> publish(AnnouncementModel announcementModel);

  Future<List<String>> publishImageList(List<File> imageList);

  ///This method should return getDownloadUR as String
  Future<String> sendAnImage(File image);
}

final class AnnouncementPublisherDataSources
    implements IAnnouncementPublisherDataSources {
  AnnouncementPublisherDataSources();

  final imageRef = FirebaseStorage.instance.ref();
  final announcementCollection =
      FirebaseFirestore.instance.collection('announcement');

  @override
  Future<void> publish(AnnouncementModel announcementModel) async {
    try {
      await announcementCollection.add(announcementModel.toJson());
    } on FirebaseFirestore catch (error, stackTrace) {
      logger.f('Publish error', error: error, stackTrace: stackTrace);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<List<String>> publishImageList(List<File> imageList) async {
    try {
      List<String> downloadURLList = [];
      for (var i = 0; i < imageList.length; i++) {
        /// Get the url address from the send an image method
        final downloadURl = await sendAnImage(imageList[i]);

        ///Add it to the list [downloadURLList]
        downloadURLList.add(downloadURl);
      }
      return downloadURLList;
    } on Object catch (error, stackTrace) {
      logger.f('Publish imageList error', error: error, stackTrace: stackTrace);

      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<String> sendAnImage(File image) async {
    try {
      final snapshot = imageRef.child(image.path);

      /// Upload a image
      await snapshot.putFile(image);

      /// Get and return image download URl
      return await snapshot.getDownloadURL();
    } on FirebaseException catch (error, stackTrace) {
      logger.f('Send an image error', error: error, stackTrace: stackTrace);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
