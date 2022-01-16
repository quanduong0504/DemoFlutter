import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/product.dart';
import 'package:exercise_example/widgets/material_textfield.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  final Production? _production;

  AddProductScreen(this._production);

  final _titleEditingController = TextEditingController();
  final _subTitleEditingController = TextEditingController();
  final _nameEditingController = TextEditingController();
  final _priceEditingController = TextEditingController();

  final _titleValidateKey = GlobalKey<FormState>();
  final _subTitleValidateKey = GlobalKey<FormState>();
  final _nameValidateKey = GlobalKey<FormState>();
  final _priceValidateKey = GlobalKey<FormState>();

  final _titleValidatorKey = GlobalKey<MaterialTextFormFieldState>();

  @override
  State<StatefulWidget> createState() {
    if(this._production != null) {
      _titleEditingController.text = this._production!.title;
      _subTitleEditingController.text = this._production!.subTitle;
      _nameEditingController.text = this._production!.name;
      _priceEditingController.text = this._production!.price;
    }
    return _AddProductState();
  }
}

class _AddProductState extends BaseState<AddProductScreen> {
  final _priceKey = GlobalKey<MaterialTextFormFieldState>();

  Production _getProductFromInput() {
    return Production(
        widget._production == null ? 0 : widget._production!.id,
        widget._titleEditingController.text, widget._subTitleEditingController.text,
        widget._nameEditingController.text, widget._priceEditingController.text);
  }
  
  void _onValidateInput() {
    final isValidatorTitle = widget._titleValidateKey.currentState!.validate();
    final isValidatorSubTitle = widget._subTitleValidateKey.currentState!.validate();
    final isValidatorName = widget._nameValidateKey.currentState!.validate();
    // final isValidatorPrice = widget._priceValidateKey.currentState!.validate();
    final isValidatorPrice = _priceKey.currentState?.validator() ?? false;

    if(isValidatorTitle && isValidatorSubTitle && isValidatorName && isValidatorPrice) {
      Navigator.pop(context, _getProductFromInput());
    } else {
      showSnackBar('You need to enter enough information');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._production == null ? 'Create item' : 'Update Item')
      ),
      body: Center(
        child: Card(
            margin: EdgeInsets.all(12),
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                      widget._production == null ? 'Add product to cart' : 'Update product to cart',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Form(
                    key: widget._titleValidateKey,
                    child: TextFormField(
                      controller: widget._titleEditingController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Title'
                      ),
                      validator: (value) => _onValidate(value, 'Title is required'),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Form(
                    key: widget._subTitleValidateKey,
                    child: TextFormField(
                      controller: widget._subTitleEditingController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Subtitle'
                      ),
                      validator: (value) => _onValidate(value, 'SubTitle is required'),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Form(
                    key: widget._nameValidateKey,
                    child: TextFormField(
                      controller: widget._nameEditingController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Name'
                      ),
                      validator: (value) => _onValidate(value, 'Name is required'),
                    ),
                  )
                ),
                MaterialTextFormField(
                    inputStyle: InputStyle.UNDERLINE,
                    textHint: 'Price',
                    textError: 'Price is required',
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    key: _priceKey),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                //   child: Form(
                //     key: widget._priceValidateKey,
                //     child: TextFormField(
                //       keyboardType: TextInputType.number,
                //       controller: widget._priceEditingController,
                //       decoration: const InputDecoration(
                //           border: UnderlineInputBorder(),
                //           labelText: 'Price'
                //       ),
                //       validator: (value) => _onValidate(value, 'Price is required'),
                //     ),
                //   )
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  child: OutlinedButton(onPressed: () {
                    _onValidateInput();
                  }, child: Text(widget._production == null ? 'Create' : 'Update')),
                )
              ],
            )
        )
      )
    );
  }

  String? _onValidate(String? value, String msgError) {
    if(value == null || value.isEmpty) {
      return msgError;
    }

    return null;
  }
}