import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled14/src/common/utils/failures/logger.dart';
import 'package:untitled14/src/features/announcement/announcement_provider/model/announcement_model.dart';

abstract interface class IAnnouncementViewDataSources {
  Future<List<AnnouncementModel>> getAnnouncementList();

  Stream<List<AnnouncementModel>> getAnnouncementListStream(int limit);
}

class AnnouncementViewDataSources implements IAnnouncementViewDataSources {
  @override
  Future<List<AnnouncementModel>> getAnnouncementList() async {
    try {
      return await FirebaseFirestore.instance
          .collection('announcement').limit(10)
          .get()
          .then((value) => value.docs
              .map((e) => AnnouncementModel.fromJson(e.data()))
              .toList());
    } on FirebaseFirestore catch (e, stackTrace) {
      logger.e('Announcement publish error:', error: e, stackTrace: stackTrace);
      Error.throwWithStackTrace(e, stackTrace);
    }
  }

  @override
  Stream<List<AnnouncementModel>> getAnnouncementListStream(int limit) async* {
    try {
      yield* FirebaseFirestore.instance
          .collection('announcement')
          .limit(limit)
          .snapshots()
          .asyncMap((event) => event.docs
              .map((e) => AnnouncementModel.fromJson(e.data()))
              .toList());
    } on FirebaseFirestore catch (e, stackTrace) {
      logger.e('Announcement publish error:', error: e, stackTrace: stackTrace);
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
