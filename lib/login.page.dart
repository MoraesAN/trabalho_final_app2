import 'package:app/CadastraCandidato.dart';
import 'package:app/CadastraEmpresa.dart';
import 'package:app/reset-password.page.dart';
import 'package:app/home.page.dart';
import 'package:app/signup.page.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_db_web_unofficial/DatabaseSnapshot.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

import 'banco/FirebaseCustom.dart';

class LoginPage extends StatelessWidget {

  TextEditingController controllerSenha = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("imagens/logo.png"),
            ),
            SizedBox(
            ),
            Container(
              padding: EdgeInsets.only(top: 0, left: 40, right: 40),
              child: Text(
                "Acesso para usuários cadastrados",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 300,
              height: 240,
              child: Image.asset("imagens/logos.png"),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, left: 40, right: 40),
              child: Text(
                "Ou",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.emailAddress,
              controller: controllerEmail,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: controllerSenha,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              style: TextStyle(fontSize: 17),
            ),

            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xfF3C5c99),
                    Color(0xFF3C3A99),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: SizedBox.expand(
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Acessar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () async {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Você é novo na InProgress?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                child: Text(
                  "Cadastrar-se como Candidato",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastraCandidato(),
                    ),
                  );
                },
              ),
              Padding(padding: EdgeInsets.only(right: 30)),
              TextButton(
                child: Text(
                  "Cadastre-se como Recrutador",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastraEmpresa(),
                    ),
                  );
                },
              ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}