import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/presentation/screens/announcement_publisher_screen.dart';
import '../../../../runner/dependencies/dependencies.dart';
import '../bloc/image_select_bloc/image_select_bloc.dart';

class SelectImageScreen extends StatefulWidget {
  const SelectImageScreen({super.key});

  @override
  State<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  late final ImageSelectBloc _imageSelectBloc;

  @override
  void initState() {
    _imageSelectBloc =
        ImageSelectBloc(dependencies.selectImageRepositoryImpl());
    super.initState();
  }

  @override
  void dispose() {
    _imageSelectBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<ImageSelectBloc, ImageSelectState>(
            bloc: _imageSelectBloc,
            builder: (context, state) {
              // return state.when(initial: (){}, fetching: fetching, failure: failure, imagesSelected: imagesSelected)

              return state.when(
                  initial: () => _SelectImagesButton(
                      onTap: () => _imageSelectBloc.add(FetchImages())),
                  failure: (String failure) => Text(failure.toString()),
                  imagesSelected: (List<File> imageList) =>
                      _ImageViewList(imageList: imageList));
            },
          ),
        ),
      ),
    );
  }
}

class _ImageViewList extends StatelessWidget {
  const _ImageViewList({required this.imageList});

  final List<File> imageList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 150,
                child: ClipRect(
                  clipBehavior: Clip.antiAlias,
                  child: Image.file(
                    imageList[index],
                    fit: BoxFit.contain,
                    width: 100,
                  ),
                ),
              );
            }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 52,
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AnnouncementPublisherScreen(imageList: imageList))),
              child: const Text('complete'),
            ),
          ),
        )
      ],
    );
  }
}

class _SelectImagesButton extends StatelessWidget {
  const _SelectImagesButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => onTap, child: const Text('Select image')),
    );
  }
}
