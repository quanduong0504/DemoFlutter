
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class MaterialTextFormField extends StatefulWidget {
  final String textHint;
  final String textError;
  final EdgeInsets padding;
  final InputStyle inputStyle;
  bool isPassword = false;
  bool isShowEndIcon = false;

  MaterialTextFormField(
      {
        required this.inputStyle,
        required this.textHint,
        required this.textError,
        required this.padding,
        bool? isPassword,
        Key? key
      }
  ) : super(key: key) {
   this.isPassword = isPassword ?? false;
   this.isShowEndIcon = isPassword ?? false;
  }

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

  void _toggle() {
    setState(() {
      widget.isPassword = !widget.isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Form(
        key: _textFormKey,
        child: TextFormField(
          obscureText: widget.isPassword,
          enableSuggestions: false,
          autocorrect: false,
          controller: _textEditingController,
          decoration: InputDecoration(
              border: widget.inputStyle == InputStyle.UNDERLINE ? UnderlineInputBorder() : OutlineInputBorder(),
              labelText: widget.textHint,
              suffixIcon: widget.isShowEndIcon ? GestureDetector(
                onTap: () => _toggle(),
                child: Icon(widget.isPassword ? Icons.visibility : Icons.visibility_off)
              ) : null
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