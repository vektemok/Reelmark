import 'package:flutter/material.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/data/data_sources/announcement_publish_data_sources.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/data/data_sources/select_images_data_sources.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/data/repository/announcement_publish_repository.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/data/repository/select_image_repository_impl.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/presentation/bloc/image_select_bloc/image_select_bloc.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/data/data_sources/announcement_view_data_sources.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/data/repositories/announcement_repository_impl.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/domain/repositories/announcement_view_repository.dart';
import 'package:untitled14/src/features/authentication/email_authentication/email_registration/data/data_sources/emaiLregistration_data_sources.dart';
import 'package:untitled14/src/features/authentication/email_authentication/email_registration/data/repositories/email_registration_repository.dart';
import 'package:untitled14/src/features/authentication/email_authentication/email_sign_in/data/data_sources/email_login_data_sources.dart';
import 'package:untitled14/src/features/authentication/email_authentication/email_sign_in/data/repositories/email_sign_in_repository_impl.dart';

final dependencies = Dependencies();

class Dependencies {
  SelectImagesDataSources selectImagesDataSources() =>
      SelectImagesDataSources();

  SelectImageRepositoryImpl selectImageRepositoryImpl() =>
      SelectImageRepositoryImpl(
          selectImagesDataSources: selectImagesDataSources());

  AnnouncementPublisherDataSources announcementPublisherDataSources() =>
      AnnouncementPublisherDataSources();

  AnnouncementPublishRepositoryImpl announcementPublishRepositoryImpl() =>
      AnnouncementPublishRepositoryImpl(
          announcementPublisherDataSources: announcementPublisherDataSources());

  AnnouncementViewDataSources announcementViewDataSources() =>
      AnnouncementViewDataSources();

  AnnouncementViewRepositoryImpl announcementViewRepositoryImpl() =>
      AnnouncementViewRepositoryImpl(
          announcementViewDataSources: announcementViewDataSources());
}
