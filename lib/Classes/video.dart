//Clase para cada noticia
import 'package:video_player/video_player.dart';

class Video {
  //Variables
  String name;
  String source;
  VideoPlayerController videoPlayerController;
  Future<void> initializeVideoPlayer;

  //Construcotr
  Video(
      {this.name,
      this.source,
      this.videoPlayerController,
      this.initializeVideoPlayer});

  //Metodos
  void start() {
    videoPlayerController = VideoPlayerController.network(source);
    initializeVideoPlayer = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
  }
}
