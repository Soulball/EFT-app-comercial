import 'package:eft_app_comercial/Classes/tutorial.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Infos extends StatefulWidget {
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  //Metodo para abrir desde el navegador
  Future<void> _launchInURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Tutorial> infoList = [
    Tutorial(
        name: "Sanitización a clientes sin costo",
        source: "https://economipedia.com/wp-content/uploads/Diagrama-2.jpg"),
    Tutorial(
        name: "Sanitización a clientes sin costo",
        source: "https://economipedia.com/wp-content/uploads/Diagrama-2.jpg"),
    Tutorial(
        name: "Sanitización a clientes sin costo",
        source: "https://economipedia.com/wp-content/uploads/Diagrama-2.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Card(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.height * 0.02),
            color: red,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomText(
                  data: 'Infografías',
                  size: 18,
                  color: whiteDark,
                  weight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: infoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  _launchInURL(infoList[index].source);
                                },
                                child: Image.network(infoList[index].source)),
                            Container(
                                alignment: Alignment.bottomCenter,
                                color: grayDark,
                                child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomText(
                                        data: infoList[index].name,
                                        size: 18,
                                        color: whiteLight,
                                        weight: FontWeight.bold)))
                          ]),
                    );
                  }))
        ]));
  }
}
