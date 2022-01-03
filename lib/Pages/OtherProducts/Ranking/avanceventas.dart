import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/productsold.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Ranking/advancecommission.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/showusers.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvanceVentas extends StatefulWidget {
  List<Product> datac = <Product>[];
  AvanceVentas({Key key}) : super(key: key);

  @override
  _AvanceVentasState createState() => _AvanceVentasState();
}

class _AvanceVentasState extends State<AvanceVentas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        toolbarHeight: getVerticalPercent(context, 12),
        title: CustomText(
            data: 'Avance de Ventas',
            size: getVerticalPercent(context, 5),
            color: whiteNeutral,
            weight: FontWeight.bold),
      ),
      body: FutureBuilder(
          future:
              getTransaction(HomeBlocInheritedWidget.of(context).homebloc.user),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            final List<Product> item = snapshot.data.products;
            final List<Product> item1 =
                item.where((d) => d.transaction > 0).toList();
            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children: [
                    ShowUsers(),
                    SizedBox(
                      height: getHorizontalPercent(context, 2),
                    ),
                    AdvanceCommission(
                      datac: item1,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
