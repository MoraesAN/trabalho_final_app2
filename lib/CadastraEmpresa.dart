import 'package:app/login.page.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'Empresa.dart';
import 'banco/firebase_db.dart';
import 'ListaSuper.dart';


class CadastraEmpresa extends StatefulWidget {
  CadastraEmpresa({Key key}) : super(key: key);

  @override
  _CadastraEmpresaState createState() => _CadastraEmpresaState();
}

class _CadastraEmpresaState extends State<CadastraEmpresa> {
  //Controladores dos TextFields
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  //Método que cria o objeto que será gravado no banco de dados.
  void _gravarDados(){
    //Se for recebido de um objeto editável, chamará o construtor com id
    if(Empresa.empresaEditar != null){
      Empresa empresa = Empresa.editar(
          Empresa.empresaEditar.id,
          controllerNome.text,
          controllerEmail.text,
          controllerSenha.text
      );
      FirebaseDB.firebaseDbInstance.setValueEmpresa(empresa);
      Empresa.empresaEditar = null;
      //Senão, se for recebido um objeto novo, chamará o construtor sem id
    } else {
      Empresa empresa = Empresa(
          controllerNome.text,
          controllerEmail.text,
          controllerSenha.text
      );
      //Método setValue da instância da classe FirebaseDb.
      FirebaseDB.firebaseDbInstance.setValueEmpresa(empresa);
    }

    //Limpa os dados após salvar.
    controllerNome.clear();
    controllerEmail.clear();
    controllerSenha.clear();
  }

  //initState para executar o método editarDados toda a vez que
  //a tela for aberta.
  @override
  void initState() {
    //editarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("imagens/profile-picture.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1.0],
                    colors: [
                      Color(0xfF3C5c99),
                      Color(0xFF3C3A99),
                    ],
                  ),
                  border: Border.all(
                    width: 4.0,
                    color: const Color(0xFFFFFFFF),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(56),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              controller: controllerNome,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              controller: controllerEmail,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              controller: controllerSenha,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
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
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                    
                  ),
                  onPressed: () {
                    setEmpresa(controllerNome.text, controllerEmail.text, controllerSenha.text);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Função que joga para os campos de texto os valores editáveis
  /*void editarDados(){
    if(Empresa.empresaEditar != null) {
      controllerNome.text = Empresa.empresaEditar.empresa;
      controllerEmail.text = Empresa.empresaEditar.preco;
      controllerSenha.text = Empresa.empresaEditar.qtde;
    }
  }*/
void setEmpresa(String nome, String email, String senha){
  String path = 'usuario';
  String id = Uuid().v4();
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("id").set(id);

  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("nome").set(nome);

  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("email").set(email);
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("tipo").set("1");

  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("senha").set(senha);
  
  if(FirebaseDatabaseWeb.instance.reference().child(path)
        .child(id).key == id){
      print("Cadastro realizado com sucesso!");
  } else {
    print("Erro");
  }

}