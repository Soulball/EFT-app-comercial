import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Classes/station.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';

//Pagina principal de la seccion para solicitudes
class StationSearcher extends StatefulWidget {
  StationSearcher({Key key}) : super(key: key);
  static List<Station> stationZonelist = [];
  @override
  _StationSearcherState createState() => _StationSearcherState();
}

class _StationSearcherState extends State<StationSearcher> {
  //Variables
  int zone = 0;
  List<Station> stationCoincidence = [];
  Station selectedStation = Station(name: "", number: 0);
  @override
  Widget build(BuildContext context) {
    getStations();
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
                      setState(() {
                        stationCoincidence.clear();
                        print(zone);
                        for (int c = 0;
                            c < StationSearcher.stationZonelist.length;
                            c++) {
                          if (StationSearcher.stationZonelist[c].number ==
                              zone) {
                            stationCoincidence
                                .add(StationSearcher.stationZonelist[c]);
                            break;
                          }
                        }
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
                          itemCount: stationCoincidence.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                color: (selectedStation ==
                                        stationCoincidence[index])
                                    ? blueNeutral
                                    : grayDark,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedStation =
                                          stationCoincidence[index];
                                    });
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(
                                          getHorizontalMargin(context)),
                                      child: CustomText(
                                          data: stationCoincidence[index]
                                                  .number
                                                  .toString() +
                                              " - " +
                                              stationCoincidence[index].name,
                                          size: 18,
                                          color: whiteLight)),
                                ));
                          })))
            ])),
        floatingActionButton: FloatingActionButton.extended(
            label: CustomText(
                data: selectedStation.name,
                color: whiteNeutral,
                size: 18,
                weight: FontWeight.bold),
            icon: Icon(Icons.subdirectory_arrow_left_rounded),
            backgroundColor: blueNeutral,
            onPressed: () {
              if (selectedStation.name == "" || selectedStation.name == null) {
                showDialogText(
                    context, "Error", "No ha seleccionado ninguna estación.");
                return;
              }
              HomeBlocInheritedWidget.of(context).homebloc.nameStation =
                  selectedStation.name;
              HomeBlocInheritedWidget.of(context).homebloc.station =
                  selectedStation.number;
              setStation(selectedStation.number, selectedStation.name);
              Navigator.pop(context);
              showDialogText(
                  context,
                  "Cambio completado",
                  "Se ha establecido la estacion " +
                      selectedStation.name +
                      " correctamente.");
            }));
  }
}
