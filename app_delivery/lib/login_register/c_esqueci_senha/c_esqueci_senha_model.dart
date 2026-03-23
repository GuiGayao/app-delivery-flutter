import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'c_esqueci_senha_widget.dart' show CEsqueciSenhaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CEsqueciSenhaModel extends FlutterFlowModel<CEsqueciSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for senhaAtual widget.
  FocusNode? senhaAtualFocusNode;
  TextEditingController? senhaAtualTextController;
  String? Function(BuildContext, String?)? senhaAtualTextControllerValidator;
  // State field(s) for senhaNova widget.
  FocusNode? senhaNovaFocusNode;
  TextEditingController? senhaNovaTextController;
  String? Function(BuildContext, String?)? senhaNovaTextControllerValidator;
  // State field(s) for senhaNova1 widget.
  FocusNode? senhaNova1FocusNode;
  TextEditingController? senhaNova1TextController;
  String? Function(BuildContext, String?)? senhaNova1TextControllerValidator;
  // Stores action output result for [Backend Call - API (apiXanoTrocarSenha)] action in Button widget.
  ApiCallResponse? retTrocarSenha;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    senhaAtualFocusNode?.dispose();
    senhaAtualTextController?.dispose();

    senhaNovaFocusNode?.dispose();
    senhaNovaTextController?.dispose();

    senhaNova1FocusNode?.dispose();
    senhaNova1TextController?.dispose();
  }
}
