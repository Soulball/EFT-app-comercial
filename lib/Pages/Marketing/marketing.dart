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
class Marketing extends StatefulWidget {
  Marketing({Key key}) : super(key: key);
  //Listas
  static List<Announcement> promoList = <Announcement>[];
  static List<Reactions> favAndLikeList = <Reactions>[];
  @override
  _MarketingState createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Marketing')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: grayNeutral,
            child: FutureBuilder(
                future: getApi(9999, 123456789),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  return ListView.builder(
                      itemCount: Marketing.promoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: <Widget>[
                          InkWell(
                              onTap: () {
                                final route = MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return PromotionDetails(
                                      announcement: Marketing.promoList[index]);
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
                                              Marketing.promoList[index].image),
                                          fit: BoxFit.fill)))),
                          Row(children: <Widget>[
                            Container(
                              height: getHorizontalPercent(context, 15),
                              width: getHorizontalPercent(context, 15),
                              child: FavoriteIcon(
                                  announcementId: Marketing.promoList[index].id,
                                  containerColor: grayIconLigth),
                            ),
                            Container(
                              height: getHorizontalPercent(context, 15),
                              width: getHorizontalPercent(context, 15),
                              child: LikeIcon(
                                  announcementId: Marketing.promoList[index].id,
                                  containerColor: grayIconDark),
                            ),
                            Container(
                                height: getHorizontalPercent(context, 15),
                                width: getHorizontalPercent(context, 40),
                                color: whiteNeutral),
                            Container(
                                height: getHorizontalPercent(context, 15),
                                width: getHorizontalPercent(context, 30),
                                color: blueDark,
                                alignment: Alignment.center,
                                child: CustomText(
                                    data:
                                        Marketing.promoList[index].categoryName,
                                    size: 14,
                                    color: whiteLight))
                          ])
                        ]);
                      });
                })));
  }
}
