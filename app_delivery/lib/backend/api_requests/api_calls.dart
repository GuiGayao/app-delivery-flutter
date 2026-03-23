import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ApiXanoCadastroUsuarioCall {
  static Future<ApiCallResponse> call({
    String? usuarioNome = '',
    String? usuarioEmail = '',
    String? usuarioSenha = '',
    int? usuarioPapel,
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(usuarioNome)}",
  "email": "${escapeStringForJson(usuarioEmail)}",
  "password": "${escapeStringForJson(usuarioSenha)}",
  "papel_id": "${usuarioPapel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiXanoCadastroUsuario',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:QlkdMoa5/auth/signup',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiXanoValidarEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'apiXanoValidarEmail',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:HlHQOxlZ/validarEmail',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalvarCepCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
    String? cidade = '',
    String? estado = '',
  }) async {
    final ffApiRequestBody = '''
{
  "cep": "${escapeStringForJson(cep)}",
  "cidade": "${escapeStringForJson(cidade)}",
  "estado": "${escapeStringForJson(estado)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SalvarCep',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:HlHQOxlZ/UpsertCEP',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiXanoTrocarSenhaCall {
  static Future<ApiCallResponse> call({
    String? xanoAuthToken = '',
    String? senhaAtual = '',
    String? senhaNova = '',
    String? senhaNova2 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "senhaAtual": "${escapeStringForJson(senhaAtual)}",
  "senhaNova": "${escapeStringForJson(senhaNova)}",
  "senhaNova2": "${escapeStringForJson(senhaNova2)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiXanoTrocarSenha',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:HlHQOxlZ/trocarSenha',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${xanoAuthToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VcepCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'vcep',
      apiUrl: 'https://viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddProdutoCall {
  static Future<ApiCallResponse> call({
    String? nome = '',
    String? descricao = '',
    int? qtdDisp,
    String? preco = '',
    bool? precisaProduzir,
    String? foto = '',
  }) async {
    final ffApiRequestBody = '''
{
  "nome": "${escapeStringForJson(nome)}",
  "descricao": "${escapeStringForJson(descricao)}",
  "qtd_disp": ${qtdDisp},
  "preco": "${escapeStringForJson(preco)}",
  "precisa_produzir": ${precisaProduzir},
  "foto": "${escapeStringForJson(foto)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addProduto',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:HlHQOxlZ/produto',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiXanoBuscaProdutoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'apiXanoBuscaProduto',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:HlHQOxlZ/produto_teste',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[*].nome''',
      ));
  static List<int>? preco(dynamic response) => (getJsonField(
        response,
        r'''$[*].preco''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? foto(dynamic response) => (getJsonField(
        response,
        r'''$[*].foto.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic? item(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
      );
}

class ApiXanoBuscaProdutoCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'apiXanoBuscaProduto Copy',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:HlHQOxlZ/produto_teste',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[*].nome''',
      ));
  static List<int>? preco(dynamic response) => (getJsonField(
        response,
        r'''$[*].preco''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? foto(dynamic response) => (getJsonField(
        response,
        r'''$[*].foto.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic? item(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
      );
  static List<String>? descricao(dynamic response) => (getJsonField(
        response,
        r'''$[*].descricao''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
