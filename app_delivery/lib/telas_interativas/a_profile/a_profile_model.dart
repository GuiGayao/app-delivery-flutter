import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'a_profile_widget.dart' show AProfileWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AProfileModel extends FlutterFlowModel<AProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (SalvarCep)] action in Button widget.
  ApiCallResponse? apiResultp3b;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for cepp widget.
  FocusNode? ceppFocusNode;
  TextEditingController? ceppTextController;
  late MaskTextInputFormatter ceppMask;
  String? Function(BuildContext, String?)? ceppTextControllerValidator;
  // Stores action output result for [Backend Call - API (vcep)] action in Buscar widget.
  ApiCallResponse? apiviacp;
  // State field(s) for TextEndereco widget.
  FocusNode? textEnderecoFocusNode;
  TextEditingController? textEnderecoTextController;
  String? Function(BuildContext, String?)? textEnderecoTextControllerValidator;
  // State field(s) for TextEstado widget.
  FocusNode? textEstadoFocusNode;
  TextEditingController? textEstadoTextController;
  String? Function(BuildContext, String?)? textEstadoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    ceppFocusNode?.dispose();
    ceppTextController?.dispose();

    textEnderecoFocusNode?.dispose();
    textEnderecoTextController?.dispose();

    textEstadoFocusNode?.dispose();
    textEstadoTextController?.dispose();
  }
}
