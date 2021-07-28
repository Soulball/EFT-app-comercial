import 'dart:convert';

import 'package:eft_app_comercial/Classes/tutorial.dart';
import 'package:eft_app_comercial/Classes/video.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/subSectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:video_player/video_player.dart';

//Subseccion de Tutoriales - Videos
class Videos extends StatefulWidget {
  Videos({Key key}) : super(key: key);
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos>
    with AutomaticKeepAliveClientMixin<Videos> {
  //Variables
  ScrollController scrollController = new ScrollController();
  List<Tutorial> videoList = [];
  int offset = 0;

  @override
  void initState() {
    super.initState();
    get10(defaultStation, offset);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent)
        get10(defaultStation, offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    //Obtener margen vertical desde libreria
    double marginV = getVerticalMargin(context);
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
          SubSectionTitle(data: 'Videos'),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: videoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Video video = new Video();
                    video.start(videoList[index].source);
                    return Card(
                        margin: EdgeInsets.all(marginV),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.bottomCenter,
                                  color: grayDark,
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CustomText(
                                          data: videoList[index].name,
                                          size: 14,
                                          color: whiteLight))),
                              InkWell(
                                  onTap: () {
                                    if (video
                                        .videoPlayerController.value.isPlaying)
                                      video.videoPlayerController.pause();
                                    else
                                      video.videoPlayerController.play();
                                  },
                                  child: FutureBuilder(
                                      future: video.initializeVideoPlayer,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done)
                                          return AspectRatio(
                                              aspectRatio: video
                                                  .videoPlayerController
                                                  .value
                                                  .aspectRatio,
                                              child: VideoPlayer(
                                                  video.videoPlayerController));
                                        else
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                      }))
                            ]));
                  }))
        ]));
  }

  //Petición
  get10(int station, int offset) async {
    final response = await get(Uri.encodeFull(
        "http://$ip:50000/tutorial?station=$station&type=video&offset=$offset"));
    if (json.decode(response.body)["tutorial"] != null) {
      setState(() {
        List data = json.decode(response.body)["tutorial"];
        for (int c = 0; c < data.length; c++) {
          videoList.add(
              new Tutorial(name: data[c]["name"], source: data[c]["source"]));
        }
        this.offset = this.offset + 10;
      });
    }
  }

  //Guardar el estado de la pagina
  bool get wantKeepAlive => true;
}
