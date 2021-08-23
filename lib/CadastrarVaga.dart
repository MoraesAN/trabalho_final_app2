
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'Vagas.dart';
import 'banco/firebase_db.dart';

class CadastraVagas extends StatefulWidget {
  CadastraVagas({Key key}) : super(key: key);

  @override
  _CadastraVagasState createState() => _CadastraVagasState();
}

class _CadastraVagasState extends State<CadastraVagas> {
  //Controladores dos TextFields
  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerData = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();
  TextEditingController controllerEmpresa = TextEditingController();
  TextEditingController controllerLocal = TextEditingController();
  
  //Função que joga para os campos de texto os valores editáveis
  /*voempresa editarDados(){
    if(Vagas.vagaEditar != null) {
      controllerNome.text = Vagas.vagaEditar.vaga;
      controllerEmail.text = Vagas.vagaEditar.data;
      controllerSenha.text = Vagas.vagaEditar.local;
    }
  }*/

  //Método que cria o objeto que será gravado no banco de dados.
  void _gravarDados(){
    //Se for recebempresao de um objeto editável, chamará o construtor com empresa
    if(Vagas.vagaEditar != null){
      Vagas vaga = Vagas.editar(
          Vagas.vagaEditar.empresa,
          controllerTitulo.text,
          controllerLocal.text,
          controllerData.text
      );
      FirebaseDB.firebaseDbInstance.setValueVagas(vaga);
      Vagas.vagaEditar = null;
      //Senão, se for recebempresao um objeto novo, chamará o construtor sem empresa
    } else {
      Vagas vaga = Vagas(
          controllerEmpresa.text,
          controllerTitulo.text,
          controllerLocal.text,
          controllerData.text
      );
      //Método setValue da instância da classe FirebaseDb.
      FirebaseDB.firebaseDbInstance.setValueVagas(vaga);
    }

    //Limpa os dados após salvar.
    controllerEmpresa.clear();
    controllerTitulo.clear();
    controllerLocal.clear();
    controllerData.clear();
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
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Titulo",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              controller: controllerTitulo,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Empresa",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              controller: controllerEmpresa,
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
              decoration: InputDecoration(
                labelText: "Descrição",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              controller: controllerDescricao,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Local",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              controller: controllerLocal,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
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
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    setVaga(controllerTitulo.text, controllerData.text, controllerDescricao.text, controllerEmpresa.text, controllerLocal.text);
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

void setVaga(String titulo, String data, String descricao,String empresa, String local){
  String path = 'vaga';
  String id = Uuid().v4();
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("id").set(id);
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("titulo").set(titulo);
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("descricao").set(descricao);
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("data").set(data);
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("empresa").set(empresa);
  FirebaseDatabaseWeb.instance.reference()
        .child(path).child(id).child("local").set(local);
  
  if(FirebaseDatabaseWeb.instance.reference().child(path)
        .child(id).key == id){
      print("Cadastro Realizado com sucesso!");
  } else {
    print("Erro");
  }
}