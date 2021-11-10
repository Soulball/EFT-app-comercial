//Boton que permite cambiar la pantalla
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchDropButton extends StatefulWidget {
  //Variables
  String name;
  String defaultValue;
  bool search;
  bool visible;
  String selectedItem;
  List<String> items;

  //Constructor
  CustomSearchDropButton(
      {this.name, this.defaultValue, this.search, this.items, this.visible});

  @override
  _CustomSearchDropButtonState createState() => _CustomSearchDropButtonState();
}

class _CustomSearchDropButtonState extends State<CustomSearchDropButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
        mode: Mode.MENU,
        label: widget.name,
        showSearchBox: widget.search,
        hint: widget.defaultValue,
        selectedItem: widget.selectedItem,
        items: widget.items,
        onChanged: (String data) {
          setState(() {
            widget.selectedItem = data;
            print(widget.selectedItem);
          });
        });
  }
}
