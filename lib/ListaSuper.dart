import 'package:app/Candidato.dart';
import 'package:app/Empresa.dart';
import 'package:app/Vagas.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'banco/firebase_db.dart';
import 'banco/FirebaseCustom.dart';

// @dart=2.9

class MyListData extends StatefulWidget {
  const MyListData({Key key}) : super(key: key);

  @override
  _MyListDataState createState() => _MyListDataState();
}

class _MyListDataState extends State<MyListData> {
  String path = "produtos";
  int numItens;

  @override
  void initState() {
    getListaEmpresas();
    super.initState();
  }

  Future<List> getListaEmpresas() async {
    List<Empresa> listaEmpresa = [];
    DatabaseReference dataRef = Fire.database.ref(path);
    List data = await getList(dataRef);
    numItens = data.length;
    for(int i=0; i<data.length; i++) {
      DataSnapshot dadoAtual = data[i];
      Empresa empresa = Empresa.fromJson(dadoAtual.toJson());
      listaEmpresa.add(empresa);
    }
    return listaEmpresa;
  }

  Future<List> getListaCandidatos() async {
    List<Candidato> listaCandidato = [];
    DatabaseReference dataRef = Fire.database.ref(path);
    List data = await getList(dataRef);
    numItens = data.length;
    for(int i=0; i<data.length; i++) {
      DataSnapshot dadoAtual = data[i];
      Candidato candidato = Candidato.fromJson(dadoAtual.toJson());
      listaCandidato.add(candidato);
    }
    return listaCandidato;
  }

  Future<List> getListaVagas() async {
    List<Vagas> listaVaga = [];
    DatabaseReference dataRef = Fire.database.ref(path);
    List data = await getList(dataRef);
    numItens = data.length;
    for(int i=0; i<data.length; i++) {
      DataSnapshot dadoAtual = data[i];
      Vagas vaga = Vagas.fromJson(dadoAtual.toJson());
      listaVaga.add(vaga);
    }
    return listaVaga;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getListaEmpresas(),
      builder: (context, snapshot){
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                  backgroundColor: Colors.blue
              ),
            ),
          );
        } else {
          return DefaultTabController(
            length: 3, 
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Text("Empresas"),
                    Text("Candidatos"),
                    Text("Vagas")
                  ],
                ),
              ),
            body: TabBarView(
              children: <Widget>[

                // EMPRESAS

                ListView.builder(
                itemCount: numItens,
                itemBuilder: (context, value) {
                  return ListTile(
                      title: Text(snapshot.data[value].produto ?? "default"),
                      subtitle: Text("R\$ ${snapshot.data[value].preco}\n"
                          "Estoque: ${snapshot.data[value].qtde}" ?? "default"),
                      isThreeLine: true,
                      trailing: ElevatedButton(
                        child: Icon(Icons.delete_outline),
                        //Chamada da função delete...
                        onPressed: (){
                            FirebaseDB.firebaseDbInstance.deleteValueEmpresa(
                              snapshot.data[value].id
                            );
                            //Atualizar a tela
                            setState(() {
                              getListaEmpresas();
                            });
                          },
                      ),
                      /*onLongPress: (){
                        //Chamada da função update...
                        Empresa.empresaEditar = snapshot.data[value];
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>MyHomePage()));
                        //Atualizar a tela
                        setState(() {
                          getListaProdutos();
                        });
                      }*/
                  );
                }
            ),

            // CANDIDATOS

            ListView.builder(
                itemCount: numItens,
                itemBuilder: (context, value) {
                  return ListTile(
                      title: Text(snapshot.data[value].produto ?? "default"),
                      subtitle: Text("R\$ ${snapshot.data[value].preco}\n"
                          "Estoque: ${snapshot.data[value].qtde}" ?? "default"),
                      isThreeLine: true,
                      trailing: ElevatedButton(
                        child: Icon(Icons.delete_outline),
                        //Chamada da função delete...
                        onPressed: (){
                            FirebaseDB.firebaseDbInstance.deleteValueEmpresa(
                              snapshot.data[value].id
                            );
                            //Atualizar a tela
                            setState(() {
                              getListaEmpresas();
                            });
                          },
                      ),
                      /*onLongPress: (){
                        //Chamada da função update...
                        Empresa.empresaEditar = snapshot.data[value];
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>MyHomePage()));
                        //Atualizar a tela
                        setState(() {
                          getListaProdutos();
                        });
                      }*/
                  );
                }
            ),
            
            // VAGAS 

            ListView.builder(
                itemCount: numItens,
                itemBuilder: (context, value) {
                  return ListTile(
                      title: Text(snapshot.data[value].produto ?? "default"),
                      subtitle: Text("R\$ ${snapshot.data[value].preco}\n"
                          "Estoque: ${snapshot.data[value].qtde}" ?? "default"),
                      isThreeLine: true,
                      trailing: ElevatedButton(
                        child: Icon(Icons.delete_outline),
                        //Chamada da função delete...
                        onPressed: (){
                            FirebaseDB.firebaseDbInstance.deleteValueEmpresa(
                              snapshot.data[value].id
                            );
                            //Atualizar a tela
                            setState(() {
                              getListaEmpresas();
                            });
                          },
                      ),
                      /*onLongPress: (){
                        //Chamada da função update...
                        Empresa.empresaEditar = snapshot.data[value];
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>MyHomePage()));
                        //Atualizar a tela
                        setState(() {
                          getListaProdutos();
                        });
                      }*/
                  );
                }
            )
              ],
            ) 
            ),
          );
        }
      }
    );
  }
}