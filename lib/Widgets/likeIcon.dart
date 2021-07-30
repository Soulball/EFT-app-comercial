//Icono de me gusta
import 'package:eft_app_comercial/Classes/fav_and_like.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LikeIcon extends StatefulWidget {
  //Variables
  int announcementId;
  Color containerColor;
  bool like = false;
  bool noRepeat = true;
  bool isNull = true;

  //Constructor
  LikeIcon({this.announcementId, this.containerColor});

  @override
  _LikeIconState createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  Widget build(BuildContext context) {
    if (widget.noRepeat) isLike();
    return Container(
        height: getHorizontalPercent(context, 15),
        width: getHorizontalPercent(context, 15),
        color: widget.containerColor,
        alignment: Alignment.center,
        child: IconButton(
            icon: Icon(
                widget.like ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                color: widget.like ? Colors.blue : Colors.black,
                size: getHorizontalPercent(context, 8)),
            onPressed: onClick));
  }

//Metodos
  // ignore: missing_return
  bool onClick() {
    setState(() {
      widget.like = !widget.like;
      if (!insertInList(widget.announcementId)) {
        //Solicitud para insertar nuevo
        Promotion.favAndLikeList.add(new Reactions(
            id: widget.announcementId, favorite: true, like: false));
        print("se insertó");
        return;
      }
      if (widget.like) {
        //Solicitud para cambiar a falso
        return;
      }
      //Solicitud para cambiar a verdadero
      return;
    });
  }

  void isLike() {
    widget.noRepeat = false;
    for (int c = 0; c < Promotion.favAndLikeList.length; c++) {
      if (Promotion.favAndLikeList[c].id == widget.announcementId) {
        widget.like = Promotion.favAndLikeList[c].like;
        widget.isNull = false;
        break;
      }
    }
  }
}
