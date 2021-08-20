import 'package:flutter/material.dart';
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
  TextEditingController controllerEmpresa = TextEditingController();
  TextEditingController controllerPreco = TextEditingController();
  TextEditingController controllerQtde = TextEditingController();

  //Função que joga para os campos de texto os valores editáveis
  /*void editarDados(){
    if(Empresa.empresaEditar != null) {
      controllerEmpresa.text = Empresa.empresaEditar.empresa;
      controllerPreco.text = Empresa.empresaEditar.preco;
      controllerQtde.text = Empresa.empresaEditar.qtde;
    }
  }*/

  //Método que cria o objeto que será gravado no banco de dados.
  void _gravarDados(){
    //Se for recebido de um objeto editável, chamará o construtor com id
    if(Empresa.empresaEditar != null){
      Empresa empresa = Empresa.editar(
          Empresa.empresaEditar.id,
          controllerEmpresa.text,
          controllerPreco.text,
          controllerQtde.text
      );
      FirebaseDB.firebaseDbInstance.setValueEmpresa(empresa);
      Empresa.empresaEditar = null;
      //Senão, se for recebido um objeto novo, chamará o construtor sem id
    } else {
      Empresa empresa = Empresa(
          controllerEmpresa.text,
          controllerPreco.text,
          controllerQtde.text
      );
      //Método setValue da instância da classe FirebaseDb.
      FirebaseDB.firebaseDbInstance.setValueEmpresa(empresa);
    }

    //Limpa os dados após salvar.
    controllerEmpresa.clear();
    controllerPreco.clear();
    controllerQtde.clear();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: InputDecoration(
              //Habilita a borda sem estar focada
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              //Habilita a borda quando o campo está em foco
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)
              ),
              labelText: "Empresa"
            ),
            controller: controllerEmpresa,
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: "Preço"
              ),
            controller: controllerPreco
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: "Quantidade"
              ),
            controller: controllerQtde
          ),
          ElevatedButton(
            child: Text("Gravar dados"),
            onPressed: _gravarDados
          ),
          ElevatedButton(
              child: Text("Listar dados"),
              onPressed: (){
                //Vai para a tela de listagem de dados
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyListData()));
              }
          )
        ],
      ),
    );
  }
}