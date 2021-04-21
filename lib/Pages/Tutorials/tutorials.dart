import 'package:eft_app_comercial/Pages/Tutorials/infos.dart';
import 'package:eft_app_comercial/Pages/Tutorials/manuals.dart';
import 'package:eft_app_comercial/Pages/Tutorials/videos.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion para tutoriales
class Tutorials extends StatefulWidget {
  Tutorials({Key key}) : super(key: key);
  @override
  _TutorialsState createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  //Variables
  PageController _pageController;
  final List<Widget> _pages = [Infos(), Manuals(), Videos()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Tutoriales')),
        body: PageView(children: _pages, controller: _pageController));
  }
}
