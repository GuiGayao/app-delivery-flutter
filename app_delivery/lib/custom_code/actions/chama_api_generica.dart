// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';

// AÇÃO CUSTOMIZADA: chamaApiGenerica
// Objetivo: Executar uma requisição HTTP genérica (GET, POST, PUT, DELETE)
// e retornar o resultado (sucesso ou falha) em formato de Map/JSON.

Future<dynamic> chamaApiGenerica(
  String urlEndpoint,
  String metodoHttp,
  dynamic cabecalhosPersonalizados, // JSON do FlutterFlow (Map)
  dynamic corpoRequisicao, // JSON do FlutterFlow (Map)
) async {
  // -----------------------------------------------------------
  // 1) PREPARAÇÃO DA REQUISIÇÃO
  // -----------------------------------------------------------

  // Converte a URL String para o objeto Uri
  final uri = Uri.parse(urlEndpoint);
  http.Response resposta; // Variável para armazenar a resposta da requisição

  // Prepara os CABEÇALHOS (HEADERS)
  // Adiciona o Content-Type padrão e, em seguida, os headers personalizados.
  Map<String, String> cabecalhosFinais = {
    HttpHeaders.contentTypeHeader: 'application/json',
    // Converte cabecalhosPersonalizados para Map<String, String>
    // Se for nulo, usa um Map vazio: {}.
    ...Map.from(cabecalhosPersonalizados ?? {})
        .map((chave, valor) => MapEntry(chave.toString(), valor.toString())),
  };

  // Prepara o CORPO (BODY) da requisição
  // Converte o Map/JSON do FlutterFlow para uma String JSON, apenas se houver um corpo
  final String? corpo =
      (corpoRequisicao != null) ? jsonEncode(corpoRequisicao) : null;

  // -----------------------------------------------------------
  // 2) EXECUÇÃO DA REQUISIÇÃO
  // -----------------------------------------------------------

  try {
    // Verifica qual método HTTP deve ser executado
    switch (metodoHttp.toUpperCase()) {
      case 'GET':
        resposta = await http.get(uri, headers: cabecalhosFinais);
        break;

      case 'POST':
        resposta = await http.post(uri, headers: cabecalhosFinais, body: corpo);
        break;

      case 'PUT':
        resposta = await http.put(uri, headers: cabecalhosFinais, body: corpo);
        break;

      case 'DELETE':
        resposta = await http.delete(uri, headers: cabecalhosFinais);
        break;

      default:
        // Retorno de erro caso o método não seja válido
        return {
          'sucesso': false,
          'mensagem': 'Método HTTP inválido: $metodoHttp',
          'codigoStatus': 400,
        };
    }

    // -----------------------------------------------------------
    // 3) TRATAMENTO DA RESPOSTA
    // -----------------------------------------------------------

    // Tenta decodificar o corpo da resposta
    dynamic corpoResposta;

    try {
      corpoResposta = jsonDecode(resposta.body);
    } catch (_) {
      // Caso a resposta não seja um JSON (ex: erro de servidor simples)
      corpoResposta = {'dados_brutos': resposta.body};
    }

    // Verifica se o status code está na faixa de sucesso (200 a 299)
    if (resposta.statusCode >= 200 && resposta.statusCode < 300) {
      // SUCESSO!
      // Adicionamos 'sucesso' e 'codigoStatus' ao Map para facilitar o uso no FlutterFlow.
      if (corpoResposta is Map) {
        corpoResposta['sucesso'] = true;
        corpoResposta['codigoStatus'] = resposta.statusCode;
      }
      // Retorna o Map/JSON (que pode conter o 'authToken')
      return corpoResposta;
    } else {
      // FALHA (Erros 4xx ou 5xx)
      // Tenta encontrar uma mensagem de erro no corpo da resposta
      String mensagemErro = 'Falha na API. Status: ${resposta.statusCode}';

      if (corpoResposta is Map && corpoResposta.containsKey('message')) {
        mensagemErro = corpoResposta['message'];
      }

      return {
        'sucesso': false,
        'mensagem':
            mensagemErro, // Mensagem de erro do Xano (ex: 'Email já existe')
        'codigoStatus': resposta.statusCode,
        'corpoErro': corpoResposta, // O corpo do erro completo para debug
      };
    }
  } on SocketException {
    // -----------------------------------------------------------
    // 4) TRATAMENTO DE ERRO DE REDE (Sem conexão)
    // -----------------------------------------------------------

    return {
      'sucesso': false,
      'mensagem': 'Erro de rede. Verifique sua conexão com a internet.',
      'codigoStatus': 503,
    };
  } catch (e) {
    // -----------------------------------------------------------
    // 5) TRATAMENTO DE OUTRAS EXCEÇÕES (Erros de parsing etc.)
    // -----------------------------------------------------------

    return {
      'sucesso': false,
      'mensagem': 'Ocorreu um erro inesperado: ${e.toString()}',
      'codigoStatus': 500,
    };
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
