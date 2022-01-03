import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Foraneas extends StatelessWidget {
  const Foraneas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        toolbarHeight: getVerticalPercent(context, 12),
        title: CustomText(
            data: 'Ranking Foraneas',
            size: getVerticalPercent(context, 5),
            color: whiteNeutral,
            weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getranking(
                HomeBlocInheritedWidget.of(context).homebloc.user, 'foreign'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());

              var image1 = snapshot.data.imagepodium;
              var image2 = snapshot.data.imagegeneral;

              if (image1 == null || image1 == "") {
                image1 = 'assets/imagen4.jpg';
              }
              if (image2 == null || image2 == "") {
                image2 = 'assets/imagen5.jpg';
              }
              return Container(
                color: Colors.transparent,
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(getVerticalMargin(context)),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: getVerticalPercent(context, 1.5),
                    ),
                    Container(
                      height: getVerticalPercent(context, 30),
                      width: getHorizontalPercent(context, 80),
                      color: Colors.blue,
                      child: Image.asset(
                        image1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: getVerticalPercent(context, 1.5),
                    ),
                    Container(
                      height: getVerticalPercent(context, 30),
                      width: getHorizontalPercent(context, 80),
                      color: Colors.amber,
                      child: Image.asset(
                        image2,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: getVerticalPercent(context, 10),
                    ),
                    Center(
                      child: CustomText(
                        data: "Foraneas",
                        size: 25,
                        color: blueDark,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
