library temporal_list;

import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/detail.dart';
import 'package:eft_app_comercial/Classes/tutorial.dart';

//Lista de favoritos
List<int> favoriteList = [1];

//Lista de me gusta
List<int> likeList = [1, 3];

//Lista de noticias
List<Announcement> announcementList = [
  Announcement(
      id: 1,
      name: "Aumento de precio en la gasolina",
      text:
          "Se tiene previsto un aumento de el precio de gasolina para inicios del proximo mes.",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
      categoryName: "Marketing"),
  Announcement(
      id: 2,
      name: "Sanitización a clientes sin costo",
      text:
          "Los clientes de todas las estaciones deben de recibir los protoculos basicos de sanidad ante la contingencia sanitaria por COVID-19 sin ningun tipo de costo o cargo.",
      image:
          "https://buentaller.com/wp-content/uploads/gasolinera-chevron-encuentra-una-cerca-de-ti.jpg",
      categoryName: "Marketing"),
  Announcement(
      id: 3,
      name: "Inauguración de nueva estación",
      text:
          "Se tiene prevista la inauguracion de una nueva estación en la zona.",
      image:
          "https://www.tendencias.mx/wp-content/uploads/2018/10/GASOLINERA-6.jpg",
      categoryName: "Otros Productos"),
  Announcement(
      id: 4,
      name: "La pandemia aún persiste",
      text:
          "La contingencia por COVID-19 continua hasta que las autoridades sanitarias dicten lo contrario, se deben seguir realizando todas las medidas sanitarias recomendadas.",
      image:
          "https://www.prisa.com/uploads/2020/05/resized/850_850banner-comite-emergencia-covid19-prisa.JPG",
      categoryName: "Otros Productos")
];

List<Announcement> promotionList = [
  Announcement(
      id: 5,
      name: "3x2 en todas la marcas de aceite",
      text:
          "Aplicable en todas las estaciones de la zona en el horario establecido.",
      image:
          "https://admin.idaoffice.org/wp-content/uploads/2019/03/%D0%B3%D0%BB%D0%B0%D0%B2%D0%BD%D0%B0%D1%8F-3-1000x550.jpg",
      categoryName: "Marketing"),
  Announcement(
      id: 6,
      name: "Descuento en boletos",
      text:
          "Los clientes pueden obtener un 25% de descuento por un boleto a partir de los 500 pesos. Y hasta un 50% de descuento por un boleto en una compra mayor a 1000 pesos.",
      image:
          "https://buentaller.com/wp-content/uploads/gasolinera-chevron-encuentra-una-cerca-de-ti.jpg",
      categoryName: "Otros Productos")
];

List<Detail> detail2List = [
  Detail(title: "Vigencia", subtitle: "30 de Junio"),
  Detail(title: "Horario", subtitle: "12:00 pm - 4:00 pm"),
  Detail(title: "Restriccion", subtitle: "Aceites de la misma marca")
];

//Lista de infografías
List<Tutorial> infoList = [
  Tutorial(
      name: "Tipo de cambio",
      source:
          "https://www.eleconomista.com.mx/__export/1600047748389/sites/eleconomista/img/2020/09/13/tipo-de-cambio_140920.png_642882265.png"),
  Tutorial(
      name: "Medidas sanitarias contra el COVID-19",
      source:
          "https://image.freepik.com/vector-gratis/infografia-coronavirus-espanol_23-2148488994.jpg"),
  Tutorial(
      name: "Agua segura",
      source:
          "https://aneas.com.mx/wp-content/uploads/2020/04/FireShot-Capture-701-http___prueba.aneas_.com_.mx_wp-content_uploads_2020_04_AGUA-SEGURA.pdf.jpg")
];

//Lista de manuales
List<Tutorial> manualList = [
  Tutorial(
      name: "MANUAL DE PROCEDIMIENTOS ESTACIONES DE SERVICIO",
      source:
          "https://repositorio.uisek.edu.ec/bitstream/123456789/2777/1/MANUAL%20DE%20PROCEDIMIENTOS%20PARA%20ESTACIONES%20DE%20SERVICIO.pdf")
];

//Lista de videos
List<Tutorial> videoList = [
  Tutorial(
      name: "Cómo Repostar Combustible",
      source: "https://files.catbox.moe/zkuxi5.mp4"),
  Tutorial(
      name: "Como cambiar una llanta de tu automóvil",
      source: "https://files.catbox.moe/i2n3zq.mp4")
];
