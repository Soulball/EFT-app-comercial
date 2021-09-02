class ImageRanking {
  String imagepodium, imagegeneral, state, message;
  int code;
  ImageRanking(
      {this.imagepodium,
      this.imagegeneral,
      this.message,
      this.state,
      this.code});

  factory ImageRanking.fromJson(Map<String, dynamic> json) => ImageRanking(
      imagegeneral: json["imagelist"],
      imagepodium: json["imageranking"],
      state: json["caption"],
      message: json["message"],
      code: json["code"]);

  Map<String, dynamic> toJson() => {
        "imagelist": imagegeneral,
        "imageranking": imagepodium,
        "estado": state,
      };
}
