import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/src/features/announcement/announcement_provider/model/announcement_model.dart';

import '../../../../../../common/utils/failures/logger.dart';
import '../../../domain/repositories/announcement_publish_repository.dart';

part 'announcement_publish_bloc.freezed.dart';

class AnnouncementPublishBloc
    extends Bloc<AnnouncementPublishEvent, AnnouncementPublishState> {
  final AnnouncementPublishRepository announcementPublishRepository;

  AnnouncementPublishBloc(this.announcementPublishRepository)
      : super(const AnnouncementPublishState.initial()) {
    on<Publish>(_publish);
  }

  Future<void> _publish(
      Publish event, Emitter<AnnouncementPublishState> emit) async {
    await announcementPublishRepository
        .publishImageList(event.imageFileList)
        .then((imageURlList) async {
      emit(AnnouncementPublishState.publishImagesCompleted(imageURlList));
      await announcementPublishRepository.publish(AnnouncementModel(
          price: event.price,
          area: event.area,
          floor: event.floor,
          address: event.address,
          mortgage: event.mortgage,
          number: event.number,
          images: imageURlList,
          lat: event.lat,
          long: event.long,
          apartmentsFloor: event.apartmentsFloor,
          apartmentsRoom: event.apartmentsRoom,
          userUid: event.userUid));
    }).catchError((error, stackTrace) {
      emit(AnnouncementPublishState.failure(error.toString()));
      logger.f('Bloc : publish error', error: error, stackTrace: stackTrace);
    });
  }
}

@freezed
class AnnouncementPublishState with _$AnnouncementPublishState {
  const factory AnnouncementPublishState.initial() = _Initial;

  const factory AnnouncementPublishState.publicationCompleted() =
      _PublicationCompleted;

  const factory AnnouncementPublishState.publishImagesCompleted(
      final List<String> imageURl) = _PublishImagesCompleted;

  const factory AnnouncementPublishState.publicationOfAnnouncement() =
      _PublicationOfAnnouncement;

  const factory AnnouncementPublishState.failure(final String error) = _Failure;
}

abstract class AnnouncementPublishEvent extends Equatable {}

final class Publish extends AnnouncementPublishEvent {
  Publish(
      {required this.price,
      required this.area,
      required this.floor,
      required this.address,
      required this.mortgage,
      required this.number,
      required this.lat,
      required this.long,
      required this.imageFileList,
      required this.apartmentsRoom,
      required this.apartmentsFloor,
      required this.userUid});

  final int price;
  final int area;
  final int floor;
  final String address;
  final bool mortgage;
  final String number;
  final double lat;
  final double long;
  final int apartmentsFloor;
  final int apartmentsRoom;
  final List<File> imageFileList;
  final String userUid;

  @override
  List<Object> get props => [
        price,
        area,
        floor,
        address,
        mortgage,
        number,
        lat,
        long,
        apartmentsFloor,
        apartmentsRoom,
        imageFileList,
        userUid
      ];
}
