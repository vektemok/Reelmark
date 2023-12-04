import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/presentation/bloc/announcement_publish_bloc/announcement_publish_bloc.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/presentation/bloc/image_select_bloc/image_select_bloc.dart';
import 'package:untitled14/src/features/runner/dependencies/dependencies.dart';

class AnnouncementPublisherScreen extends StatefulWidget {
  const AnnouncementPublisherScreen({super.key, required this.imageList});

  final List<File> imageList;

  @override
  State<AnnouncementPublisherScreen> createState() =>
      _AnnouncementPublisherScreenState();
}

class _AnnouncementPublisherScreenState
    extends State<AnnouncementPublisherScreen> {
  late final AnnouncementPublishBloc _announcementPublishBloc;
  final _key = GlobalKey<FormState>();
  final _priceController = TextEditingController();
  final _floorController = TextEditingController();
  final _areaController = TextEditingController();
  final _apartmentsFloorController = TextEditingController();
  final _apartmentsRoomController = TextEditingController();

  @override
  void initState() {
    _announcementPublishBloc = AnnouncementPublishBloc(
        dependencies.announcementPublishRepositoryImpl());
    super.initState();
  }

  @override
  void dispose() {
    _announcementPublishBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AnnouncementPublishBloc, AnnouncementPublishState>(
            bloc: _announcementPublishBloc,
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String? _widgetValidate(String? value) {
    if (value != null || value!.isEmpty) {
      return 'Please enter text';
    }
    return null;
  }
}

class _TextInputWidget extends StatefulWidget {
  const _TextInputWidget({super.key});

  @override
  State<_TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<_TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class _NumberInputWidget extends StatelessWidget {
  const _NumberInputWidget({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _widgetValidate,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  String? _widgetValidate(String? value) {
    if (value != null || value!.isEmpty) {
      return 'Please enter text';
    }
    return null;
  }
}
