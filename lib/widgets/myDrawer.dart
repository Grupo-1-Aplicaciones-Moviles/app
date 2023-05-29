import 'package:flutter/material.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  String userType = 'agency';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF9CD4E7),
            ),
            child: Text('prueba'),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Mi inicio'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
          ),
          if (userType == 'agency')
            const ListTile(
              leading: Icon(Icons.accessibility),
              title: Text('Mis clientes'),
            ),
          if (userType == 'agency')
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text('Cambiar Plan'),
            ),
          const ListTile(
            leading: Icon(Icons.output),
            title: Text('Cerrar sesión'),
          )
        ],
      ),
    );
  }
}