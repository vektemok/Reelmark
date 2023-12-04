import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled14/src/features/announcement/announcement_provider/model/announcement_model.dart';
import 'package:untitled14/src/features/announcement/announcement_viewer/presentation/bloc/announcement_view_bloc.dart';

import '../../../../runner/dependencies/dependencies.dart';
import '../../../../yandex_map/presentation/screens/yandex_map_screen.dart';

class AnnouncementViewerScreen extends StatefulWidget {
  const AnnouncementViewerScreen({super.key});

  @override
  State<AnnouncementViewerScreen> createState() =>
      _AnnouncementViewerScreenState();
}

class _AnnouncementViewerScreenState extends State<AnnouncementViewerScreen> {
  final _scrollController = DraggableScrollableController();
  late final AnnouncementViewBloc _announcementViewBloc;

  @override
  void initState() {
    _announcementViewBloc =
        AnnouncementViewBloc(dependencies.announcementViewRepositoryImpl());
    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _announcementViewBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Text(
          'REELMARK',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          YandexMapScreen(),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.3,
              maxChildSize: 1,
              builder: (BuildContext context, ScrollController controller) {
                return BlocBuilder<AnnouncementViewBloc, AnnouncementViewState>(
                  bloc: _announcementViewBloc..add(FetchAnnouncement()),
                  builder: (context, state) {
                    return state.when(
                        initial: () =>
                            const Center(child: CircularProgressIndicator()),
                        completed: (List<AnnouncementModel> list) {
                          return ListView.builder(
                              itemCount: list.length,
                              controller: controller,
                              itemBuilder: (context, index) {
                                return AnnouncementWidget(
                                  announcementModel: list[index],
                                );
                              });
                        },
                        failure: (String error) => Text(''));
                  },
                );
              },
              controller: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}

class AnnouncementWidget extends StatefulWidget {
  const AnnouncementWidget({super.key, required this.announcementModel});

  final AnnouncementModel announcementModel;

  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final announcement = widget.announcementModel;
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      color: theme.backgroundColor,
      alignment: Alignment.center,
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: announcement.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      height: 156,
                      width: MediaQuery.of(context).size.width * 8 / 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: ClipRect(
                        clipBehavior: Clip.hardEdge,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(
                            announcement.images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  })),
          Text(
            announcement.price.toString(),
            style: GoogleFonts.montserrat(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
          Padding(
            // padding: EdgeInsets.only(top: 6, bottom: 6),
            padding: EdgeInsets.all(0),
            child: Text(
              '${announcement.apartmentsRoom}к квартира,${announcement.area}м,${announcement.apartmentsFloor}/${announcement.floor} этаж',
              style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 2),
            // padding: EdgeInsets.all(0),
            child: Text(
              '200,000 сом в месяц 15%',
              style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 2),
            // padding: EdgeInsets.all(0),
            child: Text(
              announcement.address,
              style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
              maxLines: 2,
              overflow: TextOverflow.clip,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
