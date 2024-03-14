import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa el paquete para lanzar URLs

class PortfolioScreen extends StatelessWidget {
  final List<Map<String, String>> portfolioItems = [
    {
      "title": "Proyectos de Ciberseguridad",
      "description": "He realizado proyectos de ciberseguridad que abordan diversas áreas de esta disciplina, incluyendo análisis de vulnerabilidades, pruebas de penetración, y diseño de sistemas de seguridad. Estos proyectos han implicado la implementación de técnicas avanzadas para proteger sistemas informáticos y redes contra amenazas cibernéticas, así como la identificación y mitigación de posibles riesgos de seguridad.",
      "imageUrl": "https://github.com/SergiGarciaV/Imagenes/blob/main/cybersec.png?raw=true",
      "link" : "https://github.com/SergiGarciaV/Cyber_Security_Projects",
    },
    {
      "title": "Proyectos con Python",
      "description": "Durante mi trayectoria, he llevado a cabo diversos proyectos utilizando el lenguaje de programación Python. Estos proyectos abarcan áreas como análisis de datos, desarrollo web, inteligencia artificial y machine learning. He utilizado librerías como NumPy, Pandas, Django y TensorFlow para desarrollar soluciones eficientes y efectivas en diversas aplicaciones.",
      "imageUrl": "https://github.com/SergiGarciaV/Imagenes/blob/main/python.png?raw=true",
      "link" : "https://github.com/SergiGarciaV/Python_Projects",
    },
    {
      "title": "Proyectos con Java",
      "description": "He desarrollado una variedad de proyectos utilizando el lenguaje de programación Java. Estos proyectos incluyen aplicaciones de escritorio, desarrollo de aplicaciones móviles con Android, y la creación de sistemas distribuidos utilizando tecnologías como Spring Framework. Mis proyectos en Java han demostrado mi capacidad para diseñar y construir soluciones robustas y escalables utilizando este poderoso lenguaje de programación.",
      "imageUrl": "https://github.com/SergiGarciaV/Imagenes/blob/main/java.png?raw=true",
      "link" : "https://github.com/SergiGarciaV/Java_Projects",
    },
    {
      "title": "Proyectos WEB",
      "description": "He desarrollado una serie de proyectos web que abarcan diferentes tecnologías y áreas de desarrollo. Estos proyectos incluyen la creación de sitios web estáticos y dinámicos, aplicaciones web interactivas, y sistemas de gestión de contenidos (CMS). He trabajado con tecnologías como HTML, CSS, JavaScript, React, Node.js, y MongoDB para diseñar y construir experiencias web atractivas y funcionales.",
      "imageUrl": "https://github.com/SergiGarciaV/Imagenes/blob/main/web.png?raw=true",
      "link" : "https://github.com/SergiGarciaV/WEB-PROJECTS",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
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
          itemCount: portfolioItems.length,
          itemBuilder: (context, index) {
            var item = portfolioItems[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 9), // Añade relleno vertical y horizontal
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blueAccent, Colors.grey], // Define el gradiente de colores
                  ),
                  borderRadius: BorderRadius.circular(10), // Redondea los bordes del contenedor
                  border: Border.all(color: Colors.orangeAccent, width: 2), // Añade borde con color naranja
                ),
                child: ExpansionTile(
                  leading: Image.network(item["imageUrl"]!, fit: BoxFit.contain), // Muestra la imagen del proyecto
                  title: Text(item["title"]!), // Muestra el título del proyecto
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                      child: Text(item["description"]!), // Muestra la descripción del proyecto
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                      child: Text("Link al proyecto en GitHub", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),), // Muestra el texto del link
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: InkWell(
                        onTap: () async {
                          if (await canLaunch(item["link"]!)) { // Verifica si se puede lanzar la URL
                            await launch(item["link"]!); // Lanza la URL en el navegador
                          } else {
                            throw 'Could not launch ${item["link"]}'; // Lanza una excepción si no se puede lanzar la URL
                          }
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset('assets/imagenes/github.png', width: 44, height: 44), // Muestra el icono de GitHub
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
