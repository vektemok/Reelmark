import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/src/common/utils/failures/logger.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/domain/repositories/announcement_view_repository.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/presentation/screens/announcement_viewer_screen.dart';

import '../../../announcement_provider/model/announcement_model.dart';

part 'announcement_view_bloc.freezed.dart';

class AnnouncementViewBloc
    extends Bloc<AnnouncementViewEvent, AnnouncementViewState> {
  final AnnouncementViewRepository announcementViewRepository;

  AnnouncementViewBloc(this.announcementViewRepository)
      : super(const AnnouncementViewState.initial()) {
    on<FetchAnnouncement>(_fetchAnnouncement);
  }

  Future<void> _fetchAnnouncement(
      FetchAnnouncement event, Emitter<AnnouncementViewState> emit) async {
    await announcementViewRepository
        .getAnnouncementList()
        .then((announcementList) =>
            emit(AnnouncementViewState.completed(announcementList)))
        .catchError((e, stackTrace) {
      logger.f('Announcement Error', error: e, stackTrace: stackTrace);
      emit(AnnouncementViewState.failure(e.toString()));
    });
  }
}

@freezed
class AnnouncementViewState with _$AnnouncementViewState {
  const factory AnnouncementViewState.initial() = _Initial;

  const factory AnnouncementViewState.completed(
      final List<AnnouncementModel> announcementList) = _Completed;



  const factory AnnouncementViewState.failure(final String error) = _Failure;
}

abstract class AnnouncementViewEvent {}

class FetchAnnouncement extends AnnouncementViewEvent {}
