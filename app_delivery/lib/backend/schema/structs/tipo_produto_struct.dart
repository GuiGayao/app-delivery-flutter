// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TipoProdutoStruct extends BaseStruct {
  TipoProdutoStruct({
    int? id,
    String? nome,
    String? descricao,
    int? preco,
    String? foto,
  })  : _id = id,
        _nome = nome,
        _descricao = descricao,
        _preco = preco,
        _foto = foto;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "preco" field.
  int? _preco;
  int get preco => _preco ?? 0;
  set preco(int? val) => _preco = val;

  void incrementPreco(int amount) => preco = preco + amount;

  bool hasPreco() => _preco != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  static TipoProdutoStruct fromMap(Map<String, dynamic> data) =>
      TipoProdutoStruct(
        id: castToType<int>(data['id']),
        nome: data['nome'] as String?,
        descricao: data['descricao'] as String?,
        preco: castToType<int>(data['preco']),
        foto: data['foto'] as String?,
      );

  static TipoProdutoStruct? maybeFromMap(dynamic data) => data is Map
      ? TipoProdutoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'descricao': _descricao,
        'preco': _preco,
        'foto': _foto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'preco': serializeParam(
          _preco,
          ParamType.int,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
      }.withoutNulls;

  static TipoProdutoStruct fromSerializableMap(Map<String, dynamic> data) =>
      TipoProdutoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        preco: deserializeParam(
          data['preco'],
          ParamType.int,
          false,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TipoProdutoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TipoProdutoStruct &&
        id == other.id &&
        nome == other.nome &&
        descricao == other.descricao &&
        preco == other.preco &&
        foto == other.foto;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nome, descricao, preco, foto]);
}

TipoProdutoStruct createTipoProdutoStruct({
  int? id,
  String? nome,
  String? descricao,
  int? preco,
  String? foto,
}) =>
    TipoProdutoStruct(
      id: id,
      nome: nome,
      descricao: descricao,
      preco: preco,
      foto: foto,
    );
