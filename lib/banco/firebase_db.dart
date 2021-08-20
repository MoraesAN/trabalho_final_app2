import 'package:app/Candidato.dart';
import 'package:app/Empresa.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'FirebaseCustom.dart';


class FirebaseDB {
  //Criando um singleton da classe (usar a mesma instância para várias operações)
  static FirebaseDB firebaseDbInstance = FirebaseDB();
  //Nó (child) onde colocaremos nosso cadastros
  //String path = "produtos";

//Inserir dados
  void setValueEmpresa(Empresa empresa) {
    String path = "empresa";
    //Inserindo o valor recebido no parâmetro "produto"
    //dentro do child "produtos" (definido no atributo "path" desta classe)
    FirebaseDatabaseWeb.instance.reference()
        .child(path).child(empresa.id).child("id").set(empresa.id);

    //Inserindo o valor recebido no parâmetro "preco"
    //dentro do child "produtos" (definido no atributo "path" desta classe)
    FirebaseDatabaseWeb.instance.reference()
        .child(path).child(empresa.id).child("preco").set(empresa.preco);

    //Inserindo o valor recebido no parâmetro "qtde"
    //dentro do child "produtos" (definido no atributo "path" desta classe)
    FirebaseDatabaseWeb.instance.reference()
        .child(path).child(empresa.id).child("qtde").set(empresa.qtde);

    if(FirebaseDatabaseWeb.instance.reference().child(path)
        .child(empresa.id).key == empresa.id){
      print("Empresa cadastrada com sucesso!");
    } else {
      print("Empresa não cadastrada...");
    }
  }

  void setValueCandidato(Candidato candidato) {
    String path = "candidato";
    //Inserindo o valor recebido no parâmetro "produto"
    //dentro do child "produtos" (definido no atributo "path" desta classe)
    FirebaseDatabaseWeb.instance.reference()
        .child(path).child(candidato.id).child("id").set(candidato.id);

    FirebaseDatabaseWeb.instance.reference()
        .child(path).child(candidato.id).child("nome").set(candidato.nome);

    //Inserindo o valor recebido no parâmetro "preco"
    //dentro do child "produtos" (definido no atributo "path" desta classe)
    FirebaseDatabaseWeb.instance.reference()
        .child(path).child(candidato.id).child("email").set(candidato.email);

    //Inserindo o valor recebido no parâmetro "qtde"
    //dentro do child "produtos" (definido no atributo "path" desta classe)
    FirebaseDatabaseWeb.instance.reference()
        .child(path).child(candidato.id).child("senha").set(candidato.senha);

    if(FirebaseDatabaseWeb.instance.reference().child(path)
        .child(candidato.id).key == candidato.id){
      print("Candidato cadastrada com sucesso!");
    } else {
      print("Candidato não cadastrada...");
    }
  }

//Pegar dados (ler)
  Future<List> getValueEmpresa() async {
    String path = "empresa";
    //Capturado a referência (nó) principal
    //(neste caso, o nó "produtos", definido na variável "path")
    DatabaseReference dataRef = Fire.database.ref(path);
    //"data" recebe uma lista com todos os sub-nós de produtos.
    //getList é um método que está no arquivo FirebaseCustom.dart
    List data = await getList(dataRef);
    //Laço de repetição para ler todos os dados da lista "data"
    for(int i=0; i<data.length; i++) {
      //dadoAtual (DataSnapshot) receberá o valor
      //de "data" no índice correspondente
      DataSnapshot dadoAtual = data[i];
      //Convertendo dadoAtual para json, e depois para objeto Produto
      Empresa empresa = Empresa.fromJson(dadoAtual.toJson());
      
    }
    return data;
  }

  Future<List> getValueCandidato() async {
    String path = "candidato";
    //Capturado a referência (nó) principal
    //(neste caso, o nó "produtos", definido na variável "path")
    DatabaseReference dataRef = Fire.database.ref(path);
    //"data" recebe uma lista com todos os sub-nós de produtos.
    //getList é um método que está no arquivo FirebaseCustom.dart
    List data = await getList(dataRef);
    //Laço de repetição para ler todos os dados da lista "data"
    for(int i=0; i<data.length; i++) {
      //dadoAtual (DataSnapshot) receberá o valor
      //de "data" no índice correspondente
      DataSnapshot dadoAtual = data[i];
      //Convertendo dadoAtual para json, e depois para objeto Produto
      Candidato candidato = Candidato.fromJson(dadoAtual.toJson());
      
    }
    return data;
  }

//Removendo um dado do banco de dados
  void deleteValueEmpresa(String id) {
    FirebaseDatabaseWeb.instance.reference()
        .child('empresa')
        .child(id)
        .remove();
  }
  void deleteValueCandidato(String id) {
    FirebaseDatabaseWeb.instance.reference()
        .child('candidato')
        .child(id)
        .remove();
  }
}