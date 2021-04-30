//Icono de me gusta
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LikeIcon extends StatefulWidget {
  //Variables
  int announcementId;
  Color containerColor;

  LikeIcon({this.announcementId, this.containerColor});

  @override
  _LikeIconState createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  bool like;

  Widget build(BuildContext context) {
    like = isLike();
    return Container(
        height: getHorizontalPercent(context, 15),
        width: getHorizontalPercent(context, 15),
        color: widget.containerColor,
        alignment: Alignment.center,
        child: IconButton(
            icon: Icon(like ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                color: like ? Colors.blue : Colors.black,
                size: getHorizontalPercent(context, 10)),
            onPressed: () {
              setState(() {
                if (like)
                  likeList.remove(widget.announcementId);
                else
                  likeList.add(widget.announcementId);
                like = !like;
              });
            }));
  }

  bool isLike() {
    if (likeList.contains(widget.announcementId)) return true;
    return false;
  }
}
