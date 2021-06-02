library temporal_list;

import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/tutorial.dart';

//Lista de favoritos
List<int> favoriteList = [1];

//Lista de me gusta
List<int> likeList = [1, 3];

//Lista de noticias
List<Announcement> announcementList = [
  Announcement(
      id: 1,
      name: "Sanitización a clientes sin costo",
      text:
          "Planning to visit Las Vegas or any other vacational resort where casinos are a major portion of their business? I have just the thing for you. Here, I will show you how to pass off as a High Roller & collect many complimentary items and gifts.",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
      categoryName: "Marketing"),
  Announcement(
      id: 2,
      name: "Noticia 2",
      text: "Texto 2",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
      categoryName: "Otros productos"),
  Announcement(
      id: 3,
      name: "Noticia 3",
      text: "",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
      categoryName: "Tutoriales")
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
