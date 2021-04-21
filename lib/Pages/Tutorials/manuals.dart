import 'package:eft_app_comercial/Classes/tutorial.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Manuals extends StatefulWidget {
  @override
  _ManualsState createState() => _ManualsState();
}

class _ManualsState extends State<Manuals> {
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

  List<Tutorial> manualList = [
    Tutorial(
        name: "Sanitización",
        source: "https://www.redalyc.org/pdf/2570/257031319008.pdf"),
    Tutorial(
        name: "Sanitización a clientes sin costo",
        source: "https://www.redalyc.org/pdf/2570/257031319008.pdf"),
    Tutorial(
        name: "Sanitización a clientes sin costo",
        source: "https://www.redalyc.org/pdf/2570/257031319008.pdf")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Card(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.height * 0.02),
            color: red,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomText(
                  data: 'Manuales',
                  size: 18,
                  color: whiteDark,
                  weight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: manualList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02),
                      child: ListTile(
                        leading: FlutterLogo(
                            size: MediaQuery.of(context).size.height * 0.1),
                        title: Text(manualList[index].name),
                        subtitle: CustomText(data: 'Descripcion del manual'),
                        trailing: InkWell(
                            onTap: () {
                              _launchInURL(manualList[index].source);
                            },
                            child: Icon(Icons.file_download)),
                      ),
                    );
                  }))
        ]));
  }
}