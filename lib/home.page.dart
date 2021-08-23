import 'package:app/CadastrarVaga.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Center(
          child: SizedBox(
            width: 40,
            child: Image.asset("imagens/user_picture.png"),
          ),
        ),
        
        actions: <Widget>[
          Container(
            width: 60,
            child: TextButton(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => {
                 
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
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
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Candidaturas",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Buscar vagas",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Empresas",
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
      body: Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CadastraVagas(),
                      ),
                    );
                    },
        child: const Icon(Icons.add_box_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "imagens/app-empresa.png"),
          ),
          title: Text("Vaga"),
          subtitle: Text("Empresa                                                                    "
              "Porto Alegre, Rio Grande sul, Brasil."),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 68, right: 20),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
        ),
        ButtonTheme(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.favorite),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}