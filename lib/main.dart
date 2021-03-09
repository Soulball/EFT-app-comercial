import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
      routes: {
        'noticia': (context) => Marketing(),
      },
    );
  }
}

//Main Menu
class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //Variables
  int _currentIndex = 0;
  PageController _pageController;
  final List<Widget> _pages = [
    Home(),
    Marketing(),
    Home(),
    Marketing(),
    Home()
  ];

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: _currentIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: PageView(children: _pages, controller: _pageController),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTaped,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              // ignore: deprecated_member_use
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined),
              // ignore: deprecated_member_use
              title: Text('Marketing')),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              // ignore: deprecated_member_use
              title: Text('Tutotiales')),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              // ignore: deprecated_member_use
              title: Text('Solicitudes')),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment_outlined),
              // ignore: deprecated_member_use
              title: Text('Comisiones'))
        ],
      ),
    );
  }

  void onTaped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }
}

//Classes
class Notice {
  //Variables
  String name = "";
  String text = "";
  String image = "";
  String category = "";

  //Constructor
  Notice({this.name, this.text, this.image, this.category});
}

//Home
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  List<Notice> news = [
    Notice(
        name: "Sanitización a clientes sin costo",
        text: "",
        image: "http://picsum.photos/id/0/400/300",
        category: "Marketing"),
    Notice(
        name: "Noticia 2",
        text: "",
        image: "http://picsum.photos/id/1/400/300",
        category: "Otros productos"),
    Notice(
        name: "Noticia 3",
        text: "",
        image: "http://picsum.photos/id/2/400/300",
        category: "Tutoriales")
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'noticia');
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: NetworkImage(news[index].image),
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
                              news[index].category,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
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
                              left: 10.0, top: 5.0, right: 5.0, bottom: 5.0),
                          child: Text(
                            news[index].name,
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

//Marketing
class Marketing extends StatefulWidget {
  Marketing({Key key}) : super(key: key);
  @override
  _MarketingState createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> with AutomaticKeepAliveClientMixin<Marketing> {
  Color color = Colors.white;
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: color,
      child: FlatButton(
        onPressed: () {
          setState(() {
            color = Colors.cyan;
          });
        },
        child: Text('Cambiar color'),
      ),
    ));
  }
}
