
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class MaterialTextFormField extends StatefulWidget {
  final String textHint;
  final String textError;
  final EdgeInsets padding;
  final InputStyle inputStyle;

  MaterialTextFormField(
      {
        required this.inputStyle,
        required this.textHint,
        required this.textError,
        required this.padding,
        bool? isPassword,
        Key? key
      }
  ) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MaterialTextFormFieldState();
  }
}

class MaterialTextFormFieldState extends BaseState<MaterialTextFormField> {
  final _textEditingController = TextEditingController();
  final _textFormKey = GlobalKey<FormState>();

  bool validator() {
    return _textFormKey.currentState?.validate() ?? false;
  }

  String getText() {
    return _textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Form(
        key: _textFormKey,
        child: TextFormField(
          // obscureText: ,
          enableSuggestions: false,
          autocorrect: false,
          controller: _textEditingController,
          decoration: InputDecoration(
              border: widget.inputStyle == InputStyle.UNDERLINE ? UnderlineInputBorder() : OutlineInputBorder(),
              labelText: widget.textHint
          ),
          validator: (value) => _onValidate(value),
        ),
      )
    );
  }

  String? _onValidate(String? value) {
    if(value == null || value.isEmpty) {
      return widget.textError;
    }

    return null;
  }
}

enum InputStyle {
  UNDERLINE,
  OUTLINE
}