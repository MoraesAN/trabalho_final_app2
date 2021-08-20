import 'package:uuid/uuid.dart';
//Classe para trabalhar com objetos de Candidatos

class Candidato {
  //Atributos da classe (iguais aos do banco de dados)
  String _id;
  String _nome;
  String _email;
  String _senha;
  static Candidato candidatoEditar; //Atributo usado na edição

  //Construtor
  Candidato(String nome, String email, String senha){
    this._id = Uuid().v4();
    this._nome = nome;
    this._email = email;
    this._senha = senha;
  }

  //Construtor nomeado para edição de dados
  Candidato.editar(String id, String nome, String email, String senha){
    this._id = id;
    this._nome = nome;
    this._email = email;
    this._senha = senha;
  }

  //Construtor nomeado que converte json para objeto
  Candidato.fromJson(Map<dynamic, dynamic> json)
      : _id = json['id'],
        _nome = json['nome'],
        _email = json['email'],
        _senha = json['senha'];

  //Método que de um objeto do tipo Candidato retorna um Map (json)
  Map<dynamic, dynamic> toJson() => {
    'id': _id,
    'nome': _nome,
    'email': _email,
    'senha': _senha,
  };

  //Getter e Setters da classe
  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
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
    return 'Id: $_id, Candidato: $_nome, Email: $_email, Senha: $_senha';
  }
}