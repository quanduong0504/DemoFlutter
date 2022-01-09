import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/product.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  final Production? _production;

  AddProductScreen(this._production);

  final _titleEditingController = TextEditingController();
  final _subTitleEditingController = TextEditingController();
  final _nameEditingController = TextEditingController();
  final _priceEditingController = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    if(this._production != null) {
      _titleEditingController.text = this._production!.title;
      _subTitleEditingController.text = this._production!.subTitle;
      _nameEditingController.text = this._production!.name;
      _priceEditingController.text = this._production!.price;
    }
    return _AddProductScreen();
  }
}

class _AddProductScreen extends WidgetBase<AddProductScreen> {

  Production _getProductFromInput() {
    return Production(
        widget._production == null ? 0 : widget._production!.id,
        widget._titleEditingController.text, widget._subTitleEditingController.text,
        widget._nameEditingController.text, widget._priceEditingController.text);
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
                  child: Text('Add product to cart', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    controller: widget._titleEditingController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Title'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    controller: widget._subTitleEditingController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Subtitle'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    controller: widget._nameEditingController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Name'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    controller: widget._priceEditingController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Price'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  child: OutlinedButton(onPressed: () {
                    Navigator.pop(context, _getProductFromInput());
                  }, child: Text(widget._production == null ? 'Create' : 'Update')),
                )
              ],
            )
        )
      )
    );
  }
}