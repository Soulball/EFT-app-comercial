import 'package:eft_app_comercial/Classes/video.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//Pagina principal de la seccion para tutoriales
class Tutorials extends StatefulWidget {
  Tutorials({Key key}) : super(key: key);
  @override
  _TutorialsState createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  @override
  Widget build(BuildContext context) {
    //Lista de videos
    List<Video> videoList = [
      Video(
          name: "Sanitización a clientes sin costo",
          video:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
      Video(
          name: "Sanitización a clientes sin costo",
          video:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
      Video(
          name: "Sanitización a clientes sin costo",
          video:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
    ];

    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Tutoriales')),
        body: Column(children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.40,
              color: grayDark,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    videoList[index].start();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: InkWell(
                                onTap: () {
                                  if (videoList[index]
                                      .videoPlayerController
                                      .value
                                      .isPlaying)
                                    videoList[index]
                                        .videoPlayerController
                                        .pause();
                                  else
                                    videoList[index]
                                        .videoPlayerController
                                        .play();
                                },
                                child: FutureBuilder(
                                    future:
                                        videoList[index].initializeVideoPlayer,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done)
                                        return AspectRatio(
                                            aspectRatio: videoList[index]
                                                .videoPlayerController
                                                .value
                                                .aspectRatio,
                                            child: VideoPlayer(videoList[index]
                                                .videoPlayerController));
                                      else
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                    }))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                            data: videoList[index].name,
                            size: 18,
                            color: whiteDark,
                            weight: FontWeight.bold),
                      )
                    ]);
                  })),
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Container(width: 240, color: Colors.red),
                Container(width: 240, color: Colors.blue),
                Container(width: 240, color: Colors.green)
              ]))
        ]));
  }
}