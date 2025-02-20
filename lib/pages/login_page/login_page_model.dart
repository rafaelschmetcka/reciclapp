import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for tfEmail widget.
  FocusNode? tfEmailFocusNode;
  TextEditingController? tfEmailTextController;
  String? Function(BuildContext, String?)? tfEmailTextControllerValidator;
  String? _tfEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '81obsvwh' /* Insira seu email */,
      );
    }

    return null;
  }

  // State field(s) for tfSenha widget.
  FocusNode? tfSenhaFocusNode;
  TextEditingController? tfSenhaTextController;
  late bool tfSenhaVisibility;
  String? Function(BuildContext, String?)? tfSenhaTextControllerValidator;
  String? _tfSenhaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0ahkacp1' /* Insira sua senha */,
      );
    }

    return null;
  }

  // State field(s) for cadName widget.
  FocusNode? cadNameFocusNode;
  TextEditingController? cadNameTextController;
  String? Function(BuildContext, String?)? cadNameTextControllerValidator;
  String? _cadNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6dz1w2x7' /* Insira seu nome */,
      );
    }

    return null;
  }

  // State field(s) for cadEmail widget.
  FocusNode? cadEmailFocusNode;
  TextEditingController? cadEmailTextController;
  String? Function(BuildContext, String?)? cadEmailTextControllerValidator;
  String? _cadEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eogpaom4' /* Insira um email */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'mdyhvf7z' /* Email inválido */,
      );
    }
    return null;
  }

  // State field(s) for cadCpf widget.
  FocusNode? cadCpfFocusNode;
  TextEditingController? cadCpfTextController;
  final cadCpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cadCpfTextControllerValidator;
  String? _cadCpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7hrzq4ty' /* Insira o CPF */,
      );
    }

    return null;
  }

  // State field(s) for cadPassword widget.
  FocusNode? cadPasswordFocusNode;
  TextEditingController? cadPasswordTextController;
  late bool cadPasswordVisibility;
  String? Function(BuildContext, String?)? cadPasswordTextControllerValidator;
  String? _cadPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kfjityyo' /* Insira uma senha */,
      );
    }

    return null;
  }

  // State field(s) for cadConfPassword widget.
  FocusNode? cadConfPasswordFocusNode;
  TextEditingController? cadConfPasswordTextController;
  late bool cadConfPasswordVisibility;
  String? Function(BuildContext, String?)?
      cadConfPasswordTextControllerValidator;
  String? _cadConfPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ppof36ca' /* Confirme sua senha */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  bool? dropDownValue;
  FormFieldController<bool>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    tfEmailTextControllerValidator = _tfEmailTextControllerValidator;
    tfSenhaVisibility = false;
    tfSenhaTextControllerValidator = _tfSenhaTextControllerValidator;
    cadNameTextControllerValidator = _cadNameTextControllerValidator;
    cadEmailTextControllerValidator = _cadEmailTextControllerValidator;
    cadCpfTextControllerValidator = _cadCpfTextControllerValidator;
    cadPasswordVisibility = false;
    cadPasswordTextControllerValidator = _cadPasswordTextControllerValidator;
    cadConfPasswordVisibility = false;
    cadConfPasswordTextControllerValidator =
        _cadConfPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    tfEmailFocusNode?.dispose();
    tfEmailTextController?.dispose();

    tfSenhaFocusNode?.dispose();
    tfSenhaTextController?.dispose();

    cadNameFocusNode?.dispose();
    cadNameTextController?.dispose();

    cadEmailFocusNode?.dispose();
    cadEmailTextController?.dispose();

    cadCpfFocusNode?.dispose();
    cadCpfTextController?.dispose();

    cadPasswordFocusNode?.dispose();
    cadPasswordTextController?.dispose();

    cadConfPasswordFocusNode?.dispose();
    cadConfPasswordTextController?.dispose();
  }
}
