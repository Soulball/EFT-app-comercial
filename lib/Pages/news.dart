import 'package:eft_app_comercial/Classes/new.dart';
import 'package:flutter/material.dart';
import 'marketing.dart';

//Pagina principal del visualizador de todas las noticias
class News extends StatefulWidget {
  News({Key key}) : super(key: key);
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<New> newsList = [
    New(
        name: "Sanitización a clientes sin costo",
        text: "",
        image: "http://picsum.photos/id/0/400/300",
        category: "Marketing"),
    New(
        name: "Noticia 2",
        text: "",
        image: "http://picsum.photos/id/1/400/300",
        category: "Otros productos"),
    New(
        name: "Noticia 3",
        text: "",
        image: "http://picsum.photos/id/2/400/300",
        category: "Tutoriales")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Noticias',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      final route =
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Marketing();
                      });
                      Navigator.of(context).push(route);
                    },
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                            image: NetworkImage(newsList[index].image),
                            fit: BoxFit.cover),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 26,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  newsList[index].category,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  top: 5.0,
                                  right: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                newsList[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}