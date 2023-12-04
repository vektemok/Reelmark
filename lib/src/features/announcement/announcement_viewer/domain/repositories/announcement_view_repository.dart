import 'package:untitled14/src/features/announcement/announcement_provider/model/announcement_model.dart';

abstract interface class AnnouncementViewRepository {
  Future<List<AnnouncementModel>> getAnnouncementList();
  Stream<List<AnnouncementModel>> getAnnouncementListStream(int limit);
}
