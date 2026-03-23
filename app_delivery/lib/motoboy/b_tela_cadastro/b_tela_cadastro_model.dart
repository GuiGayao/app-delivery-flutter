import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'b_tela_cadastro_widget.dart' show BTelaCadastroWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BTelaCadastroModel extends FlutterFlowModel<BTelaCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode1;
  TextEditingController? textFieldEmailTextController1;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController1Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode2;
  TextEditingController? textFieldEmailTextController2;
  late MaskTextInputFormatter textFieldEmailMask2;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController2Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode3;
  TextEditingController? textFieldEmailTextController3;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController3Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode4;
  TextEditingController? textFieldEmailTextController4;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController4Validator;
  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode1;
  TextEditingController? textFieldSenhaTextController1;
  String? Function(BuildContext, String?)?
      textFieldSenhaTextController1Validator;
  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode2;
  TextEditingController? textFieldSenhaTextController2;
  String? Function(BuildContext, String?)?
      textFieldSenhaTextController2Validator;
  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode3;
  TextEditingController? textFieldSenhaTextController3;
  late MaskTextInputFormatter textFieldSenhaMask3;
  String? Function(BuildContext, String?)?
      textFieldSenhaTextController3Validator;
  // Stores action output result for [Backend Call - API (apiXanoCadastroUsuario)] action in Button_Cadastrar widget.
  ApiCallResponse? apiCadastroUsuarioXano;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldEmailFocusNode1?.dispose();
    textFieldEmailTextController1?.dispose();

    textFieldEmailFocusNode2?.dispose();
    textFieldEmailTextController2?.dispose();

    textFieldEmailFocusNode3?.dispose();
    textFieldEmailTextController3?.dispose();

    textFieldEmailFocusNode4?.dispose();
    textFieldEmailTextController4?.dispose();

    textFieldSenhaFocusNode1?.dispose();
    textFieldSenhaTextController1?.dispose();

    textFieldSenhaFocusNode2?.dispose();
    textFieldSenhaTextController2?.dispose();

    textFieldSenhaFocusNode3?.dispose();
    textFieldSenhaTextController3?.dispose();
  }
}
