import 'package:untitled14/src/features/announcement/announcement_provider/model/announcement_model.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/data/data_sources/announcement_view_data_sources.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/domain/repositories/announcement_view_repository.dart';

class AnnouncementViewRepositoryImpl implements AnnouncementViewRepository {
  AnnouncementViewRepositoryImpl({required this.announcementViewDataSources});

  final IAnnouncementViewDataSources announcementViewDataSources;

  @override
  Future<List<AnnouncementModel>> getAnnouncementList() async {
    return await announcementViewDataSources.getAnnouncementList();
  }

  @override
  Stream<List<AnnouncementModel>> getAnnouncementListStream(int limit) async* {
    yield* announcementViewDataSources.getAnnouncementListStream(limit);
  }
}
