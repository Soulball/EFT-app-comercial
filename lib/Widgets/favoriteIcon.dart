//Icono de favoritos
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoriteIcon extends StatefulWidget {
  //Variables
  String id;
  Color containerColor;

  FavoriteIcon({this.id, this.containerColor});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool favorite;

  Widget build(BuildContext context) {
    favorite = isFavorite();
    return Container(
        height: getHorizontalPercent(context, 15),
        width: getHorizontalPercent(context, 15),
        color: widget.containerColor,
        alignment: Alignment.center,
        child: IconButton(
            icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: favorite ? Colors.red : Colors.black,
                size: getHorizontalPercent(context, 10)),
            onPressed: () {
              setState(() {
                if (favorite)
                  favoriteList.remove(widget.id);
                else
                  favoriteList.add(widget.id);
                favorite = !favorite;
              });
            }));
  }

  bool isFavorite() {
    if (favoriteList.contains(widget.id)) return true;
    return false;
  }
}