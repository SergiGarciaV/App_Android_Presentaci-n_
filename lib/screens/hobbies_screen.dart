import 'package:flutter/material.dart';

class HobbiesScreen extends StatefulWidget {
  @override
  _HobbiesScreenState createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Lista de hobbies con información sobre cada uno
  final List<Map<String, dynamic>> hobbies = [
    {
      "name": "Leer",
      "image": "assets/imagenes/libro1.png",
      "movingImage": "assets/imagenes/libroMov.png",
      "description":
      "Leer es una de mis pasiones porque me permite sumergirme en diferentes mundos, expandir mi conocimiento y desarrollar mi imaginación. Me brinda la oportunidad de explorar ideas nuevas, entender diferentes perspectivas y disfrutar de momentos de tranquilidad y reflexión.",
    },
    {
      "name": "Escribir código",
      "image": "assets/imagenes/codigo.png",
      "movingImage": "assets/imagenes/codigoMov.png",
      "description":
      "Escribir código es una de las cosas con las que más disfruto porque me permite crear soluciones innovadoras, resolver problemas y dar vida a ideas creativas. Me encanta el desafío intelectual que implica la programación, así como la satisfacción de ver cómo mis proyectos cobran vida y tienen un impacto positivo en el mundo.",
    },
    {
      "name": "Carpintería",
      "image": "assets/imagenes/carpinteria.png",
      "movingImage": "assets/imagenes/carpinteriaMov.png",
      "description":
      "La carpintería es una de mis aficiones porque me permite trabajar con mis manos, expresar mi creatividad y crear objetos únicos y funcionales. Disfruto del proceso de diseño y construcción, así como de la satisfacción de ver el resultado final de mis proyectos.",
    },
    {
      "name": "Viajar",
      "image": "assets/imagenes/viajar.png",
      "movingImage": "assets/imagenes/viajarMov.png",
      "description":
      "Viajar es uno de mis placeres porque me brinda la oportunidad de explorar nuevas culturas, conocer gente interesante y crear recuerdos inolvidables. Disfruto de la emoción de descubrir lugares nuevos, probar comidas exóticas y sumergirme en aventuras que amplían mis horizontes.",
    },
    {
      "name": "Jugar con mis hijas",
      "image": "assets/imagenes/hijas.png",
      "movingImage": "assets/imagenes/hijasMov.png",
      "description":
      "Jugar con mis hijas es una de mis mayores alegrías porque me permite conectar con ellas, compartir momentos de diversión y crear lazos familiares fuertes. Disfruto de la inocencia y la creatividad de los juegos infantiles, así como de la oportunidad de ser un modelo a seguir y crear recuerdos especiales juntos.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Método para construir la imagen que se mueve
  Widget _buildMovingImage(String movingImagePath) {
    return Container(
      width: 50, // Ajusta el ancho del contenedor según sea necesario
      height: 50, // Ajusta la altura del contenedor según sea necesario
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          double movement = (_controller.value * 2 - 1) * 40.0;
          return Transform.translate(
            offset: Offset(
                movement - 25, 0), // Ajuste para centrar más a la izquierda
            child: Image.asset(
              movingImagePath,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aficiones',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        // Fondo degradado toda pantalla
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.black],
          ),
        ),
        child: ListView.builder(
          itemCount: hobbies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Añadir margen vertical
              child: Card(
                margin: EdgeInsets.all(9.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Redondea los bordes del Card
                ),
                child: Container(
                  child: ExpansionTile(
                    backgroundColor: Colors.transparent, // Hace que el fondo del ExpansionTile sea transparente
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            hobbies[index]["name"],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 8, height: 80), // Espacio entre el texto y la imagen
                        _buildMovingImage(hobbies[index]["movingImage"]), // Construye la imagen que se mueve
                      ],
                    ),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration( // Aplica el gradiente al fondo del ExpansionTile
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blueAccent, Colors.grey], // Color degradado predefinido
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              hobbies[index]["image"],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              '${hobbies[index]["description"]}',
                              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
