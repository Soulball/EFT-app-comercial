import 'package:eft_app_comercial/Classes/video.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//Pagina principal de la seccion para tutoriales
class Videos extends StatefulWidget {
  Videos({Key key}) : super(key: key);
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos>
    with AutomaticKeepAliveClientMixin<Videos> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    //Lista de videos
    List<Video> videoList = [
      Video(
          name: "Sanitización a clientes sin costo",
          source:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
      Video(
          name: "Sanitización a clientes sin costo",
          source:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
      Video(
          name: "Sanitización a clientes sin costo",
          source:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
    ];

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
            Widget>[
      Card(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.02),
        color: red,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomText(
              data: 'Videos',
              size: 18,
              color: whiteDark,
              weight: FontWeight.bold),
        ),
      ),
      Expanded(
          flex: 10,
          child: ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (BuildContext context, int index) {
                videoList[index].start();
                return Card(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              if (videoList[index]
                                  .videoPlayerController
                                  .value
                                  .isPlaying)
                                videoList[index].videoPlayerController.pause();
                              else
                                videoList[index].videoPlayerController.play();
                            },
                            child: FutureBuilder(
                                future: videoList[index].initializeVideoPlayer,
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
                                        child: CircularProgressIndicator());
                                })),
                        Container(
                            alignment: Alignment.bottomCenter,
                            color: grayDark,
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomText(
                                    data: videoList[index].name,
                                    size: 18,
                                    color: whiteLight,
                                    weight: FontWeight.bold)))
                      ]),
                );
              }))
    ]));
  }

  bool get wantKeepAlive => true;
}
