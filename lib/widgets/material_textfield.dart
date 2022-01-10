
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class MaterialTextFormField extends StatefulWidget {
  final _textEditingController = TextEditingController();
  final _textFormKey = GlobalKey<FormState>();
  final String textHint;
  final String textError;

  MaterialTextFormField({required this.textHint, required this.textError});

  @override
  State<StatefulWidget> createState() {
    return MaterialTextFormFieldState();
  }
}

class MaterialTextFormFieldState extends WidgetBase<MaterialTextFormField> {
  bool validator() {
    return widget._textFormKey.currentState!.validate();
  }

  String getText() {
    return widget._textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._textFormKey,
      child: TextFormField(
        controller: widget._textEditingController,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: widget.textHint
        ),
        validator: (value) {
          if(value == null || value.isEmpty) {
            return widget.textError;
          }

          return null;
        },
      ),
    );
  }
}