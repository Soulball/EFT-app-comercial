//Clase para cada noticia
import 'package:video_player/video_player.dart';

class Video {
  //Variables
  VideoPlayerController videoPlayerController;
  Future<void> initializeVideoPlayer;

  //Metodos
  void start(String source) {
    videoPlayerController = VideoPlayerController.network(source);
    initializeVideoPlayer = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
  }
}
