import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eft_app_comercial/Libraries/media.dart';

//Pagina principal de la seccion para solicitudes
class StationSearcher extends StatefulWidget {
  StationSearcher({Key key}) : super(key: key);
  @override
  _StationSearcherState createState() => _StationSearcherState();
}

class _StationSearcherState extends State<StationSearcher> {
  //Variables
  int zone = 0;
  List<String> stationZonelist = [];
  String selectedStation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Estaciones')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
                vertical: getVerticalPercent(context, 5),
                horizontal: getHorizontalPercent(context, 5)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              CustomText(
                  data: "Buscador de estaciónes",
                  size: 18,
                  color: grayText,
                  weight: FontWeight.bold),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    height: getVerticalPercent(context, 8),
                    width: getHorizontalPercent(context, 75),
                    alignment: Alignment.center,
                    child: TextField(
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          zone = int.parse(value);
                        })),
                IconButton(
                    icon: Icon(Icons.search,
                        size: getHorizontalPercent(context, 8)),
                    onPressed: () {
                      stationZonelist.clear();
                      setState(() {
                        stationZonelist.add(zone.toString() + " - Estacion A");
                        stationZonelist.add(zone.toString() + " - Estacion B");
                        stationZonelist.add(zone.toString() + " - Estacion C");
                      });
                    })
              ]),
              SizedBox(height: getVerticalMargin(context)),
              Expanded(
                  flex: 10,
                  child: Container(
                      child: ListView.builder(
                          padding: EdgeInsets.all(getHorizontalMargin(context)),
                          physics: BouncingScrollPhysics(),
                          itemCount: stationZonelist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                color:
                                    (selectedStation == stationZonelist[index])
                                        ? blueNeutral
                                        : grayDark,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedStation = stationZonelist[index];
                                    });
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(
                                          getHorizontalMargin(context)),
                                      child: CustomText(
                                          data: stationZonelist[index],
                                          size: 18,
                                          color: whiteLight)),
                                ));
                          })))
            ])),
        floatingActionButton: FloatingActionButton.extended(
            label: CustomText(
                data: selectedStation,
                color: whiteNeutral,
                size: 18,
                weight: FontWeight.bold),
            icon: Icon(Icons.subdirectory_arrow_left_rounded),
            backgroundColor: blueNeutral,
            onPressed: () {
              if (selectedStation == "") {
                showDialogText(context, "Error", "No ha seleccionado ninguna estación.");
                return;
              }
              stationNameTest = selectedStation;
              print(stationNameTest);
              Navigator.pop(context);
              showDialogText(
                  context,
                  "Cambio completado",
                  "Se ha establecido la estacion " +
                      selectedStation +
                      " correctamente.");
            }));
  }
}
