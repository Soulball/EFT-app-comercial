//Clase para cada noticia
import 'package:video_player/video_player.dart';

class Video {
  //Variables
  String name = "";
  String video = "";
  VideoPlayerController videoPlayerController;
  Future<void> initializeVideoPlayer;

  //Constructor
  Video({this.name, this.video, this.videoPlayerController, this.initializeVideoPlayer});

  //Metodos
  void start() {
     videoPlayerController = VideoPlayerController.network(video);
    initializeVideoPlayer = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
  }
}
