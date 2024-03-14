import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CvScreen extends StatefulWidget {
  @override
  _CvScreenState createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Configuración de la animación para la imagen
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.9, end: 1.1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi CV',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Fondo degradado para la pantalla completa
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.black],
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),

                // Imagen animada en el centro
                Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: Image.asset(
                          'assets/imagenes/curric.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),

                // Sección de Experiencia Laboral
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // Márgenes y relleno para el contenedor de Experiencia Laboral
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity, // Ancho completo
                    // Decoración del contenedor con gradiente, borde redondeado y color de fondo
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blueAccent, Colors.grey],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orangeAccent, width: 3), // Borde con color y grosor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Título de la sección de Experiencia Laboral
                        Text(
                          'Experiencia Laboral',
                          style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 5),

                        // Lista de elementos de Experiencia Laboral
                        ExperienceItem(
                          title: '\nTecnico Radiólogo',
                          company: 'Ascires',
                          duration: 'Noviembre 2014 - Presente',
                          description: 'Especialista en desarrollo de protocolos para estudios RM y TC, en equipos GE y Siemens',
                        ),
                        ExperienceItem(
                          title: '\nEncargado Perfumería',
                          company: 'La Balear',
                          duration: 'Junio 2008 - Octubre 2014',
                          description: 'Encargado de negocio de tipo droguería/perfumería de venta al detalle. Responsable de Ventas y almacen.',
                        ),
                      ],
                    ),
                  ),
                ),

                // Sección de Educación
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // Márgenes y relleno para el contenedor de Educación
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity, // Ancho completo
                    // Decoración del contenedor con gradiente, borde redondeado y color de fondo
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blueAccent, Colors.grey],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orangeAccent, width: 2), // Borde con color y grosor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Título de la sección de Educación
                        Text(
                          'Educación',
                          style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 20),

                        // Lista de elementos de Educación
                        EducationItem(
                          degree: '\nAnalista de Ciberseguridad',
                          institution: 'Google',
                          duration: '2023 - 2024',
                        ),
                        EducationItem(
                          degree: '\nDesarrollador de Aplicaciones Multiplataforma',
                          institution: 'Escola Prat',
                          duration: '2022 - 2024',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget para representar elementos de Experiencia Laboral
class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final String description;

  const ExperienceItem({
    Key? key,
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Título del puesto de trabajo
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // Nombre de la empresa
        Text(company),
        // Duración del trabajo
        Text(duration),
        // Descripción detallada de responsabilidades y logros
        Text(description),
        SizedBox(height: 10),
      ],
    );
  }
}

// Widget para representar elementos de Educación
class EducationItem extends StatelessWidget {
  final String degree;
  final String institution;
  final String duration;

  const EducationItem({
    Key? key,
    required this.degree,
    required this.institution,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Título del grado académico
        Text(
          degree,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // Nombre de la institución educativa
        Text(institution),
        // Período de duración de la educación
        Text(duration),
        SizedBox(height: 10),
      ],
    );
  }
}