import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

bool tamanhoValido(
  String texto,
  int tamanhoMinimo,
  int tamanhoMaximo,
) {
  return texto.length >= tamanhoMinimo && texto.length <= tamanhoMaximo;
}

bool textosIguais(
  String texto1,
  String texto2,
) {
  return texto1 == texto2;
}

bool cPFvalido(String cpf) {
  // Remoção dos pontos e do hífen.

  String cpfLimpo = '';

  for (int i = 0; i < cpf.length; i++) {
    String char = cpf[i];
    if (char != '.' && char != '-') {
      cpfLimpo += char;
    }
  }

  // Verificação da quantidade de dígitos.

  if (cpfLimpo.length != 11) {
    return false;
  }

  // Verificação se todos os dígitos são iguais.

  bool todosDigitosIguais = true;

  for (int i = 1; i < cpfLimpo.length; i++) {
    if (cpfLimpo[i] != cpfLimpo[0]) {
      todosDigitosIguais = false;
      break;
    }
  }

  if (todosDigitosIguais) {
    return false;
  }

  // Obtenção do primeiro dígito verificador.

  int soma = 0, i = 0;

  while (i < 9) {
    soma += int.parse(cpfLimpo[i]) * (10 - i);
    i++;
  }

  int resto = soma % 11;

  int dv1;

  if (resto < 2) {
    dv1 = 0;
  } else {
    dv1 = 11 - resto;
  }

  // Obtenção do segundo dígito verificador.

  soma = i = 0;

  while (i < 9) {
    soma += int.parse(cpfLimpo[i]) * (11 - i);
    i++;
  }

  soma += dv1 * 2;

  resto = soma % 11;

  int dv2;

  if (resto < 2) {
    dv2 = 0;
  } else {
    dv2 = 11 - resto;
  }

  return int.parse(cpfLimpo[9]) == dv1 && int.parse(cpfLimpo[10]) == dv2;
}

bool? validarEmail(String email) {
// Regex simples e eficiente para validação de email
  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

  return emailRegex.hasMatch(email.trim());
}
