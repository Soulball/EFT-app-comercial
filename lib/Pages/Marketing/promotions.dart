// @dart=2.9

import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/fav_and_like.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotionDetails.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:eft_app_comercial/Widgets/favoriteIcon.dart';
import 'package:eft_app_comercial/Widgets/likeIcon.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion de marketing
class Promotion extends StatefulWidget {
  Promotion({Key key}) : super(key: key);
  //Listas
  static List<Announcement> promoList = <Announcement>[];
  static List<Reactions> favAndLikeList = <Reactions>[];
  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Marketing')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: grayNeutral,
            child: FutureBuilder(
                future: getApi(
                    HomeBlocInheritedWidget.of(context).homebloc.station,
                    HomeBlocInheritedWidget.of(context).homebloc.user),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  return ListView.builder(
                      itemCount: Promotion.promoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: <Widget>[
                          InkWell(
                              onTap: () {
                                final route = MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return PromotionDetails(
                                      announcement: Promotion.promoList[index]);
                                });
                                Navigator.of(context).push(route);
                              },
                              child: Container(
                                  height: getVerticalPercent(context, 45),
                                  margin: EdgeInsets.only(
                                      top: getVerticalPercent(context, 3)),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              Promotion.promoList[index].image),
                                          fit: BoxFit.fill)))),
                          Row(children: <Widget>[
                            Container(
                              height: getHorizontalPercent(context, 15),
                              width: getHorizontalPercent(context, 15),
                              alignment: Alignment.center,
                              child: FavoriteIcon(
                                  announcementId: Promotion.promoList[index].id,
                                  containerColor: grayIconLigth),
                            ),
                            Container(
                              height: getHorizontalPercent(context, 15),
                              width: getHorizontalPercent(context, 15),
                              alignment: Alignment.center,
                              child: LikeIcon(
                                  announcementId: Promotion.promoList[index].id,
                                  containerColor: grayIconDark),
                            ),
                            Container(
                                height: getHorizontalPercent(context, 15),
                                width: getHorizontalPercent(context, 70),
                                color: blueDark,
                                alignment: Alignment.center,
                                child: CustomText(
                                    data:
                                        Promotion.promoList[index].categoryName,
                                    size: 14,
                                    color: whiteLight))
                          ])
                        ]);
                      });
                })));
  }
}
