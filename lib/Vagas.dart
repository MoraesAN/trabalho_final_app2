
class Vagas {
  //Atributos da classe (iguais aos do banco de dados)
  String _empresa;
  String _titulo;
  String _data;
  String _local;
  static Vagas vagaEditar; //Atributo usado na edição

  //Construtor
  Vagas(String empresa, String titulo, String local, String data){
    this._empresa = empresa;
    this._titulo = titulo;
    this._data = data;
    this._local = local;
  }

  //Construtor nomeado para edição de dados
  Vagas.editar(String empresa, String titulo, String data, String local){
    this._empresa = empresa;
    this._titulo = titulo;
    this._data = data;
    this._local = local;
  }

  //Construtor nomeado que converte json para objeto
  Vagas.fromJson(Map<dynamic, dynamic> json)
      : _empresa = json['empresa'],
        _titulo = json['titulo'],
        _data = json['data'],
        _local = json['local'];

  //Método que de um objeto do tipo Vagas retorna um Map (json)
  Map<dynamic, dynamic> toJson() => {
    'empresa': _empresa,
    'titulo': _titulo,
    'data': _data,
    'local': _local,
  };

  //Getter e Setters da classe
  String get local => _local;

  set local(String value) {
    _local = value;
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }

  // ignore: unnecessary_getters_setters
  String get empresa => _empresa;

  // ignore: unnecessary_getters_setters
  set empresa(String value) {
    _empresa = value;
  }

  //Método toString sobrescrito para a saída (output) de dados.
  @override
  String toString() {
    return 'empresa: $_empresa, Vaga: $_titulo, Data: $_data, local: $_local';
  }
}