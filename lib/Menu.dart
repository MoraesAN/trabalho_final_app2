import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Menu extends StatefulWidget {
  const Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepPurple),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                child: Center(
                  child: Image.asset("imagens/user_picture.png"),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Minhas vagas",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
              
              
              Divider(),
              ListTile(
                title: Text(
                  "Configurações",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
  }
}