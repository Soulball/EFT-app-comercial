library temporal_list;

import 'package:eft_app_comercial/Classes/detail.dart';
import 'package:eft_app_comercial/Classes/new.dart';
import 'package:eft_app_comercial/Classes/tutorial.dart';

//Lista de favoritos
List<String> favoriteList = ["Sanitización a clientes sin costo"];

//Lista de me gusta
List<String> likeList = ["Noticia 2"];

//Lista de noticias
List<New> newsList = [
  New(
      name: "Sanitización a clientes sin costo",
      text:
          "Planning to visit Las Vegas or any other vacational resort where casinos are a major portion of their business? I have just the thing for you. Here, I will show you how to pass off as a High Roller & collect many complimentary items and gifts.",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
      category: "Marketing"),
  New(
      name: "Noticia 2",
      text: "Texto 2",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
      category: "Otros productos"),
  New(
      name: "Noticia 3",
      text: "",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
      category: "Tutoriales")
];

//Lista de datos
List<Detail> detailsList = [
  Detail(
      newId: "Sanitización a clientes sin costo",
      title: "VIGENCIA",
      subtitle: "Martes 3 a Jueves 21"),
  Detail(
      newId: "Sanitización a clientes sin costo",
      title: "Dinámica",
      subtitle: "Martes 3 a Jueves 21"),
  Detail(
      newId: "Sanitización a clientes sin costo",
      title: "Nota 1",
      subtitle: "Datos"),
  Detail(
      newId: "Sanitización a clientes sin costo",
      title: "Nota 2",
      subtitle: "Datos")
];

//Lista de infografías
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

//Lista de manuales
List<Tutorial> manualList = [
  Tutorial(
      name: "Sanitización",
      source: "https://www.redalyc.org/pdf/2570/257031319008.pdf"),
  Tutorial(
      name: "Sanitización a clientes sin costo",
      source: "https://www.redalyc.org/pdf/2570/257031319008.pdf"),
  Tutorial(
      name: "Sanitización a clientes sin costo",
      source: "https://www.redalyc.org/pdf/2570/257031319008.pdf"),
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

//Lista de videos
List<Tutorial> videoList = [
  Tutorial(
      name: "Sanitización a clientes sin costo",
      source:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
  Tutorial(
      name: "Sanitización a clientes sin costo",
      source:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
  Tutorial(
      name: "Sanitización a clientes sin costo",
      source:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
];
