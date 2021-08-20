import 'package:uuid/uuid.dart';
//Classe para trabalhar com objetos de Empresas

class Empresa {
  //Atributos da classe (iguais aos do banco de dados)
  String _id;
  String _empresa;
  String _preco;
  String _qtde;
  static Empresa empresaEditar; //Atributo usado na edição

  //Construtor
  Empresa(String empresa, String preco, String qtde){
    this._id = Uuid().v4();
    this._empresa = empresa;
    this._preco = preco;
    this._qtde = qtde;
  }

  //Construtor nomeado para edição de dados
  Empresa.editar(String id, String empresa, String preco, String qtde){
    this._id = id;
    this._empresa = empresa;
    this._preco = preco;
    this._qtde = qtde;
  }

  //Construtor nomeado que converte json para objeto
  Empresa.fromJson(Map<dynamic, dynamic> json)
      : _id = json['id'],
        _empresa = json['empresa'],
        _preco = json['preco'],
        _qtde = json['qtde'];

  //Método que de um objeto do tipo Empresa retorna um Map (json)
  Map<dynamic, dynamic> toJson() => {
    'id': _id,
    'empresa': _empresa,
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

  String get empresa => _empresa;

  set empresa(String value) {
    _empresa = value;
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
    return 'Id: $_id, Empresa: $_empresa, Preço: $_preco, Quantidade: $_qtde';
  }
}