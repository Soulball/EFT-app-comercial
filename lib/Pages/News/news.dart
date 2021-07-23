import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:eft_app_comercial/Pages/News/newDetails.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Pagina principal del visualizador de todas las noticias
class News extends StatefulWidget {
  News({Key key}) : super(key: key);
  //Lista
  static List<Announcement> newList = <Announcement>[];
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: getDrawer(context),
        appBar: AppBar(title: CustomTextAppBar(data: 'Noticias')),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView.builder(
                itemCount: announcementList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                          onTap: () {
                            final route = MaterialPageRoute(
                                builder: (BuildContext context) {
                              return NewDetails(newId: announcementList[index]);
                            });
                            Navigator.of(context).push(route);
                          },
                          child: Container(
                              height: 220,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          announcementList[index].image),
                                      fit: BoxFit.cover)),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                            height: 26,
                                            decoration: BoxDecoration(
                                                color: red,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: CustomText(
                                                    data:
                                                        announcementList[index]
                                                            .categoryName,
                                                    size: 14,
                                                    color: whiteLight)))),
                                    Container(
                                        width: double.infinity,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15)),
                                            color: grayDark.withOpacity(0.65)),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0,
                                                top: 5.0,
                                                right: 5.0,
                                                bottom: 5.0),
                                            child: CustomText(
                                                data: announcementList[index]
                                                    .name,
                                                size: 24,
                                                color: whiteLight,
                                                weight: FontWeight.bold)))
                                  ]))));
                })));
  }
}
