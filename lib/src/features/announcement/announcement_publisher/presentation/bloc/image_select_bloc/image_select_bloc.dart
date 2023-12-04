import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/utils/failures/logger.dart';
import '../../../domain/repositories/select_image_repository.dart';

part 'image_select_bloc.freezed.dart';

class ImageSelectBloc extends Bloc<ImageSelectEvent, ImageSelectState> {
  final SelectImageRepository selectImageRepository;

  ImageSelectBloc(this.selectImageRepository)
      : super(const ImageSelectState.initial()) {
    on<FetchImages>(_fetchImages);
  }

  Future<void> _fetchImages(
      FetchImages event, Emitter<ImageSelectState> emit) async {
    await selectImageRepository
        .getImages()
        .then((imageList) => emit(ImageSelectState.imagesSelected(imageList!)))
        .catchError((error, stackTrace) {
      emit(ImageSelectState.failure(error));
      Future.delayed(const Duration(seconds: 2),
          () => emit(const ImageSelectState.initial()));
      logger.f('Bloc fetch images error', error: error, stackTrace: stackTrace);
    });
  }
}

@freezed
class ImageSelectState with _$ImageSelectState {
  const factory ImageSelectState.initial() = _Initial;

  const factory ImageSelectState.failure(final String error) = _Failure;

  const factory ImageSelectState.imagesSelected(final List<File> imageList) =
      _ImagesSelected;
}

abstract class ImageSelectEvent extends Equatable {}

final class FetchImages extends ImageSelectEvent {
  @override
  List<Object?> get props => [];
}
