import 'package:uuid/uuid.dart';
//Classe para trabalhar com objetos de Empresas

class Vagas {
  //Atributos da classe (iguais aos do banco de dados)
  String _id;
  String _vaga;
  String _preco;
  String _qtde;
  static Vagas vagaEditar; //Atributo usado na edição

  //Construtor
  Vagas(String vaga, String preco, String qtde){
    this._id = Uuid().v4();
    this._vaga = vaga;
    this._preco = preco;
    this._qtde = qtde;
  }

  //Construtor nomeado para edição de dados
  Vagas.editar(String id, String vaga, String preco, String qtde){
    this._id = id;
    this._vaga = vaga;
    this._preco = preco;
    this._qtde = qtde;
  }

  //Construtor nomeado que converte json para objeto
  Vagas.fromJson(Map<dynamic, dynamic> json)
      : _id = json['id'],
        _vaga = json['vaga'],
        _preco = json['preco'],
        _qtde = json['qtde'];

  //Método que de um objeto do tipo Vagas retorna um Map (json)
  Map<dynamic, dynamic> toJson() => {
    'id': _id,
    'vaga': _vaga,
    'preco': _preco,
    'qtde': _qtde,
  };

  //Getter e Setters da classe
  String get qtde => _qtde;

  set qtde(String value) {
    _qtde = value;
  }

  String get preco => _preco;

  set preco(String value) {
    _preco = value;
  }

  String get vaga => _vaga;

  set vaga(String value) {
    _vaga = value;
  }

  // ignore: unnecessary_getters_setters
  String get id => _id;

  // ignore: unnecessary_getters_setters
  set id(String value) {
    _id = value;
  }

  //Método toString sobrescrito para a saída (output) de dados.
  @override
  String toString() {
    return 'Id: $_id, Vagas: $_vaga, Preço: $_preco, Quantidade: $_qtde';
  }
}