import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Configuración de la barra de la aplicación
        title: Text(
          'Inicio', // Título de la barra de la aplicación
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white), // Estilo del texto del título
        ),
        backgroundColor: Colors.blueAccent, // Color de fondo de la barra de la aplicación
        elevation: 0, // Sin elevación
        iconTheme: IconThemeData(color: Colors.white), // Color del icono del menú
      ),
      body: Container(
        // Contenedor del cuerpo de la aplicación
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Gradiente de fondo
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.black],
          ),
        ),
        child: Center(
          // Centra los elementos hijos
          child: Column(
            // Columna para organizar los elementos verticalmente
            mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos verticalmente

            children: [
              // Lista de widgets hijos
              Image.asset(
                // Imagen de la foto personal
                'assets/imagenes/miFoto2.png',
                width: 400,
                height: 290,
                fit: BoxFit.cover,
              ),
              Image.asset(
                // Imagen de la firma
                'assets/imagenes/firma.png',
                width: 255,
                height: 90,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 60), // Espacio vertical entre la imagen y el texto
              Text(
                // Texto informativo
                '¡Conóceme en las secciones del Menú!',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Configuración del menú lateral
        child: ListView(
          padding: EdgeInsets.zero, // Sin relleno
          children: <Widget>[
            DrawerHeader(
              // Encabezado del menú lateral
              child: Text(
                'Menú', // Título del encabezado
                style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white70), // Estilo del texto del encabezado
              ),
              decoration: BoxDecoration(
                // Decoración del encabezado
                gradient: LinearGradient(
                  // Gradiente de fondo
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueAccent, Colors.black],
                ),
              ),
            ),
            // Opciones del menú
            ListTile(
              leading: Icon(Icons.home), // Icono de la opción
              title: Text(
                'Inicio', // Texto de la opción
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87), // Estilo del texto de la opción
              ),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person), // Icono de la opción
              title: Text(
                'CV', // Texto de la opción
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87), // Estilo del texto de la opción
              ),
              onTap: () {
                Navigator.pushNamed(context, '/cv'); // Navega a la pantalla de CV
              },
            ),
            ListTile(
              leading: Icon(Icons.work), // Icono de la opción
              title: Text(
                'Portfolio', // Texto de la opción
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87), // Estilo del texto de la opción
              ),
              onTap: () {
                Navigator.pushNamed(context, '/portfolio'); // Navega a la pantalla de Portfolio
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite), // Icono de la opción
              title: Text(
                'Aficiones', // Texto de la opción
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87), // Estilo del texto de la opción
              ),
              onTap: () {
                Navigator.pushNamed(context, '/hobbies'); // Navega a la pantalla de Aficiones
              },
            ),
          ],
        ),
      ),
    );
  }
}
